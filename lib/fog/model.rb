module Fog
  class Model

    def initialize(attributes = {})
      for key, value in attributes
        send(:"#{key}=", value)
      end
    end

    def inspect
      data = "#<#{self.class.name}"
      for attribute in (self.instance_variables - ['@connection'])
        data << " #{attribute}=#{send(attribute[1..-1].to_sym).inspect}"
      end
      data << ">"
    end

    private

    def connection=(new_connection)
      @connection = new_connection
    end

    def connection
      @connection
    end

    def new_record?
      !defined?(@new_record) || @new_record
    end

    def remap_attributes(attributes, mapping)
      for key, value in mapping
        if attributes[key]
          attributes[value] = attributes.delete(key)
        end
      end
    end

  end
end
