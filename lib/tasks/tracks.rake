namespace :tracks do
  desc 'add latitude and longitude to tracks'
  task set_location: :environment do
    puts "Update track location..."
    Track.all.each do |track|
      case track.name
      when "Altenberg"
        track.update(latitude: 50.782300, longitude: 13.723007 )
      when 'Calgary'
        track.update(latitude: 44.952524, longitude: 6.816209)
      when 'Cesana'
        track.update(latitude: 44.952524, longitude: 6.816209)
      when 'Cortina'
        track.update(latitude: 46.545701, longitude: 12.127775)
      when 'Igls'
        track.update(latitude: 47.221125, longitude: 11.435487)
      when 'Konigssee'
        track.update(latitude: 47.590213, longitude: 12.976009)
      when 'Konigssee (old)'
        track.update(latitude: 47.590213, longitude: 12.976009)
      when 'La Plagne'
        track.update(latitude: 45.519972, longitude: 6.680548)
      when 'Lake Placid'
        track.update(latitude: 44.213196, longitude: -73.924767)
      when 'Lillehammer'
        track.update(latitude: 61.220615, longitude: 10.419124)
      when 'Nagano'
        track.update(latitude: 36.710858, longitude: 138.157331)
      when 'Oberhof'
        track.update(latitude: 50.708923, longitude: 10.707584)
      when 'Paramanovo'
        track.update(latitude: 56.244244, longitude: 37.446495)
      when 'Park City'
        track.update(latitude: 40.705174, longitude: -111.563905)
      when 'Sigulda'
        track.update(latitude: 57.151264, longitude: 24.840675)
      when 'Sochi'
        track.update(latitude: 43.662831, longitude: 40.288486)
      when 'St. Moritz'
        track.update(latitude: 46.501569, longitude: 9.847278)
      when 'Whistler'
        track.update(latitude: 50.106908, longitude: -122.944761)
      when 'Winterberg'
        track.update(latitude: 51.182209, longitude: 8.508864)
      end
      puts "."
      track.save
    end
  end

  desc 'add timezone to tracks'
  task set_timezone: :environment do
    puts "Update track timezone..."
    Track.all.each do |track|
      case track.name
      when "Altenberg"
        track.update(time_zone: 'Berlin')
      when 'Calgary'
        track.update(time_zone: 'Mountain Time (US & Canada)')
      when 'Cesana'
        track.update(time_zone: 'Rome')
      when 'Cortina'
        track.update(time_zone: 'Rome')
      when 'Igls'
        track.update(time_zone: 'Berlin')
      when 'Konigssee'
        track.update(time_zone: 'Berlin')
      when 'Konigssee (old)'
        track.update(time_zone: 'Berlin')
      when 'La Plagne'
        track.update(time_zone: 'Paris')
      when 'Lake Placid'
        track.update(time_zone: 'Eastern Time (US & Canada)')
      when 'Lillehammer'
        track.update(time_zone: 'Stockholm')
      when 'Nagano'
        track.update(time_zone: 'Tokyo')
      when 'Oberhof'
        track.update(time_zone: 'Berlin')
      when 'Paramanovo'
        track.update(time_zone: 'Moscow')
      when 'Park City'
        track.update(time_zone: 'Mountain Time (US & Canada)')
      when 'Pyeongchang'
        track.update(time_zone: 'Seoul')
      when 'Sigulda'
        track.update(time_zone: 'Moscow')
      when 'Sochi'
        track.update(time_zone: 'Moscow')
      when 'St. Moritz'
        track.update(time_zone: 'Bern')
      when 'Whistler'
        track.update(time_zone: 'Pacific Time (US & Canada)')
      when 'Winterberg'
        track.update(time_zone: 'Berlin')
      end
      puts "."
      track.save
    end
  end
end
