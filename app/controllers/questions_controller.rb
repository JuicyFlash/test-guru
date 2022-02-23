class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_questions_not_found

  before_action :find_test, only: %i[index create]
  before_action :find_question, only: %i[show destroy]
  # Список всех вопросов теста
  # /tests/:id/questions/
  #def index
  # render plain: @test.questions.pluck(:body)
  #end

  # Просмотр конкретного вопроса
  # /questions/:id
  def show
    render plain: @question.body
  end

  def create
    question = @test.questions.new(question_params)
    if question.save
      render plain: 'Вопрос создан'
    else
      render plain: 'Не удалось создать новый вопрос'
     end
  end

  # Удаление вопроса
  # /questions/:id
  def destroy
    @question.destroy
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_questions_not_found
    render plain: 'Вопросы не найдены'
  end

end
