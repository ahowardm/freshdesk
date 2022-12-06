module Freshdesk
    class AgentResource < Resource
        def list(**params)
            response = get_request("agents?per_page=100", params: params)
            Collection.from_response(response, type: Agent)
        end
    end
end