module MinitestMatcherLibrary
  class RelationshipMatcher
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
end
