module BigosContactBox
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a BigosContactBox initializer."
      #def copy_initializer
      #  template "bigos_contact_box.rb", "config/initializers/bigos_contact_box.rb"
      #end
      #
      def include_js
        insert_into_file "app/assets/javascripts/application.js", :after => %r{//= require +['"]?jquery_ujs['"]?} do
		      "\n//= require 'bigos_contact_box/bigos_contact_box'"
		    end
      end

      def include_routes
        route 'mount BigosContactBox::Engine => "/bigos_contact_box"'
      end

      def create_settings
        BigosSettings::Settings.contact_use_widget_mailer_settings = false
        BigosSettings::Settings.contact_address_name = "smtp.gmail.com"
        BigosSettings::Settings.contact_port = 587
        BigosSettings::Settings.contact_domain = "yourdomain.dev"
        BigosSettings::Settings.contact_user_name = "from@yourdomain.dev"
        BigosSettings::Settings.contact_password = "Super-Secure-Password"
        BigosSettings::Settings.contact_location = ["latitude", "longitude"]
        BigosSettings::Settings.contact_invalid_fields_error = "Invalid Fields"
        BigosSettings::Settings.contact_success_message = "Message sent successfully"
        BigosSettings::Settings.contact_location_name = "Location name"
        BigosSettings::Settings.contact_redirect_path = ""
        BigosSettings::Settings.contact_map_zoom = ""
        BigosSettings::Settings.contact_marker_icon_src = ""
      end

    end
  end
end
