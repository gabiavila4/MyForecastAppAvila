//
//  ViewController.swift
//  MyForecastAppAvila
//
//  Created by GABRIELA AVILA on 1/25/24.
//

struct Outside: Codable{
    //var List: [Main] = []
    var list: [Main]
}
struct Main: Codable{
    //var Days: [Day] = []
    var main: Day
}
struct Day: Codable{
    var temp: Double
    var temp_max: Double
    var temp_min: Double
   // var description: String
   // var dt: String
}
import UIKit

class ViewController: UIViewController {

    var d1 = ""
    var d2 = ""
    var d3 = ""
    var d4 = ""
    var d5 = ""
    var s = ""
    @IBOutlet weak var forelLbel: UILabel!
    
    @IBOutlet weak var day1InfoOutlet: UILabel!
    
    @IBOutlet weak var day2InfoOutlet: UILabel!
    
    @IBOutlet weak var day3InfoOutlet: UILabel!
    
    @IBOutlet weak var day4InfoOutlet: UILabel!
    
    
    @IBOutlet weak var day5InfoOutlet: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       getWeather()
    }

    func getWeather(){
        
    let session = URLSession.shared
            //creating URL for api call (you need your apikey)
   
    let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/forecast?lat=42.24&lon=-88.31&units=imperial&appid=bbf2ff1df6a3c1363350af2c8d5a85f1")!
            
            
     let dataTask = session.dataTask(with: weatherURL) {
                
    (data: Data?, response: URLResponse?, error: Error?) in
                
    if let e = error {
    print("Error:\n\(e)")
    } else {
                    // if there is data
    if let d = data {
                        // convert data to json Object
    if let jsonObj = try? JSONSerialization.jsonObject(with: d, options: .allowFragments) as? NSDictionary {
                            // print the jsonObj to see structure
      print(jsonObj)
    
        if let mainObj = try? JSONDecoder().decode(Outside.self, from: d){
            //print(mainObj.list[0].main.temp)
            
//            for dataW in mainObj.list{
//                print(dataW.main.temp)
//             
//            }
            var day = 1
            var i = 0
            var l = 1
           // print(mainObj.list.count)
            while i < mainObj.list.count{
               //print(mainObj.list[i].main.temp)
                
        
    self.s = "\(self.s) \n\nDay \(day): \(Int(mainObj.list[i].main.temp))°F\n\n"
                day = day + 1
                i = i + 8
            }
    self.d1 = "\(Int(mainObj.list[0].main.temp_max))°F\n Min Temp: \(Int(mainObj.list[0].main.temp_min))°F"
    self.d2 = "\(Int(mainObj.list[8].main.temp_max))°F\n Min Temp: \(Int(mainObj.list[8].main.temp_min))°F"
    self.d3 = "\(Int(mainObj.list[16].main.temp_max))°F\n Min Temp: \(Int(mainObj.list[16].main.temp_min))°F"
    self.d4 = "\(Int(mainObj.list[24].main.temp_max))°F\n Min Temp: \(Int(mainObj.list[24].main.temp_min))°F"
    self.d5 = "\(Int(mainObj.list[32].main.temp_max))°F\n Min Temp: \(Int(mainObj.list[32].main.temp_min))°F"
        }else{
            print("error decoding to object")
        }
        DispatchQueue.main.async {
            self.forelLbel.text = "\(self.s)"
            self.day1InfoOutlet.text = "Max Temp: \(self.d1)"
            self.day2InfoOutlet.text = "Max Temp: \(self.d2)"
            self.day3InfoOutlet.text = "Max Temp: \(self.d3)"
            self.day4InfoOutlet.text = "Max Temp: \(self.d4)"
            self.day5InfoOutlet.text = "Max Temp: \(self.d5)"
        }
        
//    if let main = jsonObj.value(forKey: "main") as? NSDictionary{
//        if let temp = main.value(forKey: "temp") as? Double{
//            print(temp)
//                           
//    
//        DispatchQueue.main.async {
//   //self.weatherLabel1.text = "\(temp)"
//           // print(temp)
//                 }
//                           
//                       }
//                                
//                            }
     
                            
                        }
                    }
                    
                }
                
            }
          
            dataTask.resume()
 
        }
    
    
    

}

