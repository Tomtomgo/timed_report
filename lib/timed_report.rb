class TimedReport

  # Creates a new TimedReport instance. If _named_ is given it will show the name in the report.
  #
  # Example:
  #   >> tr = TimedReport.new("Test")
  #
  # Arguments:
  #   named: (String)
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

  # Add a Proc or lambda that takes the report as argument.
  #
  # This way you can for example add Rails.logger.info or send an email besides printing to STDOUT.
  #
  # Example:
  #   >> tr.add_output_method(lambda{|report| Dummy.send_email(report)})
  #
  # Arguments:
  #   method: (Proc or lambda)
  def add_output_method method
    @output_methods.push method
  end

  # Increments time when called.
  # 
  # Example:
  #   >> tr.time_step()
  def time_step
    @step_time = Time.now
  end

  # Adds a line of text including the difference in seconds between the last #add or #time_step.
  #
  # Example:
  #   >> tr.add("one step")
  # 
  # Arguments:
  #   txt: (String)
  #   with_time: (Boolean)
  def add txt, with_time = true
    if with_time
      timing_info = "%.5f: " % (Time.now - @step_time)
      time_step()
    else
      timing_info = ""
    end

    @output += "\n#{timing_info}#{txt}"
  end

  # Finish the report. Call this add the end to print the report!
  # 
  # Example:
  #   >> tr.finish()
  def finish
    @output += "\n--------------------------"
    @output += "\nTotal time: %.5f" % (Time.now-@start_time)
    @output += "\n=========================="
    @output_methods.each do |om|
      om.call(@output)
    end
  end

end
