class NrelService
#
  def closest_electric_station(location)
    response = conn.get("/api/alt-fuel-stations/v1.json") do |req|
      req.params['fuel_type'] = "ELEC"
      req.params['state'] = location.split(",")[2].split[0]
      req.params['api_key'] = ENV['NREL_API_KEY']
      req.params['city'] = location.split(",")[1]
      req.params['postal_code'] = location.split(",")[2].split[0]
      req.params['street'] = location.split(",")[0]
      req.params['hy_is_retail'] = "true"
      req.params['limit'] = "1"
    end
    data = JSON.parse(response.body, symbolize_names: true)[:fuel_stations][0]
  end

  private

    def get_json(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)[:results]
    end

    def conn
      conn = Faraday.new(url: "https://developer.nrel.gov")
    end

end
