class ApplicationController < ActionController::Base
   before_action :authenticate_admin!, if: :admin_url
   
   def admin_url
     request.fullpath.include?("/admin")
   end
   
   def application
     @customer = current_customer
   end
   
end
