class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :title, :body
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :avatar
  
  has_many :patterns

  # attr_accessible :title, :body
  has_attached_file :avatar, :styles => { :show => "800x600#" }
  
  validates_attachment :avatar, presence: true,
                       content_type: { content_type: ['image/jpeg', 'image/jpg', 'image/png', 'image/gif']},
                       size: { less_than: 5.megabytes }






  
end

