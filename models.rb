class User < ActiveRecord::Base
  has_many :events
  has_many :reviews
end
class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :events
end
class Event < ActiveRecord::Base
  belongs_to :user
  has_many :reviews
end
