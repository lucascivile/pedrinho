class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)

        if @user.save
            redirect_to @user
        else
            render 'new'
        end
    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            redirect_to @user
        else
            render 'edit'
        end
    end

    def destroy
        @user.destroy
        respond_to do |format|
            format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_user
            @user = User.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def user_params
            params.require(:user).permit(:full_name, :username, :password)
        end
end
