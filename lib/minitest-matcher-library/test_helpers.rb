module MinitestMatcherLibrary
  module TestHelpers

  def validate_datetime(attr)
    ::MinitestMatcherLibrary::MinitestDateValidationMatcher.new(attr)
  end

  def belong_to(attr)
    ::MinitestMatcherLibrary::MinitestRelationshipMatcher.new(attr, :belongs_to)
  end

  def have_many(attr)
    ::MinitestMatcherLibrary::MinitestRelationshipMatcher.new(attr, :has_many)
  end

  def have_one(attr)
    ::MinitestMatcherLibrary::MinitestRelationshipMatcher.new(attr, :has_one)
  end
 
  
  def have_and_belong_to_many(attr)
    ::MinitestMatcherLibrary::MinitestRelationshipMatcher.new(attr, :has_and_belongs_to_many)
  end

  end
end
