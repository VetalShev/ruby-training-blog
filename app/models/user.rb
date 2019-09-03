class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :articles

  has_many :relationships_1, class_name: 'Relationship', foreign_key: :user_one_id
  has_many :relationships_2, class_name: 'Relationship', foreign_key: :user_two_id

  has_many :friends_1, through: :relationships_1, class_name: 'User', source: :user_two
  has_many :friends_2, through: :relationships_2, class_name: 'User', source: :user_one

  def friends
    friends_1 + friends_2
  end

  private :friends_1, :'friends_1=', :friends_2, :'friends_2='

end