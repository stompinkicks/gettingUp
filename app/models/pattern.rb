class Pattern < ActiveRecord::Base
  attr_accessible :description, :image

  belongs_to :user
  has_attached_file :image

  validates :description, presence: true, :length => { :maximum => 150 }
  validates :user_id, presence: true
  validates_attachment :image, presence: true,
		  							   content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
		  							   size: { less_than: 5.megabytes }

end
