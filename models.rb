require 'sinatra/activerecord'
require 'carrierwave'
require 'carrierwave/orm/activerecord'

class PhotoUploader < CarrierWave::Uploader::Base
  storage :file
end

class User < ActiveRecord::Base
  has_many :events
  has_many :reviews
  mount_uploader :photo, PhotoUploader
end


class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
end

class Event < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  mount_uploader :photo, PhotoUploader
end
