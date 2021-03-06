class ReplyController < ApplicationController

  def ask_answer
    @sender = Sender.where(:unique_key => params[:link]).first
    if @sender.nil?
      flash[:notice] = "Invalid Token"
      redirect_to sorry_path
    else
      email = Email.find(@sender.email_id)
      @question = email.question
    end
  end
  
  def submit_answer
     @sender = Sender.find(params[:sender][:id])
     @sender.update_attributes(:reply => params[:sender][:reply])

     redirect_to thanks_path
  end

  def thanks_message
  end

  def sorry_message
  end
end
