module Freshdesk
    class Collection
        attr_reader :data

        def self.from_response(response, type:)
            body = response.body
            new(
                data: body.map { |attrs| type.new(attrs) }
            )
        end

        def self.from_response_body(response_data, type:)
            new(
                data: response_data.map { |attrs| type.new(attrs) }
            )
        end

        def initialize(data:)
            @data = data
        end
    end
end