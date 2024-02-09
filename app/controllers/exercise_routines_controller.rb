class ExerciseRoutinesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]

  def index
    @exercise_routines = ExerciseRoutine.all
    render :index
  end

  def show
    @exercise_routine = ExerciseRoutine.find_by(id: params[:id])
    render :show
  end

  def create
    params[:exercise]
    exercise = Exercise.find_by(name: params[:exercise])
    params[:routine]
    routine = Routine.find_by(name: params[:routine])

    @exercise_routine = ExerciseRoutine.create(
      exercise_id: exercise.id,
      routine_id: routine.id,
      sets: params[:sets],
      reps: params[:reps]
    )
    if @exercise_routine.valid?
      render :show
    else
      render json: { errors: @exercise_routine.errors.full_messages }, status: :bad_request
    end
  end

  def update
    @exercise_routine = ExerciseRoutine.find_by(id: params[:id])
    # if current_user.id == @exercise_routine.id
    @exercise_routine.update(
      exercise_id: params[:exercise_id] || @exercise_routine.exercise_id,
      routine_id: params[:routine_id] || @exercise_routine.routine_id,
      sets: params[:sets] || @exercise_routine.sets,
      reps: params[:reps] || @exercise_routine.reps
    )
    render :show
    # else
    # render json:{message: "Login with correct account."}
    # end
  end

  def destroy
    @exercise_routine = ExerciseRoutine.find_by(id: params[:id])
    # if current_user.id == @exercise_routine.id
    @exercise_routine.destroy
    render json:{message: "Exercise deleted from routine succesfully"}
    # else
    #   render json:{message: "Login with correct account."}
    # end
  end
end
