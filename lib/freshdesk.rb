# frozen_string_literal: true

require_relative "freshdesk/version"

module Freshdesk
  autoload :Client, 'freshdesk/client'
  autoload :Error, 'freshdesk/error'
  autoload :Object, 'freshdesk/object'
  autoload :Collection, 'freshdesk/collection'

  autoload :Ticket, 'freshdesk/objects/ticket'
end
