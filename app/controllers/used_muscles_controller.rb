class UsedMusclesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @used_muscles = UsedMuscle.all
    render :index
  end

  def show
    @used_muscle = UsedMuscle.find_by(id: params[:id])
    render :show
  end

  def create
    @used_muscle = UsedMuscle.create(
      muscle_group_id: params[:muscle_group_id],
      exercise_id: params[:exercise_id]
    )
    if @used_muscle.valid?
      render :show
    else
      render json: { errors: @used_muscle.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @used_muscle = UsedMuscle.find_by(id: params[:id])
    # if current_user.id == @routine.user_id
    @used_muscle.update(
    muscle_group_id: params[:muscle_group_id]|| @used_muscle.muscle_group_id,
    exercise_id: params[:exercise_id]|| @used_muscle.exercise_id
    )
    render :show
    # else
    #   render json:{message: "Login with correct account."}
    # end
  end

  def destroy
    @used_muscle = UsedMuscle.find_by(id: params[:id])
    # if current_user.id == @routine.user_id
    @used_muscle.destroy
    render json:{message: "Muscle used removed from exercise succesfully"}
    # else
    #   render json:{message: "Login with correct account."}
    # end
  end
end
