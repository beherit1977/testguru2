class Feedback < ApplicationRecord
  belongs_to :user, optional: true
  validates :email, :body, presence: true
end
