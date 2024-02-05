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
      name: params[:name]
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
        name: params[:name]|| @routine.name
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
      render json:{message: "Routine deleted succesfully"}
    else
      render json:{message: "Login with correct account."}
    end
  end
end
