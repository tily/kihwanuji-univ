KihwanujiUniv::App.controllers :papers do
  get '/new' do
    render :'papers/edit'
  end

  get '/:id' do
    @paper = Paper.find(params[:id])
    render :'papers/show'
  end

  get '/:id/edit' do
    @paper = Paper.find(params[:id])
    render :'papers/edit'
  end

  get '/' do
    @papers = Paper.desc(:created_at)
    render :'papers/list'
  end

  post '/' do
    paper_params = params.slice(
      'title',
      'abstract',
      'introduction',
      'method',
      'theory',
      'results',
      'discussion',
      'conclusion',
      'acknowlegements',
      'references',
      'appendices'
    )
    case params[:role]
    when 'teacher'; subject = current_account.teacher.papers
    when 'student'; subject = current_account.student.papers
    end
    @paper = subject.create!(paper_params)
    redirect url("papers/#{@paper.id}")
  end

  put '/:id' do
    paper_params = params.slice(
      'title',
      'abstract',
      'introduction',
      'method',
      'theory',
      'results',
      'discussion',
      'conclusion',
      'acknowlegements',
      'references',
      'appendices'
    )
    @paper ||= current_account.teacher.papers.where(id: params[:id]).first
    @paper ||= current_account.student.papers.where(id: params[:id]).first
    @paper.update_attributes!(paper_params)
    redirect url("papers/#{@paper.id}")
  end

  delete '/:id' do
    @paper ||= current_account.teacher.papers.where(id: params[:id]).first
    @paper ||= current_account.student.papers.where(id: params[:id]).first
    @paper.destroy
  end
end
