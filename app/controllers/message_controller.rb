class MessageController < BaseController
  def list
    application_id = params[:application_id]
    chat_id = params[:chat_id]

    # Optional search param.
    search_param = params[:search]

    application = Application.find_by uuid: application_id
    chat = Chat.includes(:messages).find_by application_id: application.id, count_in_application: chat_id

    messages = Message.where(chat_id: chat.id)

    if search_param.present?
      messages = messages.where("name LIKE ?", "%#{search_param}%")
    end

    data = messages.nil? ? []: messages.map do |message|
      {
        id: message.count_in_chat,
        name: message.name
      }
    end

    respond_success('List of messages fetched successfully', data)
  end

  def create
    params.require(:message_name)

    application_id = params[:application_id]
    chat_id = params[:chat_id]
    message_name = params[:message_name]

    application = Application.find_by uuid: application_id
    chat = Chat.find_by application_id: application.id, count_in_application: chat_id

    message = Message.new(chat_id: chat.id, name: message_name)
    message.save

    data = {
      id: message.count_in_chat,
      name: message.name
    }

    respond_created_successfully("Message created successfully", data)

  end
end
