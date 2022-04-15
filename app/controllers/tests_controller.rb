class TestsController < ApplicationController

  before_action :find_test, only: %i[show start]

  def index
    @tests = Test.all
  end

  def show; end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.processed_test(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
