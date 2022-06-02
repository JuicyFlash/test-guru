class Gist < ApplicationRecord

  belongs_to :question
  belongs_to :author, class_name: "User" , foreign_key: :author_id

  def gist_question_title
    question.body.truncate(25)
  end

  def gist_hash
    uri = URI.parse(url)
    uri.path.slice(1..uri.path.length-1)
  end

end
