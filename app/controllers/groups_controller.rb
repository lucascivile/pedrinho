class GroupsController < ApplicationController

    def index
        @groups = Group.all
    end

    def show
        @group = Group.find(params[:id])
    end

    def new
        @group = Group.new
    end

    def edit
        @group = Group.find(params[:id])
    end

    def create
        @group = Group.new(group_params)
        @user = session[:user_id]

        if @group.save
            @membership = Membership.new({user_id: @user, group_id: @group.id, is_admin: true, paid: false})
            @membership.save
            redirect_to groups_path
        else
            render 'new'
        end
    end

    def update
        @group = Group.find(params[:id])
       
        if @group.update(group_params)
          redirect_to groups_path
        else
          render 'edit'
        end
    end

    def destroy
        @group = Group.find(params[:id])

        Membership.all.each do |membership|
            if membership.group_id == @group.id
                membership.destroy
            end
        end
        
        @group.destroy
   
        redirect_to groups_path
    end

    private
        def group_params
            params.require(:group).permit(:name, :place, :frequency,
                                            :cost, :additional_detail)
        end
end
