module RestPack::Core::Service::Commands::Application
  class VerifyApiToken < RestPack::Service::Command
    required do
      integer :id
      string :api_token
    end

    def execute
      # activity = Models::Activity.find_by_id_and_application_id(
      #   inputs[:id],
      #   inputs[:application_id]
      # )

      # if activity
      #   Serializers::ActivitySerializer.as_json(activity)
      # else
      #   status :not_found
      # end
    end
  end
end
