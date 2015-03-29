class EmailMailer < ApplicationMailer

  default from: "from@test_app.com"
  
    def send_email(email)
      #attachments.inline['player.jpeg'] = File.read(Rails.root.join('app/assets/images/player.jpeg'))
      @questioner = User.find(email[:questioner_id]).username
      @listener_obj = User.find(email[:listener_id])
      @listener = @listener_obj.username
      @question =  email[:question]
     
      User.all.each do |user|
        mail(to: user.email, subject: 'Please answer the Question') if @listener_obj.username != user.username
      end
    end

end
