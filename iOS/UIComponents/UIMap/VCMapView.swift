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
    
    // MARK: IB outlets
    @IBOutlet private weak var mapView: MKMapView!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: IB actions
extension VCMapView {
    
}

// MARK: Functions
extension VCMapView {
    private func initialSetup() {
        mapView.delegate = self
        setupInitialLocation()
        constrainCamera()
        mapView.register(
            ArtworkMarkerView.self,
          forAnnotationViewWithReuseIdentifier:
            MKMapViewDefaultAnnotationViewReuseIdentifier)
        loadInitialData()
        mapView.addAnnotations(artworks)
    }
    
    private func setupInitialLocation() {
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        mapView.centerToLocation(initialLocation, regionRadius: 800)
    }
    
    private func constrainCamera() {
        let oahuCenter = CLLocation(latitude: 21.4765, longitude: -157.9647)
        let region = MKCoordinateRegion(
            center: oahuCenter.coordinate,
            latitudinalMeters: 50000,
            longitudinalMeters: 60000)
        mapView.setCameraBoundary(
            MKMapView.CameraBoundary(coordinateRegion: region),
            animated: true)
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 200000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
    }

    private func loadInitialData() {
        guard
            let fileName = Bundle.main.url(forResource: "PublicArt", withExtension: "geojson"),
            let artworkData = try? Data(contentsOf: fileName) else {
            return
        }
        do {
            let features = try MKGeoJSONDecoder()
                .decode(artworkData)
                .compactMap{ $0 as? MKGeoJSONFeature }
            let validWorks = features.compactMap(Artwork.init)
            artworks.append(contentsOf: validWorks)
        } catch {
            print("Unexpected error: ", error)
        }
    }
}

// MARK: MKMapView extension
private extension MKMapView {
    func centerToLocation(
        _ location: CLLocation,
        regionRadius: CLLocationDistance = 1000
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
