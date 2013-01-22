require 'faraday'

module Chaperone
  module Base
    extend self

    def get(path, payload = {})
      connection.get path, payload
    end

    def put(path, payload = {})
      connection.put path, payload      
    end

    def post(path, payload = {})
      connection.post path, payload
    end

    def delete(path, payload = {})
      connection.delete path, payload
    end

    private

    def connection
      @conn ||= Faraday.new(:url => "#{Chaperone.config.domain}") do |faraday|
        faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
        if Chaperone.config.user
          faraday.request :basic_authentication, Chaperone.config.user, Chaperone.config.pass 
        end
      end
    end

  end
end