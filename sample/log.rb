#!/usr/bin/env ruby

$:.unshift(File.join('..', 'lib'))
require 'devel/logger'

log = Devel::Logger.new(STDERR)

def do_log(log)
  log.debug('do_log1') { "debug" }
  log.info('do_log2') { "info" }
  log.warn('do_log3') { "warn" }
  log.error('do_log4') { "error" }
  log.caution('do_log5') { "caution" }
  log.fatal('do_log6') { "fatal" }
  log.unknown('do_log7') { "unknown" }
end

log.sev_threshold = Devel::Logger::SEV_DEBUG	# Default.
do_log(log)

puts "Set severity threshold 'WARN'."

log.sev_threshold = Devel::Logger::SEV_WARN
do_log(log)

puts "Change datetime format.  Thanks to Daniel Berger."

log.datetime_format = "%d-%b-%Y@%H:%M:%S"
do_log(log)
