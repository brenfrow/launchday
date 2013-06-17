require 'spec_helper'

describe User do
  let(:user) { User.new }
  it 'can be created' do
    user.should_not be_nil
  end

  describe "validate" do

    def params_for(overrides)
      {
        firstname: "firstname",
        lastname: "lastname",
        companyname: "companyname",
        password: "password",
        email: "email@email.com"
      }.merge(overrides)
    end

    it "is valid when all required fields are good" do
      user = User.new(params_for({}))
      expect(user.valid?).to be_true
    end

    it "requires a valid email address" do
      user = User.new(params_for({email: "not_a_valid_email"}))
      expect(user.valid?).to be_false
      expect(user.errors[:email][0]).to eq("This is an invalid email address")

      user = User.new(params_for({email: "not"}))
      expect(user.valid?).to be_false

      user = User.new(params_for({email: "a_valid@email.com"}))
      expect(user.valid?).to be_true
    end
  end
end
