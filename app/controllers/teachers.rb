KihwanujiUniv::App.controllers :teachers do
  get '/:id' do
    @teacher = Teacher.find(params[:id])
    render :'teachers/show'
  end

  get '/' do
    @teachers = Teacher.desc(:created_at).where(enabled: true)
    render :'teachers/list'
  end
end
