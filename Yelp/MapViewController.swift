//
//  MapViewController.swift
//  Yelp
//
//  Created by Zach Glick on 2/14/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    var business : Business!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(business.lat)
        print(business.long)
        let centerLocation = CLLocation(latitude: 37.7833, longitude: -122.4167)
        let rLoc = CLLocation(latitude: business.lat! as Double, longitude: business.long! as Double)
        goToLocation(centerLocation)
        
        addUser(centerLocation.coordinate)
        addRestaurant(rLoc.coordinate)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func goToLocation(location: CLLocation) {
        let span = MKCoordinateSpanMake(0.1, 0.1)
        let region = MKCoordinateRegionMake(location.coordinate, span)
        mapView.setRegion(region, animated: false)
    }
    
    func addUser(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = "Your Location"
        mapView.addAnnotation(annotation)
    }
    
    func addRestaurant(coordinate: CLLocationCoordinate2D) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = self.business.name
        mapView.addAnnotation(annotation)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
