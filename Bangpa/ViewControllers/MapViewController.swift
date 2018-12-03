////
////  MapViewController.swift
////  Bangpa
////
////  Created by 이동건 on 20/08/2018.
////  Copyright © 2018 이동건. All rights reserved.
////
//
//import UIKit
//
//class MapViewController: UIViewController {
//    
//    private var mapView: NMapView!
//    private var mapVCPresenter = MapVCPresenter(with: NMapLocationManager.getSharedInstance())
//    @IBOutlet weak var changeStateButton: UIButton!
//    
//    static func initFromStoryboard() -> UINavigationController {
//        let storyboard = UIStoryboard(name: MapViewController.reusableIdentifier, bundle: nil)
//        let navigationController = storyboard.instantiateViewController(withIdentifier: "MapViewNavigationController") as! UINavigationController
//        return navigationController
//    }
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        mapVCPresenter.attachView(vc: self)
//        setupMapView()
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        self.navigationController?.navigationBar.setGradientBackground(colors: [UIColor.gradientStartBlue, UIColor.gradientEndBlue])
//    }
//    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        
//        mapVCPresenter.disableLocationUpdate()
//    }
//    
//    @IBAction func searchCompleteButtonDidTapped(_ sender: Any) {
//        self.dismiss(animated: true, completion: nil)
//    }
//    
//    @IBAction func buttonClicked(_ sender: UIButton) {
//        mapVCPresenter.setupState()
//    }
//    
//    fileprivate func setupMapView() {
//        mapView = NMapView(frame: self.view.frame)
//        
//        if let mapView = mapView {
//            // set the delegate for map view
//            mapView.delegate = self
//            
//            // set the application api key for Open MapViewer Library
//            mapView.setClientId("A9L2FC3umEXG5OKmJJNA")
//            mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//            
//            view.addSubview(mapView)
//            view.bringSubview(toFront: changeStateButton)
//        }
//    }
//    
//    public func onMapView(_ mapView: NMapView!, initHandler error: NMapError!) {
//        if (error == nil) { // success
//            // set map center and level
//            mapView.setMapCenter(NGeoPoint(longitude:126.978371, latitude:37.5666091), atLevel:11)
//            
//            // set for retina display
//            mapView.setMapEnlarged(true, mapHD: true)
//        } else { // fail
//            print("onMapView:initHandler: \(error.description)")
//        }
//    }
//}
//
//extension MapViewController: NMapViewDelegate, NMapPOIdataOverlayDelegate {
//    func onMapOverlay(_ poiDataOverlay: NMapPOIdataOverlay!, imageForOverlayItem poiItem: NMapPOIitem!, selected: Bool) -> UIImage! {
//        return NMapViewResources.imageWithType(poiItem.poiFlagType, selected: selected)
//    }
//    
//    func onMapOverlay(_ poiDataOverlay: NMapPOIdataOverlay!, anchorPointWithType poiFlagType: NMapPOIflagType) -> CGPoint {
//        return NMapViewResources.anchorPoint(withType: poiFlagType)
//    }
//    
//    func onMapOverlay(_ poiDataOverlay: NMapPOIdataOverlay!, imageForCalloutOverlayItem poiItem: NMapPOIitem!, constraintSize: CGSize, selected: Bool, imageForCalloutRightAccessory: UIImage!, calloutPosition: UnsafeMutablePointer<CGPoint>!, calloutHit calloutHitRect: UnsafeMutablePointer<CGRect>!) -> UIImage! {
//        return nil
//    }
//    
//    func onMapOverlay(_ poiDataOverlay: NMapPOIdataOverlay!, calloutOffsetWithType poiFlagType: NMapPOIflagType) -> CGPoint {
//        return CGPoint(x: 0, y: 0)
//    }
//}
//
//extension MapViewController: MapViewProtocol {
//    func updateState(_ newState: TrackingState) {
//        switch newState {
//        case .disabled:
//            changeStateButton?.setImage(#imageLiteral(resourceName: "v4_btn_navi_location_normal"), for: .normal)
//        case .tracking:
//            changeStateButton?.setImage(#imageLiteral(resourceName: "v4_btn_navi_location_selected"), for: .normal)
//        }
//    }
//    
//    func clearMyLocation() {
//        mapView?.mapOverlayManager.clearMyLocationOverlay()
//    }
//    
//    func setupMyLocation(location: NGeoPoint, locationAccuracy: Float) {
//        mapView?.mapOverlayManager.setMyLocation(location, locationAccuracy: locationAccuracy)
//        mapView?.setMapCenter(location)
//    }
//    
//    func showLocaitonFailError(title: String, message: String) {
//        if (!message.isEmpty) {
//            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title:"OK", style:.default, handler: nil))
//            present(alert, animated: true, completion: nil)
//        }
//        
//        if let mapView = mapView, mapView.isAutoRotateEnabled {
//            mapView.setAutoRotateEnabled(false, animate: true)
//        }
//    }
//}
