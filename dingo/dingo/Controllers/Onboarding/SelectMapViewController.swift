//
//  SelectMapViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 4/8/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit
import ChameleonFramework
import MapKit
import CoreLocation

class SelectMapViewController: UIViewController, MKMapViewDelegate {
    
    var selectedLoc: CLLocationCoordinate2D!
    var name: String!
    var lat: Double!
    var long: Double!
    var nextButton: UIButton!
    var location = UILabel()
    var container1 = UIView()
    var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = mainColor
        self.name = "No location selected"
        selectedLoc = CLLocationCoordinate2D(latitude: 37.8676, longitude: -122.2587)
        
        drawMapView()
        drawLocation()
        drawEndButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func drawMapView() {
        mapView = MKMapView()
        
        let leftMargin:CGFloat = 10
        let topMargin:CGFloat = 60
        let mapWidth:CGFloat = view.frame.size.width-20
        let mapHeight:CGFloat = 300
        
        mapView.frame = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        mapView.mapType = MKMapType.standard
        mapView.isZoomEnabled = true
        mapView.isScrollEnabled = true
        
        // Or, if needed, we can position map in the center of the view
        mapView.center = view.center
        
        // Setting default location
        let defaultCenter = CLLocationCoordinate2D(latitude: 37.8676, longitude: -122.2587)
        let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        mapView.region = MKCoordinateRegion(center: defaultCenter, span: defaultSpan)
        
        // drop pin stuff
        let uilgr = UILongPressGestureRecognizer(target: self, action: #selector(dropPin(_:)))
        uilgr.minimumPressDuration = 1.0
        mapView.addGestureRecognizer(uilgr)
        view.addSubview(mapView)
    }
    
    @objc func dropPin(_ gestureRecognizer:UIGestureRecognizer){
        mapView.removeAnnotations(mapView.annotations)
        let touchPoint = gestureRecognizer.location(in: mapView)
        self.selectedLoc = mapView.convert(touchPoint, toCoordinateFrom: mapView)
        let annotation = MKPointAnnotation()
        annotation.coordinate = self.selectedLoc
        mapView.addAnnotation(annotation)
        
        nextButton.isHidden = false
    }
    
    func drawLocation() {
        container1 = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height / 2))
        container1.center =  CGPoint(x: container1.frame.midX, y: container1.frame.midY)
        location.lineBreakMode = NSLineBreakMode.byWordWrapping
        location.numberOfLines = 0
        location.text = "Current selection: " + name
        location.textColor = FlatWhite()
        location.textAlignment = .center
        location.frame = container1.frame
        container1.addSubview(location)
        self.view.addSubview(container1)
    }
    
    func drawEndButton() {
        nextButton = UIButton(frame: CGRect(x: 76, y: 516, width: 225, height: 50))
        nextButton.backgroundColor = FlatWhite()
        nextButton.frame.size = CGSize(width: self.view.bounds.width / 2, height: self.view.bounds.width / 8)
        nextButton.center.x = self.view.center.x
        nextButton.center.y = self.view.center.y * 1.5
        nextButton.tag = 0
        nextButton.setTitle("Finish setup", for: [])
        nextButton.setTitleColor(mainColor, for: .normal)
        nextButton.addTarget(self, action: #selector(endSetup(_:)), for: .touchUpInside)
        
        self.view.addSubview(nextButton)
        
        nextButton.isHidden = true
    }
    
    @objc func endSetup(_ button: UIButton) {
        print("Button with tag: \(button.tag) clicked!")
        performSegue(withIdentifier: "mapToHome", sender: nil)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //save selected loc in firebase
        FirebaseAPIClient().handleFirebaseLocation(id: "11", long: selectedLoc.longitude, lat: selectedLoc.latitude)
    }
}
