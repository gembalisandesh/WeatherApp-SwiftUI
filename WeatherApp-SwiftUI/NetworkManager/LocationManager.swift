//
//  LocationManager.swift
//  WeatherApp-SwiftUI
//
//  Created by Gembali Sandesh Kumar on 07/01/24.
//

import CoreLocation
import Combine

class LocationManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    static let shared = LocationManager()

        @Published var currentLocation: CLLocationCoordinate2D?
        @Published var isAuthorized: Bool = false

        private var locationManager: CLLocationManager
        private var locationUpdateCompletion: ((CLLocationCoordinate2D?) -> Void)?

    private override init() {
        self.locationManager = CLLocationManager()
        super.init()
        setupLocationManager()
    }
    

    func requestAuthorization() {
        locationManager.requestWhenInUseAuthorization()
    }

    private func setupLocationManager() {
        locationManager.delegate = self

        if CLLocationManager.locationServicesEnabled() {
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            requestAuthorization()
        } else {
            print("Location services are not enabled.")
        }
    }

    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        isAuthorized = manager.authorizationStatus == .authorizedWhenInUse
        switch manager.authorizationStatus {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
        case .denied, .restricted:
            print("Location access denied or restricted.")
        case .notDetermined:
            print("Location authorization status not determined yet.")
        @unknown default:
            fatalError("Unhandled case in locationManagerDidChangeAuthorization.")
        }
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last?.coordinate else { return }
        currentLocation = location
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Location manager error: \(error.localizedDescription)")
    }
    func getCurrentLocation(completion: @escaping (CLLocationCoordinate2D?) -> Void) {
            if let location = locationManager.location?.coordinate {
                completion(location)
            } else {
                locationManager.requestLocation()
            
                self.locationUpdateCompletion = completion
            }
        }
}
