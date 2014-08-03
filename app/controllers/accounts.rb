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
    current_account.is_student = params[:is_student]
    current_account.is_teacher = params[:is_teacher]
    current_account.save!
    if current_account.is_student
      student = current_account.student
      if params[:student][:type]
        student.type = params[:student][:type]
      end
      if params[:student][:course_id] && course = Course.find(params[:student][:course_id])
        student.course = course
      end
      student.save!
    end
    if current_account.is_teacher
      teacher = current_account.teacher
      if params[:teacher][:type]
        teacher.type = params[:teacher][:type]
      end
      if params[:teacher][:course_id] && course = Course.find(params[:teacher][:course_id])
        teacher.course = course
      end
      teacher.save!
    end
    redirect url("/accounts/#{current_account.screen_name}")
  end
end
