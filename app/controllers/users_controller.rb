class UsersController < ApplicationController
  # GET /users/:id
  def show
    # @user = User.first
    @user = User.find(params[:id])

    # => app/views/users/show.html.erb
  end

  # GET /users/new or /signup
  def new
    @user = User.new
    # => app/views/users/new.html.erb
  end

  # POST /users
  def create
    # params => user => user.save => if ... else ...end
    # params[user[:name]] => 'foobar'
    # params[user[:name]] => 'foobar@example.com'
    # ...

    @user = User.new(user_params)
    if @user.save
      reset_session
      log_in @user
      # => Success / alert-success
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @user # => GET /users/:id
      # redirect_to_user_path(@user)
    else
      # => Failure
      render 'new', status: :unprocessable_entity
    end

    # x render 'create'
  end

  private

  # Strong Parameters
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
end
