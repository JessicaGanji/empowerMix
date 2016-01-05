class User < ActiveRecord::Base
	has_secure_password
	
	has_many :songs, dependent: :destroy
	has_many :comments, dependent: :destroy

	#acts_as_voter
	
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :test, presence: true
end
