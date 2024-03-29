class UsersController < ApplicationController
  skip_before_filter :authorize, only: [:new, :create]

  def show
    @user = current_user
  end

  def new
    #flash[:errors] = []
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.errors.empty?
      sign_in(@user)
      redirect_to user_path(@user.id)
    else
      flash[:errors] = ["Error!"]
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

end
