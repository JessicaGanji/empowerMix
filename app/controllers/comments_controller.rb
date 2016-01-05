class CommentsController < ApplicationController

	def new
		@user = User.find( current_user.id )
		@comment = current_user.comments.new
	end

	def create
		@user = User.find( current_user.id )
		@comment = Comment.new( comment_params )
	end

	def destroy
		@user = User.find( current_user.id )
		@comment.destroy
	end

private

	def comment_params
		params.require( :comment ).permit( :body, :song_id, :name, :email, :user_id )
	end

end