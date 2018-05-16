# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

lorem_ipsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin nibh augue, suscipit a, scelerisque sed, lacinia in, mi. Cras vel lorem. Etiam pellentesque aliquet tellus. Phasellus pharetra nulla ac diam. Quisque semper justo at risus. Donec venenatis, turpis vel hendrerit interdum, dui ligula ultricies purus, sed posuere libero dui id orci. Nam congue, pede vitae dapibus aliquet, elit magna vulputate arcu, vel tempus metus leo non est. Etiam sit amet lectus quis est congue mollis. Phasellus congue lacus eget neque. Phasellus ornare, ante vitae consectetuer consequat, purus sapien ultricies dolor, et mollis pede metus eget nisi. Praesent sodales velit quis augue. Cras suscipit, urna at aliquam rhoncus, urna quam viverra nisi, in interdum massa nibh nec erat.
Sed ut perspiciatis, unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam eaque ipsa, quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt, explicabo. Nemo enim ipsam voluptatem, quia voluptas sit, aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos, qui ratione voluptatem sequi nesciunt, neque porro quisquam est, qui dolorem ipsum, quia dolor sit, amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt, ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit, qui in ea voluptate velit esse, quam nihil molestiae consequatur, vel illum, qui dolorem eum fugiat, quo voluptas nulla pariatur?
At vero eos et accusamus et iusto odio dignissimos ducimus, qui blanditiis praesentium voluptatum deleniti atque corrupti, quos dolores et quas molestias excepturi sint, obcaecati cupiditate non provident, similique sunt in culpa, qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio, cumque nihil impedit, quo minus id, quod maxime placeat, facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet, ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat."

pics = [File.new('app/assets/images/0e4fb6e75a40f3ac328f8fe2e841898e.jpg'),
        File.new('app/assets/images/c8e7e9a120f19bc434a4fce5fcf83e4d.jpg'),
        File.new('app/assets/images/harold-0.jpg'),
        File.new('app/assets/images/hYE8QQO.jpg')]

news = []
(1..200).each {|i|
  news << {title: "News nr #{i}", content: lorem_ipsum, add_date: Time.now, image: pics.sample}
}
News.create(news)

cities = City.create([{name: "Warszawa"}, {name: "Berlin"}, {name: "Zurych"}, {name: "Amsterdam"},
                      {name: "Chicago"}, {name: "Waszyngton"}, {name: "Tokio"}, {name: "Pekin"},
                      {name: "Paryż"}, {name: "Moskwa"}])

airports = Airport.create([{city: cities[0], name: "Okęcie / im. Fryderyka Chopina", IATA: "WAW"},
                           {city: cities[1], name: "Tegel", IATA: "TXL"},
                           {city: cities[2], name: "Kloten", IATA: "ZRH"},
                           {city: cities[3], name: "Schiphol", IATA: "WAW"},
                           {city: cities[4], name: "O`Hare International Airport", IATA: "ORD"},
                           {city: cities[5], name: "Ronald Reagan National Airport", IATA: "DCA"},
                           {city: cities[6], name: "Haneda", IATA: "HND"},
                           {city: cities[7], name: "Capital International Airport", IATA: "PEK"},
                           {city: cities[8], name: "Charles de Gaulle", IATA: "CDG"},
                           {city: cities[9], name: "Sheremyetyevo", IATA: "SVO"}])

airplanes = Airplane.create([{name: "Boeing 747", seats: 513},
                             {name: "Boeing 747-400", seats: 1026},
                             {name: "Boeing 747-8", seats: 743},
                             {name: "Boeing 767", seats: 278},
                             {name: "Boeing 777", seats: 391},
                             {name: "Boeing 787", seats: 270},
                             {name: "Boeing 737", seats: 145},
                             {name: "Boeing 757", seats: 234},
                             {name: "Boeing 717", seats: 106},
                             {name: "Airbus A300", seats: 266},
                             {name: "Airbus A310", seats: 247},
                             {name: "Airbus A330", seats: 366},
                             {name: "Airbus A340", seats: 380},
                             {name: "Airbus A350", seats: 333},
                             {name: "Airbus A380", seats: 853},
                             {name: "Airbus A318", seats: 132},
                             {name: "Airbus A319", seats: 156},
                             {name: "Airbus A320", seats: 160},
                             {name: "Airbus A321", seats: 220}])

flight_type = FlightType.create([{name: "Przylot"}, {name: "Odlot"}])
flight_status = FlightStatus.create([{name: "Wystartował"}, {name: "Wylądował"}, {name: "Oczekiwany"}, {name: "Odwołany"}])

airlines = Airline.create([{name: "Ryanair"}, {name: "EasyJet"}, {name: "Wizz Air"}, {name: "Germanwings"}, {name: "Norwegian"},
                           {name: "LOT"}, {name: "Emirates"}, {name: "Qatar Airways"}, {name: "Turkish Airlines"}, {name: "Enter Air"},
                           {name: "Aeroflot"}, {name: "Lufthansa"}])

Flight.create([{flight_identifier: "LOT Test 1", dep_date: DateTime.new(2018, 5, 15, 10, 15, 0),
                arr_date: DateTime.new(2018, 5, 15, 13, 15, 0), airline: airlines.sample, ticket_price: 1200.0,
                airport: airports.sample, airplane: airplanes.sample, flight_type: flight_type[0], flight_status: flight_status[1]},
               {flight_identifier: "LOT Test 2", dep_date: DateTime.new(2018, 5, 15, 10, 25, 0),
                arr_date: DateTime.new(2018, 5, 15, 16, 15, 0), airline: airlines.sample, ticket_price: 1200.0,
                airport: airports.sample, airplane: airplanes.sample, flight_type: flight_type[0], flight_status: flight_status[1]},
               {flight_identifier: "LOT Test 3", dep_date: DateTime.new(2018, 5, 15, 10, 55, 0),
                arr_date: DateTime.new(2018, 5, 15, 15, 15, 0), airline: airlines.sample, ticket_price: 1200.0,
                airport: airports.sample, airplane: airplanes.sample, flight_type: flight_type[0], flight_status: flight_status[1]},
               {flight_identifier: "LOT Test 4", dep_date: DateTime.new(2018, 5, 15, 11, 15, 0),
                arr_date: DateTime.new(2018, 5, 15, 16, 35, 0), airline: airlines.sample, ticket_price: 1200.0,
                airport: airports.sample, airplane: airplanes.sample, flight_type: flight_type[1], flight_status: flight_status[0]},
               {flight_identifier: "LOT Test 5", dep_date: DateTime.new(2018, 5, 15, 11, 25, 0),
                arr_date: DateTime.new(2018, 5, 15, 16, 5, 0), airline: airlines.sample, ticket_price: 1200.0,
                airport: airports.sample, airplane: airplanes.sample, flight_type: flight_type[1], flight_status: flight_status[0]},
               {flight_identifier: "LOT Test 6", dep_date: DateTime.new(2018, 5, 15, 12, 0, 0),
                arr_date: DateTime.new(2018, 5, 15, 15, 0, 0), airline: airlines.sample, ticket_price: 1200.0,
                airport: airports.sample, airplane: airplanes.sample, flight_type: flight_type[1], flight_status: flight_status[0]}])

flights = []
(1..1000).each {|i|
  type = flight_type.sample
  dep = Time.at(Time.now + rand * (DateTime.new(2018, 12, 24, 12, 0, 0).to_f - Time.now.to_f))
  flights << {flight_identifier: "LOT #{i}", dep_date: dep, arr_date: dep + (rand * 5).hours,
              airline: airlines.sample, ticket_price: (rand + 1.0) * 1000.0,
              airport: airports.sample, airplane: airplanes.sample, flight_type: type, flight_status: flight_status[2]}
}
Flight.create(flights)
