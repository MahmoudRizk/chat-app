class ChatController < BaseController
  def list
    application_id = params[:application_id]

    application = Application.includes(:chats).find_by uuid: application_id
    data = application.chats.map do |chat|
      {
        id: chat.count_in_application,
        name: chat.name
      }
    end

    respond_success('List of chats fetched successfully', data)
  end

  def create
    application_id = params[:application_id]
    chat_name = params[:chat_name]

    application = Application.find_by uuid: application_id

    chat = Chat.new(name: chat_name, application_id: application.id)
    chat.save

    data = {
      id: chat.count_in_application,
      name: chat.name
    }

    respond_created_successfully('Chat create successfully', data)

  end

end
