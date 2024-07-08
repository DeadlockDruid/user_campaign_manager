class UsersController < ApplicationController

  # GET /users
  def index
    @users = User.all

    render json: @users, each_serializer: UserSerializer
  end

  # POST /users
  def create
    @user = User.new(user_params)
    
    if @user.save
      render json: @user, status: :created, serializer: UserSerializer
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /users/filter
  def filter
    if params[:campaign_names].present?
      campaign_names = params[:campaign_names].split(',').map(&:strip)
      @users = User.search_by_campaign_names(campaign_names)

      render json: @users, each_serializer: UserSerializer
    else
      render json: { errors: ['No campaign names provided'] }, status: :bad_request
    end
  end

  private

  # White listing parameters
  def user_params
    params.require(:user).permit(:name, :email, campaigns_list: [:campaign_name, :campaign_id])
  end
end
