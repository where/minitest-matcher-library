require 'minitest-matcher-library/test_helpers.rb'

module MinitestMatcherLibrary
  class MinitestRelationshipMatcher
    attr_accessor :attr, :macro, :subject, :failure_message

    def initialize(attr, macro)
      self.attr = attr
      self.macro = macro
    end

    def matches?(subject)
      if reflection(subject).nil?
        self.failure_message = "has no reflection for #{subject}##{attr.to_s}"
        return false
      elsif reflection(subject).macro.to_sym != self.macro.to_sym
        self.failure_message = "macro expected #{self.macro.to_sym.inspect}, macro observed #{reflection(subject).macro.to_sym.inspect}"
        return false
      else
        return true
      end
    end

    private

    def reflection(subject)
      @reflection ||= subject.reflect_on_association(self.attr)
    end
  end


  class MinitestDateValidationMatcher
    attr_accessor :attr, :or_nil, :subject, :unallowed_values, :allowed_values

    def initialize(attr)
      self.attr = attr
    end

    def or_nil
      self.or_nil = true
    end

    def failure_message
      message(unallowed_values)
    end

    def description
      msg = "only be valid when #{attr} is a date"
      msg = [msg, "or nil"].join(" ") if self.or_nil
    end

    def matches?(subject)
      check_values(subject)
      unallowed_values.empty?
    end

    def clone?
      !!@clone
    end

    # Force the matcher to clone the subject in between
    # testing each value.
    #
    # *Warning* This could lead to unintended results. The clone
    # is not a deep copy
    def clone
      @clone = true
    end

    private

    DATETIME_VALUES     = ['2013-02-13T18:18:34-0500', Time.now]
    NON_DATETIME_VALUES = ['invalid date string', 12345678]

    def check_values(subject)
      self.subject          = subject
      self.allowed_values   = []
      self.unallowed_values = []


      DATETIME_VALUES.each do |value|
        check_value(value, true)
        check_value(nil, false) unless self.or_nil
      end

      NON_DATETIME_VALUES.each do |value|
        check_value(value, false)
      end
    end

    def check_value(value, expects_valid)
      _subject = clone? ? subject.clone : subject
      _subject.send(:"#{attr}=", value)
      _subject.valid?

      if valid_attribute?(_subject, attr) == expects_valid
        self.allowed_values << value
      else
        self.unallowed_values << value
      end
    end

    def valid_attribute?(_subject, attr)
      errors = _subject.errors[attr]
      errors.respond_to?(:empty?) ? !!errors.empty? : !errors
    end

    def quote_values(values)
      values.map { |value| value.inspect }.join(', ')
    end

    def message(values)
      " date validation for #{subject.class}##{attr} did not perform as expected for: #{quote_values(unallowed_values)}"
    end
  end
end

