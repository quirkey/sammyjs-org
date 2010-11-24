require 'spec_helper'

describe 'Sammyjs-org' do

  it 'should load the index' do
    get '/'
    last_response.should.be.ok
  end
end
