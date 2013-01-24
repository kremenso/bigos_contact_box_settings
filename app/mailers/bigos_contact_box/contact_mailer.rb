module BigosContactBox
class ContactMailer < ActionMailer::Base


  def custom_message(msg = nil)

    if msg != nil
      @message = msg
      mail(:to => BigosContactBox.user_name, :from => BigosContactBox.user_name, :subject => @message.subject)
    end
  end
  end
end
