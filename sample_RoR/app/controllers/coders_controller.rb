class CodersController < ApplicationController
  before_action :coder, only: [:show, :edit, :destroy]
  before_action :user

  def show
  end

  def edit
  end

  def index
    @coders = user.coders
  end

  def new
    #@user = user
    @coder = Coder.new
  end

  def create
    if user.coders.new(coder_params).save!
      flash[:notice] = 'Coder was successfully created.'
      redirect_to user_coders_path(user)
    else
      flash[:error] = 'Something has gone wrong.'
      render :new
    end
  end

  def update
    if coder.update(coder_params)
      flash[:notice] = 'Coder was successfully updated.'
      redirect_to user_coders_path(user)
    else
      flash[:notice] = 'Something has gone wrong.'
      render :edit
    end
  end

  def destroy
    if coder.destroy
      redirect_to user_coders_path, notice: 'Coder was successfully destroyed.'
    end
  end

  private

  def coder
    @coder = Coder.find(params[:id])
  end

  def user
    @user = User.find(params[:user_id])
  end

  def coder_params
    params.require(:coder).permit(:name, :email, :github_username)
  end
end
