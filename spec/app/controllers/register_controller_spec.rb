require 'spec_helper'

describe "RegisterController" do
  before do
    get "/register"
  end

  it "returns register" do
    last_response.body.should == "Register"
  end
end
