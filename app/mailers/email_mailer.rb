class EmailMailer < ApplicationMailer
  require 'securerandom'
  default from: "from@test_app.com"
  
    def send_email(email)
      @questioner = User.find(email[:questioner_id]).email
      @listener = User.find(email[:listener_id]).email
      @question =  email[:question]
      @senders = email[:sender_ids].reject! { |c| c.empty? }

      @senders.each do |sender|
        user = User.find(sender)
        @random_key = SecureRandom.hex

        @shorten_link = "https://ques-era.herokuapp.com/reply/" + @random_key
        #@shorten_link = "localhost:3000/reply/" + @random_key
        Sender.create(:email_id => email.id, :user_id => user.id, :unique_key => @random_key)
        mail(to: user.email, subject: 'Please answer the Question') #if @listener != user.username
      end
    end

end
