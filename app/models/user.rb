class User < ActiveRecord::Base
  has_secure_password
  has_many :tweets
  validates :username, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

  def slug
    username.gsub(/\s/, "-")
  end

  def self.find_by_slug(slug)
    username = slug.gsub(/-/, " ")
    User.find_by(name: )
  end
end
