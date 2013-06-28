require './app/helpers/screenshot'

Launchday.controllers :register do

  layout :application

  get "/" do
    render 'register/index', locals: { model: User.new }
  end

  post "/" do
    user = User.new(params)
    if user.valid?
      user.is_company = !user.companyname.empty?
      user.save
      redirect 'app/1' #find actual page here
    else
      render 'register/index', locals: { model: user }
    end
  end

  post "ajax/picture" do
    content_type :json
    {"src" => Screenshot.new.snap(params.fetch("src")) }.to_json
  end
end
