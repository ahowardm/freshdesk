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
                    raise Error, "Client or Validation Error. #{response.body["error"]}"
                when 401
                    raise Error, "Authentication Failure. #{response.body["error"]}"
                when 403
                    raise Error, "Access Denied. #{response.body["error"]}"
                when 404
                    raise Error, "Requested Resource not Found. #{response.body["error"]}"
                when 405
                    raise Error, "Method not allowed. #{response.body["error"]}"
                when 406
                    raise Error, "Unsupported Accept Header. #{response.body["error"]}"
                when 409
                    raise Error, "Inconsistent/Conflicting State. #{response.body["error"]}"
                when 415
                    raise Error, "Unsupported Content-type. #{response.body["error"]}"
                when 429
                    raise Error, "Rate Limit Exceeded. #{response.body["error"]}"
                when 500
                    raise Error, "Unexpected Server Error. #{response.body["error"]}"
                end
                response
            end
    end
end