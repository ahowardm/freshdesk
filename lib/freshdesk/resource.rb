module Freshdesk
    class Resource
        attr_reader :client

        def initialize(client)
            @client = client
        end

        private
            def get_request(url, params: {}, headers: {})
                handle_response client.connection.get(url, params, headers)
            end

            def handle_response(response)
                case response.status
                when 400
                    raise Error, "Client or Validation Error. #{response.body}"
                when 401
                    raise Error, "Authentication Failure. #{response.body}"
                when 403
                    raise Error, "Access Denied. #{response.body}"
                when 404
                    raise Error, "Requested Resource not Found. #{response.body}"
                when 405
                    raise Error, "Method not allowed. #{response.body}"
                when 406
                    raise Error, "Unsupported Accept Header. #{response.body}"
                when 409
                    raise Error, "Inconsistent/Conflicting State. #{response.body}"
                when 415
                    raise Error, "Unsupported Content-type. #{response.body}"
                when 429
                    raise Error, "Rate Limit Exceeded. #{response.body}"
                when 500
                    raise Error, "Unexpected Server Error. #{response.body}"
                end
                response
            end
    end
end