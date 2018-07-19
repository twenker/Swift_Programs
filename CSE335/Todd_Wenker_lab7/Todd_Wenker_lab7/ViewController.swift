//
//  ViewController.swift
//  Todd_Wenker_lab7
//
//  Created by Todd Wenker on 4/3/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit
import MapKit

// TASK: Get address/location from user, geocode to get coordinates, use web service to get
// earthquake data.
// example: http://api.geonames.org/earthquakesJSON?north=43.45&south=23.45&east= 102.06&west=122.06&username=demo
// The lng of Phoenix = 33.45. Lat = 112.06
class ViewController: UIViewController {
    //
    var north:Double = 0
    var south:Double = 0
    var east:Double = 0
    var west:Double = 0
    
    @IBOutlet weak var coordinatesLabel: UILabel!
    @IBOutlet weak var locationText: UITextField!
    @IBOutlet weak var displayLabel: UILabel!
    
    // geocodes location from locationText. sets coordinates
    @IBAction func geocodeLocation(_ sender: Any) {
        // geocode label
        let geoCoder = CLGeocoder()
        // get the location before setting the coordinates for the api call
        let locationString = locationText.text!
        CLGeocoder().geocodeAddressString(locationString, completionHandler:
            {(placemarks,error) in
                if error != nil{
                    print("Geocode failed: \(error!.localizedDescription)")
                } else if placemarks!.count > 0{
                    let placemark = placemarks![0]
                    print("Placemark:\n\(placemark)")
                    self.north = (placemark.location?.coordinate.latitude)! + 0.10
                    self.south = (placemark.location?.coordinate.latitude)! - 0.10
                    self.east = (placemark.location?.coordinate.longitude)! + 0.10
                    self.west = (placemark.location?.coordinate.longitude)! - 0.10
                    self.east = abs(self.east)
                    self.west = abs(self.west)
                    
                    print("Coordinates(NSEW): \(self.north,self.south,self.east,self.west)")
                    
                    var x = Double((placemark.location?.coordinate.latitude)!)
                    var y = Double((placemark.location?.coordinate.longitude)!)
                    x = Double(round(1000*x)/1000)
                    y = Double(round(1000*y)/1000)
                    
                    let lat:String = String(format: "%f",x)
                    let lon:String = String(format:"%f",y)
                    self.coordinatesLabel.text = "Coord: <"+lat+","+lon+">"
                    self.coordinatesLabel.isHidden = false
                }
                
        })
    }
    
    /* json data format:
     {earthquakes: [
     {datetime = String
     depth = Float
     lng = Float
     src = String
     eqid = String
     magnitude = Float
     lat = Float }
     ...]
     }
     */
    @IBAction func getEarthquakeData(_ sender: Any) {
        var displayString:String = ""
        
        // call web api
        let urlStr = "http://api.geonames.org/earthquakesJSON?north=" + String(north) + "&south=" + String(south) + "&east=" + String(east) + "&west=" + String(west) + "&username=tcwenker"
        print("API call URL: \(urlStr)")
        
        let url = URL(string: urlStr)!
        let urlSession = URLSession.shared
        
        let jsonQuery = urlSession.dataTask(with: url, completionHandler: { data, response, error -> Void in
            // check error value
            if error != nil{
                print(error!.localizedDescription)
            }
            
            var err:NSError?
            
            var jsonResult = (try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any]
            
            if (err != nil) {
                print("JSON Error \(err!.localizedDescription)")
            }
            
            print(jsonResult)
            
            // display jsonResult data
            let earthquakes = jsonResult!["earthquakes"] as! [[String: Any]]
            var dateTime = [String]()
            var long = [Double]()
            var lati = [Double]()
            var magnitude = [Double]()
            
            for earthquake in earthquakes {
                if let dt = earthquake["datetime"] as? String{
                    dateTime.append(dt)
                }
                if let lon = earthquake["lng"] as? Double{
                    long.append(lon)
                }
                if let lat = earthquake["lat"] as? Double{
                    lati.append(lat)
                }
                if let mag = earthquake["magnitude"] as? Double{
                    magnitude.append(mag)
                }
            }
            
            for (index,_) in dateTime.enumerated(){
                displayString += String((index+1))
                displayString += ": " + String(describing: dateTime[index])
                displayString += " <" + String(describing: lati[index])
                displayString += ", " + String(describing: long[index])
                displayString += "> mag: " + String(describing: magnitude[index]) + "\n"
                
            }
            
            print(displayString)
            
            DispatchQueue.main.async{
                self.displayLabel.text = displayString
                self.displayLabel.isHidden = false
            }
            
        })
        jsonQuery.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.displayLabel.isHidden = true
        self.coordinatesLabel.isHidden = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

