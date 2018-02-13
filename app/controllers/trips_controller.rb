
class TripsController < ApplicationController
        
  def index

    search_term = params['id']

    # p search_term

    the_coordinates = Geocoder.coordinates(search_term)

    # p the_coordinates

    latitude = the_coordinates[0]
    longitude = the_coordinates[1]

    # p latitude

    # p longitude

    # -----Begin travel warning response------
    
    response = Unirest.get("https://www.reisewarnung.net/api?country=#{search_term}")

    travel_warning = response.body
    country_warning = travel_warning['data']['lang']['en']['advice']


     # -------Begin hospital results------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&tkeyword=hospital&key=#{ENV['API_KEY']}")

    hospital = response.body
    hospital_data = hospital['results'][0]['name']
    hospital_info = response.body
    hospital_info_data = hospital_info['results'][0]['vicinity']
    # ------Begin doctor results---------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=doctor&key=#{ENV['API_KEY']}")
    doctor = response.body
    doctor_data = doctor['results'][0]['name']
    doctor_info = response.body
    doctor_info_data = doctor_info['results'][0]['vicinity']

   #  # ----Begin Gas station data-----

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=gas_station&key=#{ENV['API_KEY']}")

    gas_station = response.body
    gas_station_data = gas_station['results'][0]['name']
    gas_station_info = response.body
    gas_station_info_data = gas_station_info['results'][0]['vicinity']
    #-----Begin Embassy Data---------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=embassy&key=#{ENV['API_KEY']}")

    embassy = response.body
    embassy_data = embassy['results'][0]['name']
    embassy_info = response.body
    embassy_info_data = embassy_info['results'][0]['vicinity']

    #-------Begin Bank Data ----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=bank&key=#{ENV['API_KEY']}")

    bank = response.body
    bank_data = bank['results'][0]['name']
    bank_info = response.body
    bank_info_data = bank_info['results'][0]['vicinity']

    # --------Begin Police data------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=police&key=#{ENV['API_KEY']}")

    police = response.body
    police_data = police['results'][0]['name']
    police_info = response.body
    police_info_data = police_info['results'][0]['vicinity']
   #  #--------Begin pharmacy data-----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=car_repair&key=#{ENV['API_KEY']}")

    
    car_repair = response.body

    car_repair_data = car_repair['results'][0]['name']

   #  # render json: pharmacy.to_json
   
   #  # render json: JSON.pretty_generate(pharmacy)

    car_info = response.body
    car_info_data = car_info['results'][0]['vicinity']

   #  # -------Begin hotel data-----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&keyword=hotel&key=#{ENV['API_KEY']}")

    hotel = response.body
    hotel_data = hotel['results'][0]['name']
    hotel_info = response.body
    hotel_info_data = hotel_info['results'][0]['vicinity']
    # --------Begin ATM Data-----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=atm&key=#{ENV['API_KEY']}")

    atm = response.body
    atm_data = atm['results'][0]['name']
    atm_info = response.body
    atm_info_data = atm_info['results'][0]['vicinity']
   #  # -------Begin Airport Data---------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=airport&key=#{ENV['API_KEY']}")

    airport = response.body
    airport_data = airport['results'][0]['name']
    airport_info = response.body
    airport_info_data = airport_info['results'][0]['vicinity']
    
   #  # ----------Begin transit station data-----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=transit_station&key=#{ENV['API_KEY']}")

    transit_station = response.body
    transit_station_data = transit_station['results'][0]['name']
    transit_station_info = response.body
    transit_station_info_data = transit_station_info['results'][0]['vicinity']
    # ------------Begin Dentist data--------------------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=dentist&key=#{ENV['API_KEY']}")

    dentist = response.body
    dentist_data = dentist['results'][0]['name']
    dentist_info = response.body
    dentist_info_data = dentist_info['results'][0]['vicinity']
    

   #  # --------Begin Weather data------------

    response = Unirest.get("https://api.apixu.com/v1/forecast.json?key=#{ENV['Weather_Key']}&q=#{latitude},#{longitude}")

    weather = response.body
    weather_data = weather['current']['temp_f']

   #        # --------------------------
    # Weather in celsius
    response = Unirest.get("https://api.apixu.com/v1/forecast.json?key=#{ENV['Weather_Key']}&q=#{latitude},#{longitude}")

    weather2 = response.body
    weather2_data = weather2['current']['temp_c']

   #          # ------------------------
    
    # Forecast in fahrenheit
    response = Unirest.get("https://api.apixu.com/v1/forecast.json?key=#{ENV['Weather_Key']}&q=#{latitude},#{longitude}")

    forecast = response.body
    forecast_data = forecast['forecast']['forecastday'][0]['day']['maxtemp_f']

   #          #----------------------

   #  #Forecast in celsius
    response = Unirest.get("https://api.apixu.com/v1/forecast.json?key=#{ENV['Weather_Key']}&q=#{latitude},#{longitude}")

    forecast2 = response.body
    forecast2_data = forecast2['forecast']['forecastday'][0]['day']['maxtemp_c']


  
    
   # # #  # -----------------Begin Render-------------------------
   
    render json: {
        
        hospital: hospital_data,
        hospital_info: hospital_info_data,
        doctor: doctor_data,
        doctor_info: doctor_info_data,
        gas_station: gas_station_data,
        gas_station_info: gas_station_info_data,
        embassy: embassy_data,
        embassy_info: embassy_info_data,
        bank: bank_data,
        bank_info: bank_info_data,
        police: police_data,
        police_info: police_info_data,
        car_repair: car_repair_data,
        car_info: car_info_data,
        hotel: hotel_data,
        hotel_info: hotel_info_data,
        atm: atm_data,
        atm_info: atm_info_data,
        airport: airport_data,
        airport_info: airport_info_data,
        transit_station: transit_station_data,
        transit_station_info: transit_station_info_data,
        dentist: dentist_data,
        dentist_info: dentist_info_data,
        weather: weather_data,
        weather2: weather2_data,
        forecast: forecast_data,
        forecast2: forecast2_data,
        
        
    }   
  end
end
