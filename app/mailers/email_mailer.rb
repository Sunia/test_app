class EmailMailer < ApplicationMailer

  default from: "from@test_app.com"
  
    def send_email(email)
      @questioner = User.find(email[:questioner_id]).username
      @listener_obj = User.find(email[:listener_id])
      @listener = @listener_obj.username
      @question =  email[:question]
      @senders = email[:sender_ids].reject! { |c| c.empty? }

      @senders.each do |sender|
        user = User.find(sender)
        mail(to: user.email, subject: 'Please answer the Question') #if @listener_obj.username != user.username
      end
    end

end
