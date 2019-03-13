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
        
        /*let noLocation = CLLocationCoordinate2D()
        print(noLocation.latitude, noLocation.longitude)
        let camera = GMSCameraPosition.camera(withLatitude: noLocation.latitude, longitude: noLocation.longitude, zoom: 6.0)
        mapView.camera = camera
        showMarker(position: camera.target)*/
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startMonitoringSignificantLocationChanges()
        
        let noLocation = CLLocationCoordinate2D()
        let camera = GMSCameraPosition.camera(withLatitude: noLocation.latitude, longitude: noLocation.longitude, zoom: 6.0)
        self.mapView.camera = camera
        self.mapView.delegate = self
        self.mapView?.isMyLocationEnabled = true
        self.mapView.settings.myLocationButton = true
        self.mapView.settings.compassButton = true
        self.mapView.settings.zoomGestures = true
        
        print(User.currentLocation)
        


        // Do any additional setup after loading the view.
    }
    
    func createMarker(titleMarker: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees){
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2DMake(latitude, longitude)
        marker.title = titleMarker
        marker.map = mapView
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
