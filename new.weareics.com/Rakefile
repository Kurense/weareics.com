require 'rubygems'
require 'barista'

task :default => :jekyll

desc "generate website"
task :jekyll => [ :haml, :sass, :coffee ] do
  system "jekyll"
end

desc "process haml"
task :haml do
  system <<-END
    cd _layouts/haml && 
    for f in *.haml; do haml $f ../${f%.haml}.html; done
  END
end

desc "process sass"
task :sass do
  system <<-END
    cd css/sass && 
    for f in *.sass; do sass $f ../${f%.sass}.css; done
  END
end

desc "process coffee"
task :coffee do
  Dir["js/coffee/*.coffee"].each do |path|
    target = File.expand_path("../../#{File.basename(path, '.*')}.js", path)
    File.open(target, 'w') do |f|
      f.write(Barista::Compiler.new(File.read(path)).to_js)
    end
  end
end
