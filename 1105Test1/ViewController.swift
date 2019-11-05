//
//  ViewController.swift
//  1105Test1
//
//  Created by D7703_23 on 2019. 11. 5..
//  Copyright © 2019년 D7703_23. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
    
        //let center = CLLocationCoordinate2D(latitude: 35.165990, longitude: 129.072564)
        //let span = MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
        //let region = MKCoordinateRegion(center: center, span: span)
        //mapView.setRegion(region, animated: true)
        
        let pin01 = MKPointAnnotation()
        pin01.coordinate.latitude = 35.165990
        pin01.coordinate.longitude = 129.072564
        pin01.title = "동의과학대학교"
        pin01.subtitle = "우리들의 꿈이 자라는 곳"
        
        let pin02 = MKPointAnnotation()
        pin02.coordinate.latitude = 35.164402
        pin02.coordinate.longitude = 129.064951
        pin02.title = "송성현광장"
        pin02.subtitle = "우리들의 꿈이 자라는 곳"
        
        let pin03 = MKPointAnnotation()
        pin03.coordinate.latitude = 35.168421
        pin03.coordinate.longitude = 129.057124
        pin03.title = "시민공원"
        pin03.subtitle = "우리들의 꿈이 자라는 곳"
        
        mapView.addAnnotations([pin01, pin02, pin03])
    
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        
        //locationManager.requestAlwaysAuthorization()
        mapView.showsUserLocation = true
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation = locations[0]
        print(userLocation)
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let span = MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.09)
        let region = MKCoordinateRegion(center: center, span: span)
        mapView.setRegion(region, animated: true)

        
        
    }
    
//    func locationManager(_manager: CLLocationManager, didUpateLocations locations: [CLLocation]) {
//        let userLocation = locations[0]
//        print(userLocation)
//
//        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
//        let span = MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.09)
//        let region = MKCoordinateRegion(center: center, span: span)
//        mapView.setRegion(region, animated: true)
//    }
}
