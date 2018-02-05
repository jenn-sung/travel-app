
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

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=hospital&key=#{ENV['API_KEY']}")

    hospital = response.body
    hospital_data = hospital['results'][0]['name']

    # ------Begin doctor results---------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=doctor&key=#{ENV['API_KEY']}")
    doctor = response.body
    doctor_data = doctor['results'][0]['name']
   

   #  # ----Begin Gas station data-----

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=gas_station&key=#{ENV['API_KEY']}")

    gas_station = response.body
    gas_station_data = gas_station['results'][0]['name']

    #-----Begin Embassy Data---------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=embassy&key=#{ENV['API_KEY']}")

    embassy = response.body
    embassy_data = embassy['results'][0]['name']
    

    #-------Begin Bank Data ----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=bank&key=#{ENV['API_KEY']}")

    bank = response.body
    bank_data = bank['results'][0]['name']
    

    # --------Begin Police data------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=police&key=#{ENV['API_KEY']}")

    police = response.body
    police_data = police['results'][0]['name']

   #  #--------Begin pharmacy data-----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=pharmacy&key=#{ENV['API_KEY']}")

    # pharmacy_info = {}
    pharmacy = response.body

    pharmacy_data = pharmacy['results'][0]['name']
    # pharmacy_address = pharmacy['results'][0]['vicinity']

   #  # render json: pharmacy.to_json
   
   #  # render json: JSON.pretty_generate(pharmacy)

   #  # pharmacy_info['name'] = pharmacy_name
   #  # pharmacy_info['address'] = pharmacy_address

   #  # -------Begin hotel data-----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&keyword=hotel&key=#{ENV['API_KEY']}")

    hotel = response.body
    hotel_data = hotel['results'][0]['name']

    # --------Begin ATM Data-----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=atm&key=#{ENV['API_KEY']}")

    atm = response.body
    atm_data = atm['results'][0]['name']
    
   #  # -------Begin Airport Data---------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=airport&key=#{ENV['API_KEY']}")

    airport = response.body
    airport_data = airport['results'][0]['name']

    
   #  # ----------Begin transit station data-----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=transit_station&key=#{ENV['API_KEY']}")

    transit_station = response.body
    transit_station_data = transit_station['results'][0]['name']

    # ------------Begin Dentist data--------------------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&rankby=distance&type=dentist&key=#{ENV['API_KEY']}")

    dentist = response.body
    dentist_data = dentist['results'][0]['name']

    

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
        doctor: doctor_data, 
        gas_station: gas_station_data,
        embassy: embassy_data,
        bank: bank_data,
        police: police_data,
        pharamcy: pharmacy_data,
        hotel: hotel_data,
        atm: atm_data,
        airport: airport_data,
        transit_station: transit_station_data,
        dentist: dentist_data,
        weather: weather_data,
        weather2: weather2_data,
        forecast: forecast_data,
        forecast2: forecast2_data
        
    }   
  end
end
