require 'faraday'

module Chaperone
  module Base
    extend self

    def get(path, &block)
      connection.get path, &block
    end

    def put(path, &block)
      connection.put path, &block
    end

    def post(path, &block)
      connection.post path, &block
    end

    def delete(path, &block)
      connection.delete path, &block
    end

    private

    def connection
      Faraday.new(url: Chaperone.config.domain).tap do |con|
        if Chaperone.config.user
          con.basic_auth Chaperone.config.user, Chaperone.config.pass
        end
      end

    end

  end
end