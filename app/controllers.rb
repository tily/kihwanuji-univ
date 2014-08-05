KihwanujiUniv::App.controllers do
  get '/' do
    @students = Student.enabled.desc(:created_at).limit(10)
    @teachers = Teacher.enabled.desc(:created_at).limit(10)
    @bachelor_courses = Course.where(type: 'bachelor').desc(:created_at).limit(10)
    @graduate_courses = Course.where(type: 'graduate').desc(:created_at).limit(10)
    @lectures = Lecture.desc(:created_at).limit(10)
    @papers = Paper.desc(:created_at).limit(10)
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
    redirect url("/accounts/#{account.screen_name}")
  end
end
