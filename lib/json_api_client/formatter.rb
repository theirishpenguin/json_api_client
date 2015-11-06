# Taken form jsonapi_resources formatter

require 'active_support/inflector'

module JsonApiClient
  class Formatter
    class << self
      def format(arg)
        arg.to_s
      end

      def unformat(arg)
        arg
      end

      def formatter_for(format)
        formatter_class_name = "#{format.to_s.camelize}Formatter"
        formatter_class_name.safe_constantize
      end
    end
  end

  class KeyFormatter < Formatter
    class << self
      def format(key)
        super
      end

      def unformat(formatted_key)
        super
      end
    end
  end

  class RouteFormatter < Formatter
    class << self
      def format(route)
        super
      end

      def unformat(formatted_route)
        super
      end
    end
  end

  class ValueFormatter < Formatter
    class << self
      def format(raw_value)
        super(raw_value)
      end

      def unformat(value)
        super(value)
      end

      def value_formatter_for(type)
        formatter_name = "#{type.to_s.camelize}Value"
        formatter_for(formatter_name)
      end
    end
  end
end

class UnderscoredKeyFormatter < JsonApiClient::KeyFormatter
end

class CamelizedKeyFormatter < JsonApiClient::KeyFormatter
  class << self
    def format(key)
      super.camelize(:lower)
    end

    def unformat(formatted_key)
      formatted_key.to_s.underscore
    end
  end
end

class DasherizedKeyFormatter < JsonApiClient::KeyFormatter
  class << self
    def format(key)
      super.dasherize
    end

    def unformat(formatted_key)
      formatted_key.to_s.underscore
    end
  end
end

class DefaultValueFormatter < JsonApiClient::ValueFormatter
  class << self
    def format(raw_value)
      raw_value
    end
  end
end

class IdValueFormatter < JsonApiClient::ValueFormatter
  class << self
    def format(raw_value)
      return if raw_value.nil?
      raw_value.to_s
    end
  end
end

class UnderscoredRouteFormatter < JsonApiClient::RouteFormatter
end

class CamelizedRouteFormatter < JsonApiClient::RouteFormatter
  class << self
    def format(route)
      super.camelize(:lower)
    end

    def unformat(formatted_route)
      formatted_route.to_s.underscore
    end
  end
end

class DasherizedRouteFormatter < JsonApiClient::RouteFormatter
  class << self
    def format(route)
      super.dasherize
    end

    def unformat(formatted_route)
      formatted_route.to_s.underscore
    end
  end
end
