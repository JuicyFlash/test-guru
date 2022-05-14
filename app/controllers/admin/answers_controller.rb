class Admin::AnswersController < Admin::BaseController

  before_action :find_question, only: %i[create new]
  before_action :find_answer, only: %i[show destroy edit update]
  before_action :set_question, only: %i[show destroy edit]

  def show; end

  def create
    @answer = @question.answers.new(answer_params)
    if @answer.save
      redirect_to [:admin, @question]
    else
      render :new
    end
  end

  def new
    @answer = @question.answers.new
  end

  def edit; end

  def destroy
    @answer.destroy
    redirect_to [:admin, @question]
  end

  def update
    if @answer.update(answer_params)
      redirect_to [:admin, @answer.question]
    else
      render :edit
    end
  end

  private

  def set_question
    @question = @answer.question
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end

end
