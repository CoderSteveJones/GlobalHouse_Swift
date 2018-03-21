//
//  SerialLocationViewController.swift
//  GlobalHouse_Swift
//
//  Created by 江奔 on 2018/3/21.
//  Copyright © 2018年 yueyi. All rights reserved.
//

import UIKit

class SerialLocationViewController: BaseViewController,MAMapViewDelegate, AMapLocationManagerDelegate {

    
    @IBOutlet weak var mapView: MAMapView!
    let pointAnnotation = MAPointAnnotation()
    lazy var locationManager = AMapLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "连续定位"
        
        mapView.delegate = self
        configLocationManager()
        
        let startItem = UIBarButtonItem(title: "start", style: .done, target: self, action: #selector(start))
         let stopItem = UIBarButtonItem(title: "stop", style: .done, target: self, action: #selector(stop))
        navigationItem.rightBarButtonItems = [startItem, stopItem]
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        mapView.addAnnotation(pointAnnotation)
        locationManager.startUpdatingLocation()
    }
    
    @objc func start() {
        mapView.addAnnotation(pointAnnotation)
        
        locationManager.startUpdatingLocation()
    }
    
    @objc func stop() {
        locationManager.stopUpdatingLocation()
        
        mapView.removeAnnotation(pointAnnotation)
    }
    
    
    //MARK: - AMapLocationManagerDelegate
    
    func amapLocationManager(_ manager: AMapLocationManager!, didFailWithError error: Error!) {
        let error = error as NSError
        NSLog("didFailWithError:{\(error.code) - \(error.localizedDescription)};")
    }
    
    func amapLocationManager(_ manager: AMapLocationManager!, didUpdate location: CLLocation!, reGeocode: AMapLocationReGeocode?) {
        NSLog("location:{lat:\(location.coordinate.latitude); lon:\(location.coordinate.longitude); accuracy:\(location.horizontalAccuracy);};");
        
        if let reGeocode = reGeocode {
            NSLog("reGeocode:%@", reGeocode)
        }
        
        pointAnnotation.coordinate = location.coordinate
        mapView.centerCoordinate = location.coordinate
        mapView.setZoomLevel(15.1, animated: false)
    }
    
    
    //MARK: - Action Handle
    
    func configLocationManager() {
        
        locationManager.delegate = self
        
        locationManager.pausesLocationUpdatesAutomatically = false
        
        // 允许后台定位
        locationManager.allowsBackgroundLocationUpdates = false
    }
    
    //MARK: - MAMapVie Delegate
    
    func mapView(_ mapView: MAMapView!, viewFor annotation: MAAnnotation!) -> MAAnnotationView! {
        if annotation is MAPointAnnotation {
            let pointReuseIndetifier = "pointReuseIndetifier"
            
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: pointReuseIndetifier) as? MAPinAnnotationView
            
            if annotationView == nil {
                annotationView = MAPinAnnotationView(annotation: annotation, reuseIdentifier: pointReuseIndetifier)
            }
            
            annotationView?.canShowCallout  = false
            annotationView?.animatesDrop    = false
            annotationView?.isDraggable     = false
            annotationView?.image           = UIImage(named: "icon_location.png")
            
            return annotationView
        }
        
        return nil
    }
    
   
}
