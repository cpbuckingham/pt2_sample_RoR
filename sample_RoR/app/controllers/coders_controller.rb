class CodersController < ApplicationController
  before_action :set_coder, only: [:update, :destroy]
  def show
    @user = find_user
  end

  def index
    # @coder = Coder.new
    @coder = Coder.all
  end
  def new
    @user = find_user
    @coder = Coder.new
  end

  def create
    @coder = Coder.new(coder_params)
    @user = find_user
    respond_to do |format|
      if @coder.save
        format.html { redirect_to user_coders_path(@user), notice: 'Coder was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @coder.update(coder_params)
        format.html { redirect_to coder_path, notice: 'Coder was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @coder.destroy
    respond_to do |format|
      format.html { redirect_to admin_path, notice: 'Coder was successfully destroyed.' }
    end
  end

  private
    def set_coder
      @coder = Coder.find(params[:id])
    end
    def find_user
      User.find(params[:user_id])
      end

    def coder_params
      params.require(:coder).permit(:name, :email, :github_username)
    end
end
