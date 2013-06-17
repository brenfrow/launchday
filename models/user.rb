require './app/helpers/validation'
require 'digest/sha1'

class User < Sequel::Model
  include Validation

  def validate
    super
    required(:username)
    required_email(:email)
    required_password(:password)
  end

  def before_save
    self.password = Digest::SHA1.hexdigest(self.password)
    self.created_at = Time.now
    super
  end
end
