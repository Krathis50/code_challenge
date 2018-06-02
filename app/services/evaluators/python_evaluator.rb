require 'open3'

module Evaluators
  class PythonEvaluator < Evaluators::BaseEvaluator
    def evaluate
      program = ""
      tostring = @code
      tostring = tostring.to_s
      #lul = tostring.scan(/input/).count
      #puts lul
      something =  @arguments.split(",").map(&:to_i)
      puts something[0]
      
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

        #program = `python3 -c '#{ @something }'`
        #program.strip 
    end
  end
end

