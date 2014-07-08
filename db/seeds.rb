# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Track.count == 0
  tracks = Track.create([
    { name: 'Altenberg' },
    { name: 'Calgary' },
    { name: 'Cesana' },
    { name: 'Cortina' },
    { name: 'Igls' },
    { name: 'Konigssee' },
    { name: 'La Plagne' },
    { name: 'Lake Placid' },
    { name: 'Lillehammer' },
    { name: 'Nagano' },
    { name: 'Oberhof' },
    { name: 'Paramanovo' },
    { name: 'Park City' },
    { name: 'Sigulda' },
    { name: 'Sochi' },
    { name: 'St. Moritz' },
    { name: 'Whistler' },
    { name: 'Winterberg' }
  ])
end

if Circuit.count == 0
  circuits = Circuit.create([
    { name: 'World Cup' },
    { name: 'Intercontinental Cup' },
    { name: 'Europa Cup' },
    { name: 'North American Cup' },
    { name: 'Team Selection' },
    { name: 'European Championship' },
    { name: 'North American Championship' },
    { name: 'World Championship' },
    { name: 'Regional Championship' },
    { name: 'International Training Week' },
    { name: 'Olympic Winter Games' },
    { name: 'Homologation' },
    { name: 'Team Event' },
    { name: 'Junior World Championship' },
    { name: 'Junior National Championship' },
    { name: 'Club' },
    { name: 'Unofficial' },
    { name: 'Development' }
  ])
end