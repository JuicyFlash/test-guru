class TestsController < ApplicationController

  before_action :find_test, only: %i[show]
  before_action :all_test, only: %i[index]

  def show; end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def all_test
    @tests = Test.all
  end
end
