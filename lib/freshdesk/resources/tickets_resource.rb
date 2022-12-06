module Freshdesk
    class TicketsResource < Resource
        def list(**params)
            response = get_request('tickets', params: params)
            Collection.from_response(response, type: Ticket)
        end

        def retrieve(ticket_id:)
            Ticket.new get_request("tickets/#{ticket_id}").body
        end

        def list_from_group(group_id:, params: {})
            response = get_request("search/tickets/?query=\"group_id:#{group_id}\"", params: params)
            Collection.from_response_body(response.body['results'], type: Ticket)
        end
    end
end