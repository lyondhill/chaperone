require "chaperone/version"
require 'chaperone/config'
require 'chaperone/route'
require 'chaperone/base'

module Chaperone

  class << self

    def config=(data)
      if data.class == Chaperone::Config or data == nil
        @config = data  
      else
        raise "I only accept the Cassequence::Config class"
      end
    end

    def config
      @config ||= Config.new
      @config
    end

    def configure(&proc)
      yield config
    end

  end

end
