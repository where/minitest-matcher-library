Minitest Matcher Library
------------------------

The goal is to be a series of matchers, that bring minitest-matchers into a state where it is as useful as shoulda-matchers, instead of having to build own matchers custom.

For simple validations see [valid_attribute](https://github.com/bcardarella/valid_attribute).

Installation
-----------

* Add to your Gemfile
* Include the helpers in your TestCase class, like below:

```
class ActiveSupport::TestCase
  include MinitestMatcherLibrary::TestHelpers
end
```

Usage
-----


Date Validations:

Assert that only valid dates passed are accepted.

```
object = Object.new
assert_must validate_datetime(:start_date), object
```


Relationships

Assert that the relationship for the given class is setup.

```
assert_must belong_to(:yolo), Swag
assert_must have_many(:fomos), Swag
assert_must have_one(:yolo), Swag
assert_must have_and_belong_to_many(:yolos), Swag
```



This gem is very much a work in progress.  Needs major cleanup, and tests.  Also feel free to add additional useful matchers into this library that help you in your project.
