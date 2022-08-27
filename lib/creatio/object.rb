# frozen_string_literal: true

require "ostruct"
require "active_support/all"

module Creatio
  class Object
    def initialize(attributes)
      attributes = attributes.transform_keys(&:underscore)
      @attributes = OpenStruct.new(attributes)
    end

    def method_missing(method, *args, &block)
      attribute = @attributes.send(method, *args, &block)
      attribute.is_a?(Hash) ? Object.new(attribute) : attribute
    end

    def respond_to_missing?(method, include_private = false)
      true
    end
  end
end
