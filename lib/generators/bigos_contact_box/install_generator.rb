module BigosContactBox
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)

      desc "Creates a BigosContactBox initializer."
      def copy_initializer
        template "bigos_contact_box.rb", "config/initializers/bigos_contact_box.rb"
      end

      def include_js
        insert_into_file "app/assets/javascripts/application.js", :after => %r{//= require +['"]?jquery_ujs['"]?} do
		      "\n//= require 'bigos_contact_box/bigos_contact_box'"
		    end
      end

      def include_routes
        route 'mount BigosContactBox::Engine => "/bigos_contact_box"'
      end

      def create_settings
        Setting.use_widget_mailer_settings = false
        Setting.use_widget_mailer_settings = false
        Setting.address_name = "smtp.gmail.com"
        Setting.port = 587
        Setting.domain = "yourdomain.dev"
        Setting.user_name = "from@yourdomain.dev"
        Setting.password = "Super-Secure-Password"
        Setting.location = ["latitude", "longitude"]
        Setting.invalid_fields_error = "Invalid Fields"
        Setting.success_message = "Message sent successfully"
        Setting.location_name = "Location name"
        Setting.redirect_path = ""
        Setting.map_zoom = ""
        Setting.marker_icon_src = ""
      end

    end
  end
end
