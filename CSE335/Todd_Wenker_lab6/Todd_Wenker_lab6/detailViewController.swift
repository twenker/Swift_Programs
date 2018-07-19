//
//  detailViewController.swift
//  Todd_Wenker_lab6
//
//  Created by Todd Wenker on 3/30/18.
//  Copyright © 2018 Todd Wenker. All rights reserved.
//

import UIKit
import MapKit

class detailViewController: UIViewController{

    var cityStr:String?
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // use GeoCoding with cityStr
        let geoCoder = CLGeocoder()
        print(cityStr!)
        CLGeocoder().geocodeAddressString(cityStr!, completionHandler:
            {(placemarks, error) in
                if error != nil{
                    print("Geocode failed!! \(error!.localizedDescription)")
                }
                else if placemarks!.count > 0 {
                    let placemark = placemarks![0]
                    let location = placemark.location
                    let coords = location!.coordinate
                    print(location)
                    
                    let span = MKCoordinateSpanMake(0.075, 0.075)
                    let region = MKCoordinateRegionMake(coords, span)
                    self.mapView.setRegion(region, animated: true)
                    let ani = MKPointAnnotation()
                    ani.coordinate = coords
                    ani.title = placemark.locality
                    ani.subtitle = placemark.subLocality
                    
                    self.mapView.addAnnotation(ani)
                }
        })
    }

    // implement search function
    @IBAction func search(_ sender: UIButton) {
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchField.text!
        request.region = mapView.region
        let search = MKLocalSearch(request: request)
        search.start { response, _ in guard let response = response else {
                return
            }
            print(response.mapItems)
            var matchingItems:[MKMapItem] = []
            matchingItems = response.mapItems
            for i in 1...matchingItems.count - 1 {
                let place = matchingItems[i].placemark
                let ani = MKPointAnnotation()
                ani.coordinate = place.coordinate
                ani.title = place.title
                ani.subtitle = place.subLocality
                self.mapView.addAnnotation(ani)
                
                print(place.name)
            }
            
        }
        
    }
    
    @IBAction func selectMapType(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            mapView.mapType = .standard
        case 1:
            mapView.mapType = .satellite
        default:
            mapView.mapType = .standard
            
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
