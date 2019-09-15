class AccessTokensController < ApplicationController

	rescue_from UserAuthenticator::AuthenticationError, with: :authentication_error
	
	def create
		authenticator = UserAuthenticator.new(params[:code])
		authenticator.perform
		render json: authenticator.access_token, status: :created
  end


  def destroy
   
  end
end
