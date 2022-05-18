class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followed, class_name: "User"
  validates :follower_id, presence: true      # as of Rails 5 this validations are not required
  validates :followed_id, presence: true
end
