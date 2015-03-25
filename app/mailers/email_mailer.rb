class EmailMailer < ApplicationMailer

  default from: "from@test_app.com"
  
    def send_email(email)
     #attachments.inline['player.jpeg'] = File.read(Rails.root.join('app/assets/images/player.jpeg'))
      
      User.all.each do |user|
        @questioner_email = User.find(email[:questioner_id]).email
        @listener_email = User.find(email[:listener_id]).email
        @question = Question.find(email[:question_id]).description
        mail(to: user.email, subject: 'Hi Its #{@questioner_email}')
      end
    end

end
