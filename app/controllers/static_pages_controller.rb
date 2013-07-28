class StaticPagesController < ApplicationController
  def home
  	if signed_in?
      @message  = current_user.messages.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
