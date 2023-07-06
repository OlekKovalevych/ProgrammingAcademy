class PostSerializer < ActiveModel::Serializer 
    attributes :id, :body, :title

    has_many :comments
end
