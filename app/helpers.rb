KihwanujiUniv::App.helpers do
  def current_account
    @current_account ||= Account.where(uid: session[:uid]).first
  end
end
