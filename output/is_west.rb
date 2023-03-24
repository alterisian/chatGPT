require 'geocoder'

def is_west?(location1,location2)
  coords1 = Geocoder.coordinates(location1)
  coords2 = Geocoder.coordinates(location2)

  if coords1[1] < coords2[1]
    return true
  else
    return false
  end
end
