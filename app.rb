Bundler.require

set :haml, escape_html: true

get '/' do
	haml :'/'
end

__END__
@@ layout
!!! 5
%html
	%head
	%body
		!= yield
@@ /
%h1 キハヌジ大学のホームページへようこそ
