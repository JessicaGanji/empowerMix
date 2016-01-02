class UsersController < ApplicationController

	before_action :set_user, only:[:show, :edit, :update, :destroy]

	def index
		@users = User.all.order( 'username ASC' )
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new( user_params )
		if @user.save
		  redirect_to users_path
		else
		  render :new
		end
	end

	def edit
	end

	def update
	    if @user.update_attributes( user_params )
	      redirect_to user_path
	    else
	      render :edit
	    end
	end

	def destroy
		@user.destroy
		redirect_to users_path
	end

private

	def user_params
		params.require( :user ).permit( :first_name, :last_name, :username, :email, :password, :password_confirmation, :test, :discover, :gender, :date_of_birth, :favorite_song, :bio )
	end

	def set_user
		@user = User.find( params[:id] )
	end

end
