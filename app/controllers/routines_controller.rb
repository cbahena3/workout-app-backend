class RoutinesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @routines = Routine.all
    render :index
  end

  def show
    @routine = Routine.find_by(id: params[:id])
    render :show
  end

  def create
    @routine = Routine.create(
      user_id: current_user.id,
      exercise_id: params[:exercise_id],
      sets: params[:sets],
      reps: params[:reps]
    )
    if @routine.valid?
      render :show
    else
      render json: { errors: @routine.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @routine = Routine.find_by(id: params[:id])
    if current_user.id == @routine.user_id
      @routine.update(
      exercise_id: params[:exercise_id]|| @routine.exercise_id,
      sets: params[:sets] || @routine.sets,
      reps: params[:reps] || @routine.reps
    )
      render :show
    else
      render json:{message: "Login with correct account."}
    end
  end

  def destroy
    @routine = Routine.find_by(id: params[:id])
    if current_user.id == @routine.user_id
      @routine.destroy
      render json:{message: "Exercise removed from routine succesfully"}
    else
      render json:{message: "Login with correct account."}
    end
  end
end
