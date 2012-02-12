task :default => :spec

desc "Run unit tests"
task :spec do
  ENV["SOLARI_ENV"] = "test"
  sh "spec #{Dir.glob("spec/**/*_spec.rb").join(" ")}"
end
