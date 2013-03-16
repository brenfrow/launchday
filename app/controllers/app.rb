Launchday.controllers :app do

  layout :application

  get :app, map: "/app/:id" do
    render 'app/index', locals: {id: params[:id]}
  end

end
