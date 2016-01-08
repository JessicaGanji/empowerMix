class User < ActiveRecord::Base
	has_secure_password
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true
	validates :test, presence: true

	has_many :songs, dependent: :destroy
	has_many :comments, dependent: :destroy

	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }, :default_url => "/assets/:style/avatar.png" 
	validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

end
