class CommentsController < ApplicationController

	def new
		@user = User.find( current_user.id )
		@comment = current_user.comments.new
	end

	def create
		@song = Song.find( params[:song_id] )
		@user = User.find( current_user.id )
		@comment = Comment.new( comment_params )

		if @comment.save
			redirect_to view_song_path(@song)
		else
			render :new
		end
	end

	def destroy
		@song = Song.find( params[:song_id] )
		@comment = Comment.find( params[:id] ) 
  		@comment.destroy
  		redirect_to view_song_path(@song)
	end

private

	def comment_params
		params.require( :comment ).permit( :body, :song_id, :name, :email, :user_id )
	end

end