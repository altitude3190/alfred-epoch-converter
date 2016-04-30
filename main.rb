require 'time'
require 'alfredo'

def convert(arg)
  is_unixtime_format = unixtime_format?(arg)
  return Time.at(arg.to_i) if is_unixtime_format
  return Time.parse(arg).to_i
end

def unixtime_format?(arg)
  return arg =~ /^\d+$/
end

result = convert(ARGV[0])

workflow = Alfredo::Workflow.new
workflow << Alfredo::Item.new({
  title: result,
  arg:   result
})
workflow.output!
