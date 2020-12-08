class ApplicationController < ActionController::Base

    # Call fetch_user before every action in every controller
    before_action :fetch_user

    def fetch_user
        # Check user_id in session hash is valid, active user
        if session[:user_id].present?
            # Set current user
            @current_user = User.find_by id: session[:user_id]
        end # if

        # If invalid delete the session
        session[:user_id] = nil unless @current_user.present?
    end # fetch_user

    def check_if_logged_in
        # Reject the user if they are not the current logged in user
        unless @current_user.present?
          flash[:error] = 'You must be logged in to perform that action.'
          redirect_to login_path
        end # unless
    end # check_if_logged_in

    def seconds_to_string seconds
        minute = 60
        hour = minute * 60
        day = hour * 24
    
        # Convert time from seconds to day, hour, minutes, seconds
        days, remainder = seconds.divmod(day)
        hours, remainder = remainder.divmod(hour)
        minutes, remainder = remainder.divmod(minute)
        seconds = remainder
    
        # Add units
        time = ["#{days} day(s)", "#{hours} hour(s)", "#{minutes} minute(s)", "#{seconds} seconds"]
        # TODO: Handle when singular values i.e. 1 day instead of 1 days
        
        # Remove empty units and construct string
        time.reject{|str| str.start_with?("0")}.join(", ")
    end # seconds_to_string
    helper_method :seconds_to_string

    def string_to_seconds time_string
        # TODO: Convert time string to seconds
    end # string_to_seconds
end # ApplicationController
