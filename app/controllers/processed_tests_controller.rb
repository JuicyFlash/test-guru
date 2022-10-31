class ProcessedTestsController < ApplicationController

  before_action :set_processed_test, only: %i[show update result gist]

  def show

  end

  def result
    @badges = BadgeService.new(@processed_test).call
  end

  def update
    unless params[:answer_ids].nil?
    @processed_test.accept!(params[:answer_ids])
    if @processed_test.completed?
      TestsMailer.completed_test(@processed_test).deliver_now
      redirect_to result_processed_test_path(@processed_test)
    else
      render :show
    end
    else
      redirect_to @processed_test, { notice: 'Не выбран вариант ответа'  }
    end
  end

  def gist
    gist_service = GistQuestionService.new(@processed_test.current_question)
    gist_service.call

      if gist_service.success?
         flash_options = { notice: t('.gist_success', url: gist_service.gist_url)  }
         current_user.author_gists.create(question:@processed_test.current_question, url:gist_service.gist_url)
      else
       flash_options = { alert: t('.gist_failure') }
      end
    redirect_to @processed_test, flash_options

  end

  private

  def set_processed_test
    @processed_test = ProcessedTest.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, { alert: 'Процесс прохождения теста завершён'  }
  end

end
