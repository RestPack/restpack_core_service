module Core::Commands::Domain
  class Update < RestPack::Service::Commands::Update
    required do
      array :domains do
        hash do
          required do
            integer :id
            integer :application_id
          end

          optional do
            array :oauth_providers do
              hash do
                required do
                  string :identifier
                  string :key
                  string :secret
                end
              end
            end
          end
        end
      end
    end

    private

    def find_model(model_inputs)
      self.class.model_class.find model_inputs.slice(:id, :application_id)
    end
  end
end
