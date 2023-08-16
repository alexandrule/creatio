# frozen_string_literal: true

require 'faraday'
require 'creatio/version'

module Creatio
  autoload :Client, 'creatio/client'
  autoload :OAuth2, 'creatio/oauth2'
  autoload :Error, 'creatio/error'
  autoload :ItemObject, 'creatio/item_object'
  autoload :ItemResource, 'creatio/item_resource'

  autoload :Activity, 'creatio/item_objects/activity'
  autoload :ActivityCategory, 'creatio/item_objects/activity_category'
  autoload :ActivityStatus, 'creatio/item_objects/activity_status'
  autoload :Contact, 'creatio/item_objects/contact'
  autoload :Deal, 'creatio/item_objects/deal'
  autoload :Lead, 'creatio/item_objects/lead'

  autoload :ActivityResource, 'creatio/item_resources/activity_resource'
  autoload :ActivityCategoryResource, 'creatio/item_resources/activity_category_resource'
  autoload :ActivityStatusResource, 'creatio/item_resources/activity_status_resource'
  autoload :ContactResource, 'creatio/item_resources/contact_resource'
  autoload :DealResource, 'creatio/item_resources/deal_resource'
  autoload :LeadResource, 'creatio/item_resources/lead_resource'
  autoload :LeadTypeResource, 'creatio/item_resources/lead_type_resource'
end
