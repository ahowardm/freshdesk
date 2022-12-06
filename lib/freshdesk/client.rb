require 'faraday'
require 'faraday_middleware'

module Freshdesk
    class Client
        attr_reader :api_key
        attr_reader :adapter
        attr_reader :domain

        def initialize(api_key:, adapter: Faraday.default_adapter, domain:)
            @api_key = api_key
            @adapter = adapter
            @domain = domain
        end

        def connection
            connection ||= Faraday.new(base_url) do |conn|
                conn.request :json
                conn.request :basic_auth, api_key, 'X'
                conn.response :json, content_type: 'application/json'
                conn.adapter adapter
            end
        end

        def tickets
            TicketsResource.new(self)
        end

        private
            def base_url
                "https://#{domain}.freshdesk.com/api/v2/"
            end
    end
end