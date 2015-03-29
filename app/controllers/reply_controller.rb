class ReplyController < ApplicationController

  def ask_answer
    @sender = Sender.find_by_unique_key(params[:link])
    email = Email.find(@sender.email_id)
    @question = email.question
  end
  
  def submit_answer
     @sender = Sender.find(params[:sender][:id])
     @sender.update_attributes(:reply => params[:sender][:reply])

     redirect_to thanks_path
  end

  def thanks_message
  end

end
