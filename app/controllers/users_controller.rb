class UsersController < ApplicationController
  before_action :authenticate_user, except: [:index, :show, :create]

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    @user = User.create(
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      image_url: params[:image_url]
    )
    if @user.valid?
      render :show
    else
      render json: { errors: @user.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @user = User.find_by(id: params[:id])
    if current_user.id == @user.id
      @user.update(
      name: params[:name] || @user.name,
      email: params[:email] || @user.email,
      password: params[:password] || @user.password,
      password_confirmation: params[:password_confirmation] || @user.password_confirmation,
      image_url: params[:image_url] || @user.image_url
    )
      render :show
    else
      render json:{message: "Login with correct account."}
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if current_user.id == @user.id
      @user.destroy
      render json:{message: "User deleted succesfully"}
    else
      render json:{message: "Login with correct account."}
    end
  end
end
