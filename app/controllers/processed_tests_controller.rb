class ProcessedTestsController < ApplicationController

  before_action :set_processed_test, only: %i[show update result]

  def show

  end

  def result

  end

  def update
    @processed_test.accept!(params[:answer_ids])
    if @processed_test.completed?
      TestsMailer.completed_test(@processed_test).deliver_now
      redirect_to result_processed_test_path(@processed_test)
    else
      render :show
    end
  end

  private

  def set_processed_test
    @processed_test = ProcessedTest.find(params[:id])
  end

end
