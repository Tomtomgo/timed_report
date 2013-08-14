require 'timed_report'

# Make the object, give it a name
tr = TimedReport.new('An example')

# Add an extra method for output
tr.add_output_method(lambda{|m| puts("\n\n\nThis is an extra function, it could be an email or Rails.logger.info!"); puts(m)})

# Do a calculation
100000**100000
tr.add('100000**100000')

# Sleep half a sec
sleep 0.5
tr.add('sleep 0.5')

# Sleep half a sec, but after that, increment time
sleep 0.5
tr.time_step()
tr.add('sleep 0.5 with time_step()')

# Export the report to the standard puts and the added method
tr.finish()