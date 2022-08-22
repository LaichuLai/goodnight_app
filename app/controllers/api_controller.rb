class ApiController < ActionController::Base
   skip_before_action :verify_authenticity_token
   rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

   def record_not_found
     render json: { message:'Data Not Found' }
   end
end
