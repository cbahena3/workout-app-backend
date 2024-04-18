class ArmsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @arms = Exercise.all
  end

  # def show
  #   @exercise = Exercise.find_by(id: params[:id])
  #   render :show
  # end

  # def create
  #   @exercise = Exercise.create(
  #     name: params[:name],
  #     description: params[:description],
  #     image_url: params[:image_url],
  #     video_url: params[:video_url]
  #   )
  #   if @exercise.valid?
  #     render :show
  #   else
  #     render json: { errors: @exercise.errors.full_messages }, status: :bad_request
  #   end
  # end

  # def update
  #   @exercise = Exercise.find_by(id: params[:id])
  #   # if current_user.id == @exercise.id
  #   @exercise.update(
  #   name: params[:name] || @exercise.name,
  #   description: params[:description] || @exercise.description,
  #   image_url: params[:image_url] || @exercise.image_url,
  #   video_url: params[:video_url] || @exercise.video_url
  #   )
  #   render :show
  #   # else
  #   # render json:{message: "Login with correct account."}
  #   # end
  # end

  # def destroy
  #   @exercise = Exercise.find_by(id: params[:id])
  #   # if current_user.id == @exercise.id
  #   @exercise.destroy
  #   render json:{message: "Exercise deleted succesfully"}
  #   # else
  #   #   render json:{message: "Login with correct account."}
  #   # end
  # end
# end
end
