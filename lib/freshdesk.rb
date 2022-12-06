# frozen_string_literal: true

require_relative "freshdesk/version"

module Freshdesk
  autoload :Client, 'freshdesk/client'
  autoload :Error, 'freshdesk/error'
  autoload :Object, 'freshdesk/object'
  autoload :Resource, 'freshdesk/resource'
  autoload :Collection, 'freshdesk/collection'

  autoload :TicketsResource, 'freshdesk/resources/tickets_resource'
  autoload :GroupsResource, 'freshdesk/resources/groups_resource'

  autoload :Ticket, 'freshdesk/objects/ticket'
  autoload :Group, 'freshdesk/objects/group'
end
