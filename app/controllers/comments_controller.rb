class CommentsController < ApplicationController

	def create
		@song = Song.find( params[:song_id] )
		@comment = @song.comments.new( params.require( :comment ).permit( :body, :song_id, :name, :email ) )

		if @comment.save
			;flash[:notice] = 'Comment was successfully created.'
			redirect_to library_path
		else
			;flash[:notice] = "Error creating comment: #{@comment.errors}"
			redirect_to library_path
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy

		redirect_to library_path
	end

end