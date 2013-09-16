require 'timed_report'

# Make the object, give it a name and set enabled to false
tr = TimedReport.new('This timed report is disabled', false)

tr.add('Sure?')

# This should print nothing
tr.finish()