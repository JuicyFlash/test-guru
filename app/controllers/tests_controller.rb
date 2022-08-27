class TestsController < ApplicationController

  before_action :find_test, only: %i[start]

  def index
    @tests = Test.ready
  end

  def start
    if @test.questions.count > 0
      current_user.tests.push(@test)
      redirect_to current_user.processed_test(@test)
    else
      redirect_to root_path, { alert: 'В тесте нет вопросов'  }
    end
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
