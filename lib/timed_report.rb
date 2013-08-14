class TimedReport
  
  def initialize named = nil
    @start_time = Time.now
    @step_time = Time.now
    @output = "\n=========================="
    
    if named != nil
      @output += "\nReport: #{named}"
      @output += "\n--------------------------"
    end

    @output_methods = [lambda{|m| puts(m)}]
  end

  def add_output_method method
    @output_methods.push method
  end

  def time_step
    @step_time = Time.now
  end

  def add txt, with_time = true
    if with_time
      timing_info = "%.5f: " % (Time.now - @step_time)
      time_step()
    else
      timing_info = ""
    end

    @output += "\n#{timing_info}#{txt}"
  end

  def finish
    @output += "\n--------------------------"
    @output += "\nTotal time: %.5f" % (Time.now-@start_time)
    @output += "\n=========================="
    @output_methods.each do |om|
      om.call(@output)
    end
  end

end
