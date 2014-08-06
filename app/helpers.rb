# coding:utf-8 
KihwanujiUniv::App.helpers do
  def current_account
    @current_account ||= Account.where(uid: session[:uid]).first
  end

  def timetable(lectures)
    haml(:"fragments/timetable", layout: false, locals: {lectures: lectures})
  end
end
