class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    alias_method :current_user, :current_author
    rescue_from CanCan::AccessDenied do |exception|
        # render :file => "#{Rails.root}/public/403.html", :status => 403, :layout => false
        ## to avoid deprecation warnings with Rails 3.2.x (and incidentally using Ruby 1.9.3 hash syntax)
        ## this render call should be:
        render file: "/home/hagar/Documents/ruby/day2/blog/public/422", formats: [:html], status: 403, layout: false
      end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email, :password, :password_confirmation])
        # devise_parameter_sanitizer.permit(:sign_in) do |user_params|
        #   user_params.permit(:username, :email)
        # end
    end
    # helper_method :current_user
    # helper_method :logged_in?

    # def current_user
    #     User.find(session[:user_id]) unless session[:user_id].nil?
    # end

    # def logged_in?
    #     !current_user.nil?
    # end
    # def current_ability
    #     @current_ability ||= current_author.ability
    # end

end
