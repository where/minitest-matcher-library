class Yolo < ActiveRecord::Base
  has_many :swags

end


class Swag < ActiveRecord::Base
  belongs_to :yolo

end


