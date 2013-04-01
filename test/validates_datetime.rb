# This is a very very stripped-down version of the validates_timeliness gem.
module ActiveModel
  module Validations
    module HelperMethods
      def validates_datetime(*attr_names)
        validates_with DatetimeValidator, _merge_attributes(attr_names)
      end
    end

    class DatetimeValidator < ActiveModel::EachValidator
      def initialize(options)
        @allow_blank = options.delete(:allow_blank)
        super
      end

      def validate_each(record, attr_name, value)
        raw_value = record.read_attribute_before_type_cast(attr_name.to_s)
        return if @allow_blank && raw_value.blank?

        unless value.acts_like?(:time)
          # If the attribute type cast does not result in a Time-like
          # object, then the raw value is invalid.
          record.errors.add(attr_name, "is not a valid datetime")
        end
      end
    end
  end
end
