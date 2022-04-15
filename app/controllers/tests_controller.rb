class TestsController < ApplicationController

  before_action :find_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show; end

  def start
    @user = current_user
    @user.tests.push(@test)
    redirect_to @user.processed_test(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
