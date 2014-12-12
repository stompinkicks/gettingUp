class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    puts '@@@'
    puts params
    @user.update_attribute(:avatar, params[:user][:avatar])
   end

 	def create
  	@user = User.create( params[:user] )
	end

end
