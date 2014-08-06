KihwanujiUniv::App.controllers :lectures do
  get '/new' do
    render :'lectures/edit'
  end

  get '/:id/edit' do
    @lecture = Lecture.find(params[:id])
    render :'lectures/edit'
  end

  get '/timetable' do
    render :'lectures/timetable'
  end

  get '/:id' do
    @lecture = Lecture.find(params[:id])
    render :'lectures/show'
  end

  get '/' do
    @lectures = Lecture.desc(:created_at)
    render :'lectures/list'
  end

  post '/' do
    @lecture = current_account.teacher.lectures.new(
      params.slice('title', 'description', 'day_in_week', 'period', 'credit', 'room')
    )
    @lecture.save!
    redirect("lectures/#{@lecture.id}")
  end

  put '/:id' do
    @lecture = current_account.teacher.lectures.find(params[:id])
    @lecture.title = params[:title]
    @lecture.description = params[:description]
    @lecture.day_in_week = params[:day_in_week]
    @lecture.period = params[:period]
    @lecture.credit = params[:credit]
    @lecture.room = params[:room]
    @lecture.save!
    redirect("lectures/#{@lecture.id}")
  end

  post '/:id/subscription' do
    @lecture = Lecture.find(params[:id])
    @lecture.students << current_account.student
    redirect("lectures/#{@lecture.id}")
  end

  delete '/:id/subscription' do
    @lecture = Lecture.find(params[:id])
    @lecture.students.delete(current_account.student)
    redirect("lectures/#{@lecture.id}")
  end
end
