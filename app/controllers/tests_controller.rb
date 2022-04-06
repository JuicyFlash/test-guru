class TestsController < ApplicationController

  def index
    @tests = Test.all
  end

  def show
    @test = Test.find(params[:id])
  end

  def start
    @test = Test.find(params[:id])
    @user = User.first
    @user.tests.push(@test)
    redirect_to @user.processed_test(@test)
  end

end
