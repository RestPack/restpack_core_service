module Core::Models
  class Application < ActiveRecord::Base
    self.table_name = :restpack_core_applications
    attr_accessible :name, :account_id

    validates_presence_of :name, :account_id
    validates :name, :length => { :maximum => 256 }

    has_many :domains

    before_save -> {
      self.api_token ||= SecureRandom.hex(50)[0..31]
    }
  end
end
