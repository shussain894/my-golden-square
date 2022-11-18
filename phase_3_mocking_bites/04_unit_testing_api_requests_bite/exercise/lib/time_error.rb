require 'date'
require 'json'

class TimeError
  # Returns difference in seconds between server time
  # and the time on this computer
  def initialize(response)
    @response = response
  end 

  def error(current_time)
    return get_server_time - current_time
  end

  private

  def get_server_time
    text_response = @response.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end
end