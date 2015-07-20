class User < ActiveRecord::Base
	has_many :portfolios
	before_save {self.email = email.downcase}
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :name, presence: true, length: {maximum: 50}
	validates :balance, presence: true, numericality: { only_integer: true , 
		greater_than_or_equal_to: 0}
	validates :email, presence: true, length: {maximum: 255}, 
		format: {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false}

end
