//
//  FlickrPhotoBrain.swift
//  FlickClick
//
//  Created by Hezi Cohen on 10/11/2021.
//

    import Foundation

    struct ManagerForPhoto : Codable {
        let photos : Photos?
        let stat : String?

        enum CodingKeys: String, CodingKey {

            case photos = "photos"
            case stat = "stat"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            photos = try values.decodeIfPresent(Photos.self, forKey: .photos)
            stat = try values.decodeIfPresent(String.self, forKey: .stat)
        }

    }


    struct Photo : Codable {
        let id : String?
        let owner : String?
        let secret : String?
        let server : String?
        let farm : Int?
        let title : String?
        let ispublic : Int?
        let isfriend : Int?
        let isfamily : Int?
        let url_s : String?
        let height_s : Int?
        let width_s : Int?

        enum CodingKeys: String, CodingKey {

            case id = "id"
            case owner = "owner"
            case secret = "secret"
            case server = "server"
            case farm = "farm"
            case title = "title"
            case ispublic = "ispublic"
            case isfriend = "isfriend"
            case isfamily = "isfamily"
            case url_s = "url_s"
            case height_s = "height_s"
            case width_s = "width_s"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            id = try values.decodeIfPresent(String.self, forKey: .id)
            owner = try values.decodeIfPresent(String.self, forKey: .owner)
            secret = try values.decodeIfPresent(String.self, forKey: .secret)
            server = try values.decodeIfPresent(String.self, forKey: .server)
            farm = try values.decodeIfPresent(Int.self, forKey: .farm)
            title = try values.decodeIfPresent(String.self, forKey: .title)
            ispublic = try values.decodeIfPresent(Int.self, forKey: .ispublic)
            isfriend = try values.decodeIfPresent(Int.self, forKey: .isfriend)
            isfamily = try values.decodeIfPresent(Int.self, forKey: .isfamily)
            url_s = try values.decodeIfPresent(String.self, forKey: .url_s)
            height_s = try values.decodeIfPresent(Int.self, forKey: .height_s)
            width_s = try values.decodeIfPresent(Int.self, forKey: .width_s)
        }
    }

    struct Photos : Codable {
        let page : Int?
        let pages : Int?
        let perpage : Int?
        let total : Int?
        let photo : [Photo]?

        enum CodingKeys: String, CodingKey {

            case page = "page"
            case pages = "pages"
            case perpage = "perpage"
            case total = "total"
            case photo = "photo"
        }

        init(from decoder: Decoder) throws {
            let values = try decoder.container(keyedBy: CodingKeys.self)
            page = try values.decodeIfPresent(Int.self, forKey: .page)
            pages = try values.decodeIfPresent(Int.self, forKey: .pages)
            perpage = try values.decodeIfPresent(Int.self, forKey: .perpage)
            total = try values.decodeIfPresent(Int.self, forKey: .total)
            photo = try values.decodeIfPresent([Photo].self, forKey: .photo)
        }
    }

    func callAPI() {
        if let url = URL(string: "https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&extras=url_s&api_key=aabca25d8cd75f676d3a74a72dcebf21&format=json&nojsoncallback=1") {
           URLSession.shared.dataTask(with: url) { data, response, error in
              if let data = data {
                  do {
                     let res = try JSONDecoder().decode(ManagerForPhoto.self, from: data)
                      print(res.photos?.photo)
                  } catch let error {
                     print(error)
                  }
               }
           }.resume()
        }
    }



