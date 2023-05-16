//
//  VCMapView.swift
//  iOS
//
//  Created by Shubham Jitiya on 15/05/23.
//

import UIKit
import MapKit

class VCMapView: UIViewController {
    // MARK: Variables
    private var artworks: [Artwork] = []
    private var locationManager = CLLocationManager()
    
    // MARK: IB outlets
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        checkLocationAuth()
    }
}

// MARK: IB actions
extension VCMapView {
    
}

// MARK: Functions
extension VCMapView {
    private func initialSetup() {
        mapView.delegate = self
        clLocationSetup()
        setupInitialLocation()
        // constrainCamera()
        mapView.register(
            ArtworkMarkerView.self,
            forAnnotationViewWithReuseIdentifier:
                MKMapViewDefaultAnnotationViewReuseIdentifier)
        loadInitialData()
        mapView.addAnnotations(artworks)
    }
    
    private func setupInitialLocation() {
        let initialLocation = CLLocation(
            latitude: Constants.Location.INITIAL_LATITUDE.rawValue,
            longitude: Constants.Location.INITIAL_LONGITUDE.rawValue)
        mapView.centerToLocation(initialLocation, regionRadius: Constants.Location.INITIAL_RANGE.rawValue)
    }
    
    private func constrainCamera(
        latitude: CLLocationDegrees = Constants.Location.OAHU_LATITUDE.rawValue,
        longitude: CLLocationDegrees = Constants.Location.OAHU_LONGITUDE.rawValue) {
            let oahuCenter = CLLocation(latitude: latitude, longitude: longitude)
            let region = MKCoordinateRegion(
                center: oahuCenter.coordinate,
                latitudinalMeters: Constants.Location.CONSTRAIN_LATITUDE.rawValue,
                longitudinalMeters: Constants.Location.CONSTRAIN_LONGITUDE.rawValue)
            mapView.setCameraBoundary(
                MKMapView.CameraBoundary(coordinateRegion: region),
                animated: true)
            let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: Constants.Location.MAX_COORDINATE.rawValue)
            mapView.setCameraZoomRange(zoomRange, animated: true)
        }
    
    
    private func loadInitialData() {
        artworks.append(contentsOf: Helper.jsonDecodeArtwork(json: Helper.Json.publicArt))
    }
    
    private func clLocationSetup() {
        locationManager.delegate = self
        //  locationManager.startUpdatingHeading()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationAuth() {
        switch locationManager.authorizationStatus {
        case .authorizedAlways:
            mapView.showsUserLocation = true
            print("Location always")
        case .authorizedWhenInUse:
            mapView.showsUserLocation = true
            print("Location in use")
        case .denied:
            print("Location denied - can not be requested")
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            print("Location not determined")
        default:
            print("Something went wrong")
        }
    }
}

// MARK: MKMapView extension
private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = Constants.Location.REGION_RADIUS.rawValue
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

// MARK: MKMapView delegate methods
extension VCMapView: MKMapViewDelegate {
    func mapView(
        _ mapView: MKMapView,
        annotationView view: MKAnnotationView,
        calloutAccessoryControlTapped control: UIControl) {
            guard let artwork = view.annotation as? Artwork else {
                return
            }
            let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
            artwork.mapItem?.openInMaps(launchOptions: launchOptions)
        }
}

// MARK: CL location delegate
extension VCMapView: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latitude = locations.last?.coordinate.latitude, let longitude = locations.last?.coordinate.longitude else {
            return
        }
        constrainCamera(latitude: latitude, longitude: longitude)
        print("Location changed")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuth()
    }
}

