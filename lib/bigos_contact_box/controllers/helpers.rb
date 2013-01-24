module BigosContactBox
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      def bigos_contact_box_widget

        if BigosSettings::Settings.contact_use_widget_mailer_settings
          ActionMailer::Base.delivery_method = :smtp
          ActionMailer::Base.raise_delivery_errors = true
          ActionMailer::Base.perform_deliveries = true
          ActionMailer::Base.default :charset => "utf-8"
          ActionMailer::Base.default_url_options = { :host => BigosSettings::Settings.contact_domain }

          ActionMailer::Base.smtp_settings = {
            :address              => BigosSettings::Settings.contact_address_name.to_s,
            :port                 => BigosSettings::Settings.contact_port.to_i,
            :user_name            => BigosSettings::Settings.contact_user_name.to_s,
            :password             => BigosSettings::Settings.contact_password.to_s,
            :authentication       => "plain",
            :enable_starttls_auto => true,
            :domain               => BigosSettings::Settings.contact_domain.to_s
          }
        end
        @message = BigosContactBox::Message.new
        render :partial=>"bigos_contact_box/module/widget", :locals=>{:message => @message}
      end
    end
  end
end
