KihwanujiUniv::App.controllers :teachers do
  get '/:id/timetable' do
    @teacher = Teacher.find(params[:id])
    render :'teachers/timetable'
  end

  get '/:id' do
    @teacher = Teacher.find(params[:id])
    render :'teachers/show'
  end

  get '/' do
    @teachers = Teacher.enabled.desc(:created_at)
    render :'teachers/list'
  end
end
