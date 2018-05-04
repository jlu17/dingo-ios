//
//  SelectMapViewController.swift
//  dingo
//
//  Created by Jennifer Lu on 4/8/18.
//  Copyright © 2018 Jennifer Lu. All rights reserved.
//

import UIKit
import ChameleonFramework
import LocationPicker
import CoreLocation

class SelectMapViewController: UIViewController {
    
    var longLat: CLLocationCoordinate2D!
    var name: String!
    var lat: Double!
    var long: Double!
    var pickLocButton: UIButton!
    var nextButton: UIButton!
    var location = UILabel()
    var container1 = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = FlatBlue()
        self.name = "No location selected"
        drawLocation()
        drawLocButton()
        drawEndButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func drawLocButton() {
        pickLocButton = UIButton(frame: CGRect(x: 76, y: 516, width: 225, height: 50))
        pickLocButton.backgroundColor = FlatWhite()
        pickLocButton.frame.size = CGSize(width: self.view.bounds.width / 2, height: self.view.bounds.width / 8)
        pickLocButton.center.x = self.view.center.x
        pickLocButton.center.y = self.view.center.y
        pickLocButton.tag = 1
        pickLocButton.setTitle("Choose location", for: [])
        pickLocButton.setTitleColor(FlatBlue(), for: .normal)
        pickLocButton.addTarget(self, action: #selector(pickLoc(_:)), for: .touchUpInside)
        
        self.view.addSubview(pickLocButton)
    }
    
    func drawEndButton() {
        nextButton = UIButton(frame: CGRect(x: 76, y: 516, width: 225, height: 50))
        nextButton.backgroundColor = FlatWhite()
        nextButton.frame.size = CGSize(width: self.view.bounds.width / 2, height: self.view.bounds.width / 8)
        nextButton.center.x = self.view.center.x
        nextButton.center.y = self.view.center.y * 1.5
        nextButton.tag = 0
        nextButton.setTitle("Finish setup", for: [])
        nextButton.setTitleColor(FlatBlue(), for: .normal)
        nextButton.addTarget(self, action: #selector(endSetup(_:)), for: .touchUpInside)
        
        self.view.addSubview(nextButton)
    }
    
    @objc func endSetup(_ button: UIButton) {
        print("Button with tag: \(button.tag) clicked!")
        performSegue(withIdentifier: "mapToHome", sender: nil)
    }
    
    @objc func pickLoc(_ button: UIButton) {
        print("Button with tag: \(button.tag) clicked!")
        let locationPicker = LocationPickerViewController()
        locationPicker.showCurrentLocationButton = true
        locationPicker.currentLocationButtonBackground = .blue
        locationPicker.mapType = .standard
        locationPicker.searchBarPlaceholder = "Search places"
        locationPicker.resultRegionDistance = 500 // default: 600
        // let loc = CLLocation(latitude: 37.8716, longitude: -122.258423)
        // let initialLocation = Location(name: "Berkeley", location: loc, placemark: CLPlacemark())
        
        //locationPicker.location = initialLocation
        
        locationPicker.completion = { location in
            self.longLat = location?.coordinate
            if let nameTest = location?.name {
                self.name = nameTest
            }
            
            self.long = self.longLat.longitude
            self.lat = self.longLat.latitude
            
            print(self.longLat)
            // let newTitle = String(self.long) + ", " + String(self.lat)
            self.pickLocButton.setTitle("Change location", for: [])
            self.name = String(self.long) + ", " + String(self.lat)
            self.location.text = "Current selection: " + self.name
        }
        
        
        self.present(locationPicker, animated: true) {
            print("Selecting location")
        }
        
        navigationController?.pushViewController(locationPicker, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
