require 'open-uri'
require 'json'

ENDPOINT = 'https://api.tfl.gov.uk/line/mode/tube,overground,dlr,tflrail/status'

json_data = open(ENDPOINT).read

JSON.parse(json_data).each do |line|
  line_name = line['name']
  status = line['lineStatuses'].first['statusSeverityDescription']
  puts "・ #{status} on the #{line_name}"

  if line['lineStatuses'].first['reason']
    reason = line['lineStatuses'].first['reason']

    puts "The reason is: #{reason}"
  end
  puts ""
end