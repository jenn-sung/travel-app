
class TripsController < ApplicationController
        
  def index

    # -----Begin travel warning response------
    
    response = Unirest.get("https://www.reisewarnung.net/api?country=ES")

    travel_warning = response.body
    country_warning = travel_warning['data']['lang']['en']['advice']


     # -------Begin hospital results------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.390205,2.154007&rankby=distance&type=hospital&key=#{ENV['API_KEY']}")

    hospital = response.body
    hospital_data = hospital['results'][0]['name']

    # ------Begin doctor results---------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.390205,2.154007&rankby=distance&type=doctor&key=#{ENV['API_KEY']}")

    doctor = response.body
    doctor_data = doctor['results'][0]['name']
   

    # ----Begin Gas station data-----

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.390205,2.154007&rankby=distance&type=gas_station&key=#{ENV['API_KEY']}")

    gas_station = response.body
    gas_station_data = gas_station['results'][0]['name']

    #-----Begin Embassy Data---------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.390205,2.154007&rankby=distance&type=embassy&key=#{ENV['API_KEY']}")

    embassy = response.body
    embassy_data = embassy['results'][0]['name']
    

    #-------Begin Bank Data ----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.390205,2.154007&rankby=distance&type=bank&key=#{ENV['API_KEY']}")

    bank = response.body
    bank_data = bank['results'][0]['name']
    

    # --------Begin Police data------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.390205,2.154007&rankby=distance&type=police&key=#{ENV['API_KEY']}")

    police = response.body
    police_data = police['results'][0]['name']

    #--------Begin pharmacy data-----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.390205,2.154007&rankby=distance&type=pharmacy&key=#{ENV['API_KEY']}")

    # pharmacy_info = {}
    pharmacy = response.body

    pharmacy_data = pharmacy['results'][0]['name']
    # pharmacy_address = pharmacy['results'][0]['vicinity']

    # render json: pharmacy.to_json
   
    # render json: JSON.pretty_generate(pharmacy)

    # pharmacy_info['name'] = pharmacy_name
    # pharmacy_info['address'] = pharmacy_address

    # -------Begin hotel data-----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.390205,2.154007&rankby=distance&keyword=hotel&key=#{ENV['API_KEY']}")

    hotel = response.body
    hotel_data = hotel['results'][0]['name']

    # --------Begin Dentist data--------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.390205,2.154007&rankby=distance&keyword=dentist&key=#{ENV['API_KEY']}")

    dentist = response.body
    dentist_data = dentist['results'][0]['name'
    ]

    # --------Begin ATM Data-----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.390205,2.154007&rankby=distance&type=atm&key=#{ENV['API_KEY']}")

    atm = response.body
    atm_data = atm['results'][0]['name']
    
    # -------Begin Airport Data---------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.390205,2.154007&rankby=distance&type=airport&key=#{ENV['API_KEY']}")

    airport = response.body
    airport_data = airport['results'][0]['name']

    
    # ----------Begin transit station data-----------

    response = Unirest.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=41.390205,2.154007&rankby=distance&type=transit_station&key=#{ENV['API_KEY']}")

    transit_station = response.body
    transit_station_data = transit_station['results'][0]['name']
    

    # --------Begin Weather data------------

    response = Unirest.get("https://api.apixu.com/v1/forecast.json?key=#{ENV['Weather_Key']}&q=Barcelona")

    weather = response.body
    weather_data = weather['current']['temp_f']

          # --------------------------
    # Weather in celsius
    response = Unirest.get("https://api.apixu.com/v1/forecast.json?key=#{ENV['Weather_Key']}&q=Barcelona")

    weather2 = response.body
    weather2_data = weather2['current']['temp_c']

            # ------------------------
    
    # Forecast in fahrenheit
    response = Unirest.get("https://api.apixu.com/v1/forecast.json?key=#{ENV['Weather_Key']}&q=Barcelona")

    forecast = response.body
    forecast_data = forecast['forecast']['forecastday'][0]['day']['maxtemp_f']

            #----------------------

    #Forecast in celsius
    response = Unirest.get("https://api.apixu.com/v1/forecast.json?key=#{ENV['Weather_Key']}&q=Barcelona")

    forecast = response.body
    forecast_data = forecast['forecast']['forecastday'][0]['day']['maxtemp_c']
  
    # ------------------Begin Severe Weather Data-----------------
    
    response = Unirest.get("https://api.predicthq.com/v1/events/?category=severe-weather&place.exact=5419384", headers: {"Accept" => "application/json", "Authorization" => "Bearer #{ENV['access_token']}", "Content-Type" => "application/json"})

    severe_weather = response.body
    severe_weather_data = severe_weather['category']

    #-------------------Disaster Data------------------------

    response = Unirest.get("https://api.predicthq.com/v1/events/?category=disasters%2Cplace.region=5419384/", headers: {"Accept" => "application/json", "Authorization" => "Bearer #{ENV['access_token']}", "Content-Type" => "application/json"})

    disaster = response.body
    disaster_data = disaster['category']

    # ------------------Airport Delays-----------------------

    response = Unirest.get("https://api.predicthq.com/v1/events/?category=airport-delays%2Cplace.region=KDEN/", headers: {"Accept" => "application/json", "Authorization" => "Bearer #{ENV['access_token']}", "Content-Type" => "application/json"})

    airport_delays = response.body
    airport_delays_data = airport_delays['category']

   # ---------------Terror Data-----------------------------

    response = Unirest.get("https://api.predicthq.com/v1/events/?category=terror%2Cplace.region=5419384/", headers: {"Accept" => "application/json", "Authorization" => "Bearer #{ENV['access_token']}", "Content-Type" => "application/json"})

    terror = response.body
    terror_data = terror['category']

   #  # -----------------Begin Render-------------------------
   
    render json: {
        doctor: doctor_data, 
        travel_warning: country_warning,
        hospital: hospital_data,
        gas_station: gas_station_data,
        embassy: embassy_data,
        bank: bank_data,
        police: police_data,
        pharamcy: pharmacy_data,
        hotel: hotel_data,
        dentist: dentist_data,
        atm: atm_data,
        transit_station: transit_station_data,
        weather: weather_data,
        weather2: weather2_data,
        forecast: forecast_data,
        severe_weather: severe_weather['results'][0]['description'],
        disaster: disaster['results'][0]['description'],
        airport_delays: airport_delays['results'][0]['description'],
        terror: terror['results'][0]['description']
    }   
  end
end
