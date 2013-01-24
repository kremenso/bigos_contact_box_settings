module BigosContactBox
  class MessagesController < ActionController::Base

    def create
      @message = Message.new(params[:message])
      if @message.valid?
        ContactMailer.custom_message(@message).deliver
        redirect_to(BigosContactBox.redirect_path.blank? ? main_app.root_path: BigosContactBox.redirect_path, :notice => BigosContactBox.success_message)
      else
        flash.now.alert = BigosContactBox.invalid_fields_error
        render partial: "bigos_contact_box/module/widget"
      end
    end

    def index
      @message = Message.new(params[:message])

      if @message.valid?
        render text: true.to_json
      else
        render text: @message.errors.to_json
      end
    end

  end
end
