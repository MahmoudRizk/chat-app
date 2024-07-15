class MessageController < BaseController
  def list
    application_id = params[:application_id]
    chat_id = params[:chat_id]

    data = [
      {
        id: 1,
        name: "message 1"
      },
      {
        id: 2,
        name: "message 2"
      }
    ]

    respond_success('List of messages fetched successfully', data)
  end

  def create
    params.require(:message_name)

    application_id = params[:application_id]
    chat_id = params[:chat_id]
    message_name = params[:message_name]

    data = {
      id: 1,
      name: "message 1"
    }

    respond_created_successfully("Message created successfully", data)

  end

end
