module RestPack::Models
  class Domain < ActiveRecord::Base
    attr_accessible :host, :application

    validates_presence_of :host
    validates :host, :length => { :maximum => 512 }

    belongs_to :application
  end
end
