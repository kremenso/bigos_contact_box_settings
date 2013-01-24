module BigosContactBox
class ContactMailer < ActionMailer::Base


  def custom_message(msg = nil)

    if msg != nil
      @message = msg
      mail(:to => BigosSettings::Settings.contact_user_name, :from => BigosSettings::Settings.contact_user_name, :subject => @message.subject)
    end
  end
  end
end
