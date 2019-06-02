class UserController < ApplicationController   
    def index
        users = User.all;
        render json: {status: 'SUCCESS', data: users},status: :ok
    end
end