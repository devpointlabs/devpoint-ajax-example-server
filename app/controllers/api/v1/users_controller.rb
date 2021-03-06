class Api::V1::UsersController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    respond_to do |format|
      format.json { render json: User.all }
    end
  end

  def show
    respond_to do |format|
      if @user
        format.json { render json: @user }
      else
        format.json { render json: {message: "User not found with ID: #{params[:id]}"}, status: 404 }
      end
    end
  end

  def create
    respond_to do |format|
      user = User.create(user_params)
      if user.persisted?
         format.json { render json: user, status: 201 }
      else
         format.json { render json: {message: "User was NOT created successfully: #{user.errors.full_messages.join(' and ')}"}, status: 400  }
      end
    end
  end

  def update
    respond_to do |format|
      if @user
        if @user.update(user_params)
          format.json { render json: @user.reload }
        else
          format.json { render json: {message: "User was NOT updated successfully: #{@user.errors.full_messages.join(' and ')}"}, status: 400  }
        end
      else
         format.json { render json: {message: "User not found with ID: #{params[:id]}"}, status: 404 }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @user
        full_name = @user.full_name
        @user.destroy
        format.json { render json: {message: "User with name: #{full_name} destroyed successfully."} }
      else
        format.json { render json: {message: "User not found with ID: #{params[:id]}"}, status: 404 }
      end
    end
  end

  private
    def find_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :phone_number)
    end
end