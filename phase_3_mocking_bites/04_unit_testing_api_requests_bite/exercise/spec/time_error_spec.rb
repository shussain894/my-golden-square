require 'time_error'

RSpec.describe TimeError do
  it "returns difference in time between server and computer" do
    response_dbl = double :response
    allow(response_dbl).to receive(:get)
      .with(URI("https://worldtimeapi.org/api/ip"))
      .and_return('{"abbreviation":"GMT","client_ip":"185.171.200.121","datetime":"2022-11-18T15:43:29.321645+00:00","day_of_week":5,"day_of_year":322,"dst":false,"dst_from":null,"dst_offset":0,"dst_until":null,"raw_offset":0,"timezone":"Europe/London","unixtime":1668786209,"utc_datetime":"2022-11-18T15:43:29.321645+00:00","utc_offset":"+00:00","week_number":46}')

    time = Time.new(2022, 11, 18, 15, 43, 29)
    time_error = TimeError.new(response_dbl)
    result = time_error.error(time)
    expect(result).to eq 0.321645
  end
end 
