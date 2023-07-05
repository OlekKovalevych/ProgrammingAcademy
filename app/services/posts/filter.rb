module Posts
  class Filter
    
    def initialize(posts:, params:)
      @posts = posts
      @params = params
    end

    def call
      @posts = posts.where(title: params[:title]) if params[:title]
      @posts = posts.where(body: params[:body]) if params[:body]

      posts
    end
    
    private
    attr_accessor :posts, :params
    
    
  end
end