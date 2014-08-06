# coding:utf-8 
KihwanujiUniv::App.helpers do
  def current_account
    @current_account ||= Account.where(uid: session[:uid]).first
  end

  def list_item(model, object)
    haml(:"fragments/#{model}", layout: false, locals: {model => object})
  end

  def timetable(lectures)
    haml(:"fragments/timetable", layout: false, locals: {lectures: lectures})
  end

  def academic(str)
    str.gsub(/。/) {'．'}.gsub(/、/) {'，'}
  end

  def markdown2html(markdown)
    renderer = Redcarpet::Render::HTML.new(filter_html:true)
    Redcarpet::Markdown.new(renderer).render(markdown)
  end
end
