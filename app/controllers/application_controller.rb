class ApplicationController < BaseController
    def create
        params.require(:application_name)

        application_name = params[:application_name]

        application_record = Application.new(uuid: Application.generate_uuid, name: application_name)
        application_record.save

        respond_created_successfully('Created Successfully', {
          id: application_record.uuid,
          application_name: application_record.name
        })
    end
end
