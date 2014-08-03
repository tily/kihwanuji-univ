KihwanujiUniv::App.controllers :courses do
  get '/new' do
    @courses = Course.desc(:created_at)
    render :'courses/edit'
  end

  get '/:id' do
    @course = Course.find(params[:id])
    render :'courses/show'
  end

  get '/:id/edit' do
    @course = Course.find(params[:id])
    render :'courses/edit'
  end

  get '/' do
    @courses = Course.desc(:created_at)
    render :'courses/list'
  end

  post '/' do
    @course = Course.new
    @course.name = params[:name]
    @course.type = params[:type]
    @course.description = params[:description]
    if @course.save
   	 redirect url("/courses/#{@course.id}")
    else
    	render :'courses/edit'
    end
  end

  put '/:id' do
    course = Course.find(params[:id])
    course.name = params[:name]
    course.description = params[:description]
    course.save!
    redirect url("/courses/#{course.id}")
  end
end
