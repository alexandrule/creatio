# frozen_string_literal: true

require "faraday"
require "creatio/version"

module Creatio
  autoload :Client, "creatio/client"
  autoload :OAuth2, "creatio/oauth2"
  autoload :Error, "creatio/error"
  autoload :Object, "creatio/object"
  autoload :Resource, "creatio/resource"

  autoload :Activity, "creatio/objects/activity"
  autoload :Contact, "creatio/objects/contact"
  autoload :Deal, "creatio/objects/deal"
  autoload :Lead, "creatio/objects/lead"

  autoload :ActivityResource, "creatio/resources/activities"
  autoload :ContactResource, "creatio/resources/contacts"
  autoload :DealResource, "creatio/resources/deals"
  autoload :LeadResource, "creatio/resources/leads"
end
