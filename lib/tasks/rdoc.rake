require 'rdoc/task'

Rake::RDocTask.new do |rdoc|
	rdoc.rdoc_files.include('README.md')
	rdoc.rdoc_files.include('app/*/*.rb')
	rdoc.main = "README.md"	#page to start on
	rdoc.title = "Rotten Potatoes Documentation"
	rdoc.rdoc_dir = 'rdoc'	#where the documentation will be placed
end
