class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def client
    @client
  end

  def call
    client.create_gist(gist_params)
  end

  def success?
    return false if client.last_response.nil?
    client.last_response.status == 201
  end

  def gist_url
    return nil if client.last_response.nil?
    client.last_response.data.html_url
  end

  private

  def gist_params
    {
      description: I18n.t('.gist_description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
