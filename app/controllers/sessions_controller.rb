class SessionsController < ApplicationController
  def new
  end

  def create
  	user = login(params[:username], params[:password])
  	if user
  		redirect_to root_url, notice: "You have logged in."
  	else
  		flash.now.alert = "Email or password was invalid"
  		render :new
  	end
  end

  def destroy
  	logout
  	redirect_to root_url, notice: "You have logged out."
  end

end
