//
//  MapsViewController.swift
//  Class Finder
//
//  Created by Kay Lab on 3/11/19.
//  Copyright © 2019 israelj. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class MapsViewController: UIViewController {

    @IBOutlet weak var mapView: GMSMapView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let noLocation = CLLocationCoordinate2D()
        print(noLocation.latitude, noLocation.longitude)
        /*let viewRegion = MKCoordinateRegion(center: noLocation, latitudinalMeters: 1000000, longitudinalMeters: 1000000)
        mapView.setRegion(viewRegion, animated: false)
        mapView.showsUserLocation = true
        showMarker(position: noLocation)*/
        
        let camera = GMSCameraPosition.camera(withLatitude: 33.6532, longitude: -117.8445, zoom: 6.0)
        mapView.camera = camera
        showMarker(position: camera.target)
        // Do any additional setup after loading the view.
    }
    
    func showMarker(position: CLLocationCoordinate2D){
        let marker = GMSMarker()
        marker.position = position
        marker.title = "Palo Alto"
        marker.snippet = "San Francisco"
        marker.map = mapView
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
