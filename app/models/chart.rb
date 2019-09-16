class Chart < ApplicationRecord
  belongs_to :user
  has_many :tunes
end
