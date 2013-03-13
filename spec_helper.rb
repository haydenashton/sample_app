eval IO.read(File.expand_path(File.dirname(__FILE__) + "/../Rakefile"))
class Test::Unit::TestCase
 ....
 #db:test:prepare won't work, don't know why,
 #as DROP DATABASE won't execute (me on PostgreSQL).
 #even if I write,
 #ActiveRecord::Base.connection.disconnect!
 Rake::Task["db:reset"].invoke
end
