module Freshdesk
    class GroupsResource < Resource
        def list(**params)
            response = get_request('groups', params: params)
            Collection.from_response(response, type: Group)
        end

        def retrieve(group_id:)
            Group.new get_request("groups/#{group_id}").body
        end
    end
end