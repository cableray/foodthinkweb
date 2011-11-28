class UsersController < InheritedResources::Base
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, notice: "You have been signed up!"
    else
      render :new
    end
  end
end
