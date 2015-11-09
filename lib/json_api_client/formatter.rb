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
