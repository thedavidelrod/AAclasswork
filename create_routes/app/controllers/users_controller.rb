class UsersController < ApplicationController
    def index
        
       render plain: "I'm in the index action!"
        
    end

    # def create
    #     user = User.new(user_params)
    #     user.save!
    #     render json: user
    # end

    def show
        render json: params
        #user = User.find_by(id: params[:id])
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
  end
end



    private
    def user_params
        params.require(:users).permit(:name, :email)    
    end
end #! end of class


