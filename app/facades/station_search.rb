class StationSearch

  def initialize(location)
    @location = location
  end

  def nearest_station
    service = NrelService.new
    @station ||= service.closest_electric_station(@location)
    new_station = Station.new(@station)
  end

  def directions_to_nearest_station
    service = GoogleService.new
    @directions ||= service.directions_to_closest_electric_station(@location, new_station)
    Directions.new(@directions)
  end

  private
    attr_reader :location

end
