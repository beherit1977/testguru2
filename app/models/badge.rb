class Badge < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :personal_user_badges, dependent: :destroy
  has_many :users, through: :personal_user_badges

  before_validation :set_default_image

  private
  def set_default_image
    if image_path.blank?
        self.image_path = 'https://assets.donordrive.com/AFSP/images/$cms$/104/8648.png'
    end
  end
end
