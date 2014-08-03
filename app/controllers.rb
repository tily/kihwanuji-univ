KihwanujiUniv::App.controllers do
  get '/' do
    render :top
  end

  get '/about' do
    render :about
  end

  get '/logout' do
    session[:uid] = nil
    redirect url("/")
  end

  get :auth, :map => '/auth/:provider/callback' do
    auth    = request.env["omniauth.auth"]
    account = Account.where(:provider => auth["provider"], :uid => auth["uid"]).first || 
              Account.create_with_omniauth(auth)
    session[:uid] = auth["uid"]
    redirect "http://" + request.env["HTTP_HOST"] + "/accounts/#{account.screen_name}"
  end
end
