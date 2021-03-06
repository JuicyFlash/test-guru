class Admin::QuestionsController < Admin::BaseController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_questions_not_found

  before_action :find_test, only: %i[create new]
  before_action :find_question, only: %i[show destroy edit update]
  # Список всех вопросов теста
  # /tests/:id/questions/
  #def index
  # render plain: @test.questions.pluck(:body)
  #end

  # Просмотр конкретного вопроса
  # /questions/:id
  def show; end

  def create
    question = @test.questions.new(question_params)
    if question.save
      redirect_to admin_test_path(@test)
    else
      render :new
     end
  end

  def new
    @question = Question.new
  end

  # Удаление вопроса
  # /questions/:id
  def destroy
    @question.destroy
    redirect_to admin_test_path(@question.test_id)
  end

  def edit; end

  def update
    if @question.update(question_params)
      redirect_to admin_test_path(@question.test_id)
    else
      render :edit
    end
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
