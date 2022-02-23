class QuestionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_questions_not_found

  before_action :find_test, only: %i[index create]

  # Список всех вопросов теста
  # /tests/:id/questions/
  #def index
  # render plain: @test.questions.pluck(:body)
  #end

  # Просмотр конкретного вопроса
  # /questions/:id
  def show
    render plain: Question.find(params[:id]).body
  end

  def create
    Question.create(test_id: @test.id, body: params[:question][:body])
    redirect_to test_questions_path
  end

  # Удаление вопроса
  # /questions/:id
  def destroy
    Question.find(params[:id]).destroy
  end


  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def rescue_with_questions_not_found
    render plain: 'Вопросы не найдены'
  end

end
