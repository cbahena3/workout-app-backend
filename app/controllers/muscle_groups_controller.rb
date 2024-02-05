class MuscleGroupsController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @muscle_groups = MuscleGroup.all
    render :index
  end

  def show
    @muscle_group = MuscleGroup.find_by(id: params[:id])
    render :show
  end

  def create
    @muscle_group = MuscleGroup.create(
      name: params[:name],
    )
    if @muscle_group.valid?
      render :show
    else
      render json: { errors: @muscle_group.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @muscle_group = MuscleGroup.find_by(id: params[:id])
    # if current_user.id == @user.id
    @muscle_group.update(
    name: params[:name] || @muscle_group.name
    )
    render :show
    # else
    #   render json:{message: "Login with correct account."}
    # end
  end

  def destroy
    @muscle_group = MuscleGroup.find_by(id: params[:id])
    # if current_user.id == @user.id
    @muscle_group.destroy
    render json:{message: "Muscle group deleted succesfully"}
    # else
    #   render json:{message: "Login with correct account."}
    # end
  end
end
