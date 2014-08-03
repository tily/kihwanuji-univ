KihwanujiUniv::App.controllers :students do
  get '/:id' do
    @student = Student.find(params[:id])
    render :'students/show'
  end

  get '/' do
    @students = Student.desc(:created_at).where(enabled: true)
    render :'students/list'
  end
end
