## BigosContactBox
Widget with contact form and google map.

## Installation

BigosContactBox works with Rails 3.1 onwards. You can add it to your Gemfile with:

```ruby
gem "bigos_contact_box", :git=>"git://github.com/kremenso/bigos_contact_box.git"
```

Run the bundle command to install it.

After you install BigosContactBox and add it to your Gemfile, you need to run the generator:

```console
rails generate bigos_contact_box:install
```

You have to add this line in layout, where widget will be displaying:

```ruby
  <%= javascript_include_tag "http://maps.googleapis.com/maps/api/js?sensor=true" %>
```


If You want displaying message after send email You have to add this line in view after redirect:

```ruby
<%= flash[:notice] unless flash[:notice].blank? %>
```


## Configuration

```ruby

BigosContactBox.setup do |config|
  config.use_widget_mailer_settings = false
    config.address_name = "smtp.gmail.com"
    config.port = 587
    config.domain = "yourdomain.dev"
    config.user_name = "from@yourdomain.dev"
    config.password = "Super-Secure-Password"
  config.location = ["latitude", "longitude"]
  config.invalid_fields_error = "Invalid Fields"
  config.success_message = "Message sent successfully"
  config.location_name = "Location name"
  config.redirect_path = ""     #if blank redirect to root_path
  config.map_zoom = ""          #if blank is 14
  config.marker_icon_src = ""   #blank is default
end

```


## Customization

You can use to generate view you can overwrite
```console
rails generate bigos_contact_box:views
```

### Usage

In your view add (ERB):
```ruby
<%= bigos_contact_box_widget %>
```

