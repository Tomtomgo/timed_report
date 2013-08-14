require 'timed_report'

tr = TimedReport.new('An example')
tr.add_output_method(lambda{|m| puts("\n\n\nThis is an extra function, it could be an email or Rails.logger.info!"); puts(m)})
100000*1000000
tr.add('100000*1000000')
sleep 0.5
tr.add('sleep 0.5')
sleep 0.5
tr.time_step()
tr.add('sleep 0.5 with time_step()')
tr.finish()