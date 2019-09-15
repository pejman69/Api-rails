class AccessTokensController < ApplicationController

	rescue_from UserAuthenticator::AuthenticationError, with: :authentication_error
	
	def create
		authenticator = UserAuthenticator.new(params[:code])
		authenticator.perform
  end
end
