class MessageController < BaseController
  def list
    application_id = params[:application_id]
    chat_id = params[:chat_id]

    # Optional search param.
    search_param = params[:search]

    application = Application.find_by uuid: application_id
    chat = Chat.includes(:messages).find_by application_id: application.id, chat_number: chat_id

    messages = Message.where(chat_id: chat.id)

    if search_param.present?
      messages = messages.where("name LIKE ?", "%#{search_param}%")
    end

    data = messages.nil? ? []: messages.map do |message|
      {
        id: message.message_number,
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
    chat = Chat.find_by application_id: application.id, chat_number: chat_id

    message_sequence_generator = MessageSequenceGenerator.new(application_id, chat_id)
    message_number = message_sequence_generator.get_message_number

    message = Message.new(chat_id: chat.id, name: message_name, message_number: message_number)
    message.save

    data = {
      id: message.message_number,
      name: message.name
    }

    respond_created_successfully("Message created successfully", data)

  end
end
