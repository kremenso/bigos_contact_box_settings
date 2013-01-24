module BigosContactBox
  module Controllers
    module Helpers
      extend ActiveSupport::Concern

      def bigos_contact_box_widget()
        if BigosContactBox.use_widget_mailer_settings
          ActionMailer::Base.delivery_method = :smtp
          ActionMailer::Base.raise_delivery_errors = true
          ActionMailer::Base.perform_deliveries = true
          ActionMailer::Base.default :charset => "utf-8"
          ActionMailer::Base.default_url_options = { :host => BigosContactBox.domain.to_s }

          ActionMailer::Base.smtp_settings = {
            :address              => BigosContactBox.address_name.to_s,
            :port                 => BigosContactBox.port.to_i,
            :user_name            => BigosContactBox.user_name.to_s,
            :password             => BigosContactBox.password.to_s,
            :authentication       => "plain",
            :enable_starttls_auto => true,
            :domain               => BigosContactBox.domain.to_s
          }
        end
        @message = BigosContactBox::Message.new
        render :partial=>"bigos_contact_box/module/widget", :locals=>{:message => @message}
      end
    end
  end
end
