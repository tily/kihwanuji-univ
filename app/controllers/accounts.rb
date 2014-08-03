KihwanujiUniv::App.controllers :accounts do
  get '/language' do
    if %w(en ja kh).include?(params[:lang])
    	session[:lang] = params[:lang]
    end
  end

  get '/:screen_name/edit' do
    render :'accounts/edit'
  end

  get '/:screen_name' do
    @account = Account.where(screen_name: params[:screen_name]).first
    render :'accounts/show'
  end

  put '/:screen_name' do
    student = current_account.student
    student.type = params[:student][:type] if params[:student][:type]
    student.enabled = (params[:student][:enabled] && params[:student][:enabled] == 'true')
    if params[:student][:course_id] && course = Course.find(params[:student][:course_id])
      student.course = course
    end
    student.save!

    teacher = current_account.teacher
    teacher.type = params[:teacher][:type] if params[:teacher][:type]
    teacher.enabled = (params[:teacher][:enabled] && params[:teacher][:enabled] == 'true')
    if params[:teacher][:course_id] && course = Course.find(params[:teacher][:course_id])
      teacher.course = course
    end
    teacher.save!

    redirect url("/accounts/#{current_account.screen_name}")
  end
end
