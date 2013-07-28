class MessagesController < ApplicationController
 before_filter :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
  	@message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = "Message sent!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @message.destroy
    redirect_to root_url
  end

  private

    def message_params
      params.require(:message).permit(:content)
    end

    def correct_user
      @message = current_user.messages.find_by(id: params[:id])
      redirect_to root_url if @message.nil?
    end

end