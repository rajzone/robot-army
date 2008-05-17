%w[rubygems open3 base64 thor ruby2ruby].each do |library|
  require library
end

module RobotArmy
  class ConnectionNotOpen < StandardError; end
end

%w[loader soldier messenger task_master connection gate_keeper ruby2ruby_ext].each do |file|
  require File.join(File.dirname(__FILE__), 'robot-army', file)
end

at_exit do
  RobotArmy::GateKeeper.shared_instance.close
end

def debug(*whatever)
  File.open('/tmp/robot-army', 'a') { |f| f.puts "[#{Process.pid}] #{whatever.join(' ')}" }
end