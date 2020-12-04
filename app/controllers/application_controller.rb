class ApplicationController < ActionController::Base

    def fetch_user
        # Check user_id in session hash is valid, active user
        if session[:user_id].present?
            # Set current user
            @current_user = User.find_by id: session[:user_id]
        end # if

        # If invalid delete the session
        session[:user_id] = nil unless @current_user.present?
    end # fetch_user

end # ApplicationController
