module Api 
    class PostsController < ActionController::API
        def show 
            render json: Post.find(params[:id]), status: :ok
        end
    end
end
