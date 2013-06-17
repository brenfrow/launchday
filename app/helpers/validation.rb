module Validation
  def required(field)
    errors.add(field, 'This field is required') if !send(field) || send(field).empty?
  end

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def required_email(field)
    required(field)
    errors.add(field, 'This is an invalid email address') unless send(field) =~ EMAIL_REGEX
  end

  def required_password(field)
    required(field)
    errors.add(field, 'The Password must be at least 6 characters') unless send(field).length >= 6
  end
end
