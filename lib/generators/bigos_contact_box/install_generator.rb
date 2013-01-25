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
        Setting["#{BigosContactBox.name}_use_widget_mailer_settings"] = false
        Setting["#{BigosContactBox.name}_use_widget_mailer_settings"] = false
        Setting["#{BigosContactBox.name}_address_name"] = "smtp.gmail.com"
        Setting["#{BigosContactBox.name}_port"] = 587
        Setting["#{BigosContactBox.name}_Setting.domain"] = "yourdomain.dev"
        Setting["#{BigosContactBox.name}_"] = "from@yourdomain.dev"
        Setting["#{BigosContactBox.name}_password"] = "Super-Secure-Password"
        Setting["#{BigosContactBox.name}_location"] = ["latitude", "longitude"]
        Setting["#{BigosContactBox.name}_invalid_fields_error"] = "Invalid Fields"
        Setting["#{BigosContactBox.name}_success_message"] = "Message sent successfully"
        Setting["#{BigosContactBox.name}_location_name"] = "Location name"
        Setting["#{BigosContactBox.name}_redirect_path"] = ""
        Setting["#{BigosContactBox.name}_map_zoom"] = ""
        Setting["#{BigosContactBox.name}_marker_icon_src"] = ""
      end

    end
  end
end
