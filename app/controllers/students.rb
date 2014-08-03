KihwanujiUniv::App.controllers :students do
  get '/:id' do
    @student = Student.find(params[:id])
    render :'students/show'
  end

  get '/' do
    @students = Student.all
    render :'students/list'
  end
end
