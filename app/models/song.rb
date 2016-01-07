class Song < ActiveRecord::Base
	belongs_to :user
	has_many :comments, dependent: :destroy

	validates :title, presence: true
	validates :artist, presence: true
	validates :year, presence: true

	acts_as_votable

	

end
