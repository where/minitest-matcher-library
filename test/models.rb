class Yolo < ActiveRecord::Base
  has_many :swags

end


class Swag < ActiveRecord::Base
  belongs_to :yolo

  # see test/validates_datetime.rb
  validates_datetime :when_i_have_fomo
end


