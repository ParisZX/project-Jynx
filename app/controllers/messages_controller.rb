class MessagesController < ApplicationController
  before_action :signed_in_user
  before_action :set_user
  before_action :correct_user

  def index
    @all_messages = current_user.received_messages + current_user.sent_messages
    @all_messages = @all_messages.uniq
    if @all_messages.any?
      if @all_messages.count > 10 
        @all_messages = @all_messages[-10..-1]
      end
      @all_messages = @all_messages.sort_by { |id , s_id, r_id, s_del, r_del, body, r_at, con, cr_at, up_at| id }
      other_user_ids = (current_user.received_messages.pluck(:sender_id) + current_user.sent_messages.pluck(:recepient_id)).uniq
      @other_users = Array.new
      other_user_ids.each do |x| 
        @other_users.push(User.find_by_id(x))
      end
    end
  end

  def new
    @message = Message.new
    if params[:reply_to]
      @reply_to = User.find_by_id(params[:reply_to])
      unless @reply_to.nil?
        @message.recepient_id = @reply_to.id
      end
    end
  end
  
  def create
    @message = Message.new(message_params)
    @message.sender_id = @user.id
    if @message.save
      flash[:notice] = "Message has been sent"
      redirect_to user_messages_path(@user)
    else
      render :action => :new
    end
  end

  def show
    @message = Message.readingmessage(params[:id],@user.id)
  end
  
  def delete_multiple
      if params[:delete]
        params[:delete].each { |id|
          @message = Message.find(id)
          @message.mark_message_deleted(@message.id,@user.id) unless @message.nil?
        }
        flash[:notice] = "Messages deleted"
      end
      redirect_to user_messages_path(@user, @messages)
  end
  
  private
    def set_user
      @user = current_user
    end
    
    def correct_user
      @user = User.find(params[:user_id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def message_params
      params.require(:message).permit(:body, 
                                      :recepient_id)
    end

end
