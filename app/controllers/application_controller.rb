class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
      
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :lname,:image,:avatar,:images])
      devise_parameter_sanitizer.permit(:edit, keys: [:fname, :lname,:image,:avatar,:images])


end



end
