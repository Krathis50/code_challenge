require 'open3'
require 'readline'

module Evaluators
  class PythonEvaluator < Evaluators::BaseEvaluator
    def evaluate
      program = ""
      tostring = @code
      current_user = @user
      tostring = tostring.to_s
      something =  @arguments.split(",").map(&:to_i)
      puts something[0]
      fug = ""

      Open3.popen3( "python3 -c '#{@code}'" ) do |stdin, stdout, stderr, watch|
        something.each do |i|
          stdin.puts(i)
        end
        stdin.close
        stdout.each_line { |line|
          c_output = line.split("\n")
          c_output.each do | output |
            puts output
            program = program + line
          end
        }
      end
      puts program
      program.strip
    end
  end
end

