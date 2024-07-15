class ApplicationController < BaseController
    def create
        params.require(:application_name)

        application_name = params[:application_name]

        respond_created_successfully('Created Successfully', {
          id: "5839e194-5272-42dd-9fb6-157eb7be5e70",
          application_name: application_name
        })
    end
end
