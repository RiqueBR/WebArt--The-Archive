require_relative("../models/artist")
require_relative("../models/exhibition")


Exhibition.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  "first_name" => "Fiona",
  "last_name" => "Arnott",
  "artist_info" => "Born in Lennoxtown, Fiona aims to change the concept of artistic collage by using digital methods",
  "artist_img" => "/images/artist3.jpg"
  })

  artist1.save()

  artist2 = Artist.new({
    "first_name" => "Henrique",
    "last_name" => "Batista",
    "artist_info" => "Origibally from Brazil, Henrique is Inspired by street photography and his surroundings",
    "artist_img" => "/images/artist1.jpg"
    })

    artist2.save()



    exhibition1 = Exhibition.new({
      "name" => "Digital Collage",
      "category" => "Artistic Drawing",
      "artist_id" => artist1.id,
      "exhibition_info" => "A collection of thoughtful and provoking images that challenges concepts.",
      "exhibit_img" => "/images/digital-collage.jpg"
      })

      exhibition1.save()

      exhibition2 = Exhibition.new({
        "name" => "Idas e Vindas Fotográficas",
        "category" => "Photography",
        "artist_id" => artist2.id,
        "exhibition_info" => "Images of what I call home.",
        "exhibit_img" => "/images/rio-photo.jpg"
        })

        exhibition2.save()


        
