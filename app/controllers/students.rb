KihwanujiUniv::App.controllers :students do
  get '/:id/timetable' do
    @student = Student.find(params[:id])
    render :'students/timetable'
  end

  get '/:id' do
    @student = Student.find(params[:id])
    render :'students/show'
  end

  get '/' do
    @students = Student.enabled.desc(:created_at)
    render :'students/list'
  end
end
