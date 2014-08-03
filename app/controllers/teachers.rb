KihwanujiUniv::App.controllers :teachers do
  get '/:id' do
    @teacher = Teacher.find(params[:id])
    render :'teachers/show'
  end

  get '/' do
    @teachers = Teacher.all
    render :'teachers/list'
  end
end
