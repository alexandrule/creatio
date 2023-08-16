# frozen_string_literal: true

require "ostruct"
require "active_support/all"

module Creatio
  class ItemObject
    def initialize(attrs_in)
      attrs = attrs_in.transform_keys { |k| k.to_s.underscore.to_sym }
      raise("No id in attrs. id required. attrs_in=[#{ attrs_in.inspect }]") unless attrs[:id]
      @attributes = OpenStruct.new(attrs)
    end

    def method_missing(method, *args, &block)
      attribute = @attributes.send(method, *args, &block)
      attribute.is_a?(Hash) ? self.class.new(attribute) : attribute
    end

    def respond_to_missing?(method, include_private = false)
      true
    end
  end
end
