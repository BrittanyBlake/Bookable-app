module ApplicationHelper
    def signed_in
        if current_user
            render 'layouts/usernav' 
        else
            render 'layouts/navigation'
        end
    end
end
