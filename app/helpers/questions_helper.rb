module QuestionsHelper
  def question_header(action)
    case action
    when :create
      "Create New #{@test.title} Question"
    when :edit
      "Edit #{@test.title} Question"
    end
  end
  end
