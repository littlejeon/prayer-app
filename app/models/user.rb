class User < ActiveRecord::Base
  has_many :user_groups
  has_many :groups, through: :users
  has_secure_password
  validates_uniqueness_of :email
  validates_presence_of :name, :email
end
