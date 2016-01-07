class SongsController < ApplicationController

	before_action :set_song, only:[:show, :view, :edit, :update, :destroy]

	def index
		@songs = Song.all.order( 'year DESC, title ASC' )
	end

	def about
	end

	def library
		@songs = Song.all.order( 'year DESC, title ASC' )
	end

	def show
		@youtube_id = @song.link.split("=").last
	end

	def view
		@youtube_id = @song.link.split("=").last
		@user_id = User.find( @song.user_id )
		@voter_id = @song.votes_for.voters
		@random = Song.all.order('RANDOM()').first
		@comment = Comment.new
	end

	def upvote 
		@song = Song.find( params[:song_id] )
		@song.upvote_by current_user
		redirect_to :back
	end

	def new
		@user = User.find( params[:user_id] )
		@song = @user.songs.new
	end

	def create
		@user = User.find( params[:user_id] )
		@song = @user.songs.new( song_params )
		if @song.save
			redirect_to view_song_path(@song.id)
		else
			render :new
		end
	end

	def edit
		@user = User.find( params[:user_id] )
	end

	def update
		@user = User.find( params[:user_id] )
		if @song.update_attributes( song_params )
			redirect_to view_song_path(@song.id)
		else
			render :edit
		end
	end

	def destroy
		@user = User.find( params[:user_id] )
		@song = @song.destroy
		redirect_to library_path
	end

private

	def song_params
		params.require( :song ).permit( :title, :artist, :year, :genre, :link, :user_id, :description, :lyrics, :embed )
	end

	def set_song
		@song = Song.find( params[:song_id] )
	end

end