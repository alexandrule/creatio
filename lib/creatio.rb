# frozen_string_literal: true

require 'faraday'
require 'creatio/version'

module Creatio
  autoload :Client, 'creatio/client'
  autoload :OAuth2, 'creatio/oauth2'
  autoload :Error, 'creatio/error'
  autoload :Object, 'creatio/object'
  autoload :Resource, 'creatio/resource'

  autoload :Activity, 'creatio/objects/activity'
  autoload :ActivityCategory, 'creatio/objects/activity_category'
  autoload :ActivityStatus, 'creatio/objects/activity_status'
  autoload :Contact, 'creatio/objects/contact'
  autoload :Deal, 'creatio/objects/deal'
  autoload :Lead, 'creatio/objects/lead'

  autoload :ActivityResource, 'creatio/resources/activities'
  autoload :ActivityCategory, 'creatio/resources/activity_categories'
  autoload :ActivityStatus, 'creatio/resources/activity_statuses'
  autoload :ContactResource, 'creatio/resources/contacts'
  autoload :DealResource, 'creatio/resources/deals'
  autoload :LeadResource, 'creatio/resources/leads'
end
