//
//  ViewController.swift
//  JsonParseDecodable
//
//  Created by Ali Korkmaz on 28.01.2021.
//

import UIKit

struct WebsiteDescription: Decodable {
    let name: String
    let description: String
    let courses: [Course]
}
struct Course: Decodable {
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    //deneme
//    init(json: [String: Any]) {
//        id = json["id"] as? Int ?? -1
//        name = json["name"] as? String ?? ""
//        link = json["link"] as? String ?? ""
//        imageUrl = json["imageUrl"] as? String ?? ""
//    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let  jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard let url = URL(string: jsonUrlString) else
        { return }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            //perhaps check error
            //also check response status 200 OK
            guard let data = data else { return }
//           let dataAsString = String(data: data, encoding: .utf8)
//           print(dataAsString)
            
            do {
//                let websiteDescription = try JSONDecoder().decode(WebsiteDescription.self, from: data)
//                print(websiteDescription.name, websiteDescription.description)
                
                let courses = try JSONDecoder().decode([Course].self, from: data)
                print(courses)
                
//                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else { return }
//                print(json)
//
//                let course = Course(json: json)
//                print(course.name)
            } catch let jsonErr {
                print("Error Serializing: json:", jsonErr)
                
            }

        }.resume()
/*      let myCourse = Course(id: 1, name: "my course", link: "some link", imageUrl: "some image url")
        print(myCourse) */

    }


}

