module Chaperone
  class Config
    attr_accessor :domain
    attr_accessor :user
    attr_accessor :pass

    def initialize
      self.domain = 'localhost'
      self.user = nil
      self.pass = nil
    end

  end
  
end