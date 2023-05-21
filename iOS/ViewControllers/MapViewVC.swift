//
//  VCMapView.swift
//  iOS
//
//  Created by Shubham Jitiya on 15/05/23.
//

import UIKit
import MapKit

class MapViewVC: UIViewController {
    // MARK: Variables
    private var artworks: [Artwork] = []
    private var locationManager = CLLocationManager()
    
    // MARK: IB outlets
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: Functions
extension MapViewVC {
    private func initialSetup() {
        mapView.delegate = self
        configureLocationPermission()
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
            latitude: Constants.Location.initialLatitude.rawValue,
            longitude: Constants.Location.initialLongitude.rawValue)
        mapView.centerToLocation(initialLocation, regionRadius: Constants.Location.initialRange.rawValue)
    }
    
    private func constrainCamera(
        latitude: CLLocationDegrees = Constants.Location.oahuLatitude.rawValue,
        longitude: CLLocationDegrees = Constants.Location.oahuLongitude.rawValue) {
            let oahuCenter = CLLocation(latitude: latitude, longitude: longitude)
            let region = MKCoordinateRegion(
                center: oahuCenter.coordinate,
                latitudinalMeters: Constants.Location.constrainLatitude.rawValue,
                longitudinalMeters: Constants.Location.constrainLongitude.rawValue)
            mapView.setCameraBoundary(
                MKMapView.CameraBoundary(coordinateRegion: region),
                animated: true)
            let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: Constants.Location.maxCoordinate.rawValue)
            mapView.setCameraZoomRange(zoomRange, animated: true)
        }
    
    private func loadInitialData() {
        artworks = Helper.jsonDecodeArtwork(json: Helper.Json.publicArt)
    }
    
    private func clLocationSetup() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func configureLocationPermission() {
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
            // locationManager.requestAlwaysAuthorization()
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
        regionRadius: CLLocationDistance = Constants.Location.regionRadius.rawValue
    ) {
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        setRegion(coordinateRegion, animated: true)
    }
}

// MARK: MKMapView delegate methods
extension MapViewVC: MKMapViewDelegate {
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
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
    }
}

// MARK: CL location delegate
extension MapViewVC: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latitude = locations.last?.coordinate.latitude, let longitude = locations.last?.coordinate.longitude else {
            return
        }
        constrainCamera(latitude: latitude, longitude: longitude)
        print("Location changed")
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        configureLocationPermission()
    }
}

