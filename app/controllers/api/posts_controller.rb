module Api
  class PostsController < ActionController::API
    def show
      render json: Post.find(params[:id]), status: :ok
    rescue ActiveRecord::RecordNotFound
      render json: { errors: 'Record not found' }, status: :not_found
    end
  end
end
