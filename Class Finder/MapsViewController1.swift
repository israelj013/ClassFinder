//
//  MapsViewController1.swift
//  Class Finder
//
//  Created by Kay Lab on 3/11/19.
//  Copyright © 2019 israelj. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import Alamofire
import SwiftyJSON

enum Location {
    case startLocation
    case destinationLocation
}


class MapsViewController1: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate{
    
    @IBOutlet weak var mapView: GMSMapView!
    
    
    var locationManager = CLLocationManager()
    var locationSelected = Location.startLocation
    
    var locationStart = CLLocation()
    var locationEnd = CLLocation()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let locationDBH = CLLocation(latitude: 33.6451559, longitude: -117.8434574)
        let locationOther = CLLocation(latitude: 50.6451559, longitude: -117.8434574)
        
        
        //let noLocation = locationDBH
        let camera = GMSCameraPosition.camera(withLatitude: 33.6451559, longitude: -117.8434574, zoom: 16.0)
        mapView.camera = camera
        showMarker(position: camera.target)
        drawPath(startLocation: locationDBH, endLocation: locationOther)
        


        // Do any additional setup after loading the view.
    }
    
    
    
    func showMarker(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.position = position
        marker.title = "Palo Alto"
        marker.snippet = "San Francisco"
        marker.map = mapView
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting to the location: \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let noLocation = CLLocationCoordinate2D()
        let locationDBH = CLLocationCoordinate2DMake(33.6451559, -117.8434574)
        
        showMarker(position: noLocation)
        showMarker(position: locationDBH)
        //createMarker(titleMarker: "MyLocation", latitude: noLocation.latitude, longitude: noLocation.longitude)
        //createMarker(titleMarker: "DBH", latitude: locationDBH.coordinate.latitude, longitude: locationDBH.coordinate.longitude)
        
    }
    
    
    func drawPath(startLocation: CLLocation, endLocation: CLLocation){
        
        let origin = "\(startLocation.coordinate.latitude),\(startLocation.coordinate.longitude)"
        let destination = "\(endLocation.coordinate.latitude), \(endLocation.coordinate.longitude)"
        
        let url = "https://maps.googleapis.com/maps/api/directions/json?origin=\(origin)&destination=\(destination)&mode=walking"
        
        
        Alamofire.request(url).responseJSON { response in
            
            
            print(response.request as Any)
            print(response.response as Any)
            print(response.data as Any)
            print(response.result as Any)
            
            do {
                let json = try JSON(data: response.data!)
                let routes = json["routes"].arrayValue
            
            
        
            for route in routes
            {
                
                let routeOverviewPolyline = route["overview_polyline"].dictionary
                let points = routeOverviewPolyline?["points"]?.stringValue
                let path = GMSPath.init(fromEncodedPath:points!)
                let polyline = GMSPolyline.init(path:path)
                polyline.strokeWidth = 4
                polyline.strokeColor = UIColor.red
                
                
                //polyline.map = self.googleMaps
            }
            }
                catch{ print("no JSON response")
                    
                }
            
            
            
            
        }
        
        func showDirection(_ sender: UIButton) {
            // when button direction tapped, must call drawpath func
            self.drawPath(startLocation: locationStart, endLocation: locationEnd)
        }

        
        
        
        
        
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
