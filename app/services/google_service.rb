class GoogleService
#
  def directions_to_closest_electric_station(location, destination)
    response = conn.get("/maps/api/directions/json") do |req|
      req.params['language'] = "en"
      req.params['origin'] = location.split
      req.params['key'] = ENV['GOOGLE_KEY']
      req.params['destination'] = destination.address.split
      # req.params['postal_code'] = location.split(",")[2].split[0]
      # req.params['street'] = location.split(",")[0]
      # req.params['hy_is_retail'] = "true"
      # req.params['limit'] = "1"
    end
    data = JSON.parse(response.body, symbolize_names: true)
  end

  private

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)[:results]
    end

    def conn
      conn = Faraday.new(url: "https://maps.googleapis.com")
    end

end
