require 'rubygems'
require 'open-uri'
require 'hpricot'
require 'sinatra'

get '/' do
  date = if params.has_key? 'date' then params['date'] else Date.today.to_s end
  [0, 1].map { |i|
    doc = Hpricot(open("http://www.flightstats.com/go/FlightStatus/flightStatusByAirport.do?airport=%28HLZ%29+Hamilton+Airport%2C+NZ&airportQueryType=#{i}&airportQueryDate=" + date))
    doc.search(".tableListingTable").to_s
  }.join("<p>")
end
