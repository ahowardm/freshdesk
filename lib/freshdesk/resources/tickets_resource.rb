module Freshdesk
    class TicketsResource < Resource
        def list(**params)
            response = get_request('tickets', params: params)
            Collection.from_response(response, type: Ticket)
        end
    end
end