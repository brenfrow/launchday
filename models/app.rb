require './app/helpers/validation'

class App < Sequel::Model
  include Validation

  def validate
    super
  end

  # def before_save
  #   self.password = Digest::SHA1.hexdigest(self.password)
  #   self.created_at = Time.now
  #   super
  # end
end
