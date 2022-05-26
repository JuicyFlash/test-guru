class ProcessedTestsController < ApplicationController

  before_action :set_processed_test, only: %i[show update result gist]

  def show

  end

  def result

  end

  def update
    @processed_test.accept!(params[:answer_ids])
    if @processed_test.completed?
      TestsMailer.completed_test(@processed_test).deliver_now
      redirect_to result_processed_test_path(@processed_test)
    else
      render :show
    end
  end

  def gist
    result = GistQuestionService.new(@processed_test.current_question).call

      if result.success?
         flash_options = { notice: t('.gist_success', url: result.gist_url)  }
         current_user.author_gists.new(question:@processed_test.current_question, url:result.gist_url).save
      else
       flash_options = { alert: t('.gist_failure') }
      end
    redirect_to @processed_test, flash_options

  end

  private

  def set_processed_test
    @processed_test = ProcessedTest.find(params[:id])
  end

end
