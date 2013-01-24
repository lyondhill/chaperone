module Chaperone
  class Config
    attr_accessor :domain
    attr_accessor :user
    attr_accessor :pass
    attr_accessor :def_block

    def initialize
      self.domain = 'localhost'
      self.user = nil
      self.pass = nil
    end

    def default_block(&block)
      if block_given?
        self.def_block = block
      else
        self.def_block
      end
    end

  end
  
end