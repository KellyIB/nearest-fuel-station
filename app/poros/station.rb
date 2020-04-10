class Station
  attr_reader :name, :address, :fuel_type, :access_times

  def initialize(station_data)
    @name = station_data[:station_name]
    @address = station_data[:street_address] + ", " + station_data[:city] + ", " + station_data[:state] + ", " + station_data[:zip]
    @fuel_type = station_data[:fuel_type_code]
    @access_times = station_data[:access_days_time]
  end

end
