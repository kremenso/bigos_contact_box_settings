require "bigos_contact_box/engine"

module BigosContactBox

  mattr_accessor :use_widget_mailer_settings
  @@use_widget_mailer_settings = false

  mattr_accessor :port
  @@port = nil

  mattr_accessor :address_name
  @@address_name = nil

  mattr_accessor :domain
  @@domain = nil

  mattr_accessor :user_name
  @@user_name = nil

  mattr_accessor :password
  @@password = nil

  mattr_accessor :location
  @@location = :nil

  mattr_accessor :invalid_fields_error
  @@invalid_fields_error = nil

  mattr_accessor :success_message
  @@success_message = nil

  mattr_accessor :location_name
  @@location_name = :nil

  mattr_accessor :redirect_path
  @@redirect_path = nil

  mattr_accessor :marker_icon_src
  @@marker_icon_src = nil

  mattr_accessor :map_zoom
  @@map_zoom = nil

  module Controllers
    autoload :Helpers, 'bigos_contact_box/controllers/helpers'
  end

  def self.setup
    include_helpers
    yield self
  end

  # Include helpers to AC and AV.
  def self.include_helpers
    ActiveSupport.on_load(:action_controller) do
    end

    ActiveSupport.on_load(:action_view) do
      include BigosContactBox::Controllers::Helpers
    end
  end

end


