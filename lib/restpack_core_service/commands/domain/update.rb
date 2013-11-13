module Commands::Core::Domain
  class Update < RestPack::Service::Command
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

    def execute
      #TODO: GJ: wrap in transaction
      result = {
        domains: []
      }

      inputs[:domains].each do |domain_inputs|
        domain = Models::Core::Domain.find_by_id_and_application_id(
          domain_inputs[:id], domain_inputs[:application_id]
        )

        if domain
          domain.update_attributes(domain_inputs)
          result[:domains] << Serializers::Core::Domain.as_json(domain)
        else
          status :not_found
        end
      end

      return result
    end
  end
end
