module BigosContactBox
class ContactMailer < ActionMailer::Base


  def custom_message(msg = nil)
    if msg != nil
      @message = msg
      mail(:to => Setting.user_name, :from => Setting.user_name, :subject => @message.subject)
    end
  end
  end
end
