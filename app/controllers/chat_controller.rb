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

end
