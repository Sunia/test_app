class EmailMailer < ApplicationMailer

  default from: "from@test_app.com"
  
    def send_email(email)
      attachments.inline['player.jpeg'] = File.read(Rails.root.join('app/assets/images/player.jpeg'))
      mail(to: email, subject: 'Hi there')
    end

end
