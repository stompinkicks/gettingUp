class Pattern < ActiveRecord::Base
  attr_accessible :description

  validates :description, presence: true, :length => { :maximum => 150 }
end
