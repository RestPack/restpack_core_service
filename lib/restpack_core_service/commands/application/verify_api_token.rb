module Core::Commands::Application
  class VerifyApiToken < RestPack::Service::Command
    required do
      integer :id
      string :api_token
    end

    def execute
      application = Model.find_by_id_and_api_token(
        inputs[:id],
        inputs[:api_token]
      )

      if application
        { id: application.id }
      else
        status :forbidden
      end
    end
  end
end
