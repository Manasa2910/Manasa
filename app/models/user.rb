class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ratyrate_rater
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :reviews, dependent: :destroy 

  validates_presence_of :first_name, :last_name

  def full_name
  	"#{self.first_name} #{self.last_name}".squish
  end
end
