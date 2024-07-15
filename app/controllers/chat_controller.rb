class ChatController < BaseController
  def list
    application_id = params[:application_id]
    data = [
      {
        id: 1,
        name: "chat 1"
      },
      {
        id: 2,
        name: "chat 2"
      }
    ]

    respond_success('List of chats fetched successfully', data)
  end

  def create
    application_id = params[:application_id]
    chat_name = params[:chat_name]

    data = {
      id: 1,
      name: chat_name
    }

    respond_created_successfully('Chat create successfully', data)

  end

end
