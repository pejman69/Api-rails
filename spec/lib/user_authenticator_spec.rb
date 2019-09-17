require 'rails_helper'

describe UserAuthenticator do 

	context "when initialized with code" do
		let(:authenticator) { described_class.new(code: 'simple')}
		let(:authenticator_class) { UserAuthenticator::Oauth }

		describe "#initialize" do
			it "should initialize proper authenticator" do 
				expect(authenticator_class).to receive(:new).with('sample')
				authenticator
			end
		end
	end

	context "when  initialized with login & password" do
		let(:authenticator) { described_class.new(login: 'jsmith', password: 'secret')}
		let(:authenticator_class) { UserAuthenticator::Standard }
		
		describe "#initialize" do
			it "should initialize proper authenticator" do 
				expect(authenticator_class).to receive(:new).with('jsmith', 'secret')
				authenticator
			end
		end
			it 'should create and set user access token' do
				expect(authenticator.authenticator).to receive(:perform).and_return(true)
				expect(authenticator.authenticator).to receive(:user).
				expect { subject }.to change{ AccessToken.count }.by(1)
				expect(authenticator.access_token).to be_present
			end
    end
	end
end