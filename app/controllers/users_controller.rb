class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_post_params)
    if @user.save
      flash[:success] = "Form submitted!"
      redirect_to @user
    else
      flash.now[:error] = "Fix errors in form content"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def allowed_post_params
    params.expect(user: [:username, :email, :password])
  end
end
