class BaseController < ActionController::API
    def respond_success(message, data)
        respond(200, message, data)
    end

    def respond_created_successfully(message, data)
        respond(201, message, data)
    end

    def respond_not_found(message)
        respond(401, message, {})
    end

    def respond(status_code, message, data)
        render json: {
            message: message,
            data: data
        }, status: status_code
    end
end