require 'rails_helper'

describe 'registrations routes' do 
  it 'should routes to registrations#create' do 
  	expect(post '/sign_up').to route_to('registrations#create')
  end
end