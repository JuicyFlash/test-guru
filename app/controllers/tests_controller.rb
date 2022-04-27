class TestsController < ApplicationController

  before_action :find_test, only: %i[start]

  def index
    redirect_to admin_tests_path if current_user.is_a?(Admin)
    @tests = Test.all
  end

  # def show; end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.processed_test(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

end
