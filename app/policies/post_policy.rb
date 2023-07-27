class PostPolicy < ApplicationPolicy
    class Scope < Scope
        def resolve 
            return scope.all if user.is_admin

            scope.where(author_id: user.id)
        end
    end 
end 
