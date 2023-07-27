class UserPolicy < ApplicationPolicy
    def rails_version?
        user.is_admin
    end
end
