Launchday.controllers :app do

  get :app, map: "/app/:id" do
    brandon = "renfrow"
    render 'app/index', locals: {model: brandon}
  end

end
