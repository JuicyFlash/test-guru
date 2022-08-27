class FeedBackController < ApplicationController

  def create
    unless params[:message].nil?
      FeedBackMailer.send_feed_back(current_user, params[:message]).deliver_now
      redirect_to root_path, { notice: 'Сообщение отправлено'  }
    end
  end
end
