import UIKit
import GoogleMaps

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapChange: UISegmentedControl!
    
    internal static var camera = GMSCameraPosition.camera(withLatitude: 42.923275, longitude: -83.627256, zoom: 15.25)
    internal var mapView = GMSMapView.map(withFrame: CGRect.zero, camera:camera)
    
    @IBAction func changeMapType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.mapView.mapType = kGMSTypeNormal
        case 1:
            self.mapView.mapType = kGMSTypeSatellite
        case 2:
            self.mapView.mapType = kGMSTypeHybrid
        case 3:
            self.mapView.mapType = kGMSTypeTerrain
        default:
            self.mapView.mapType = kGMSTypeNone
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let east = CLLocationCoordinate2DMake(42.91995, -83.624859)
        let west = CLLocationCoordinate2DMake(42.920577, -83.630655)
        
        let eastmarker = GMSMarker()
        eastmarker.position = east
        eastmarker.appearAnimation = kGMSMarkerAnimationPop
        eastmarker.title = "Grand Blanc High School"
        eastmarker.snippet = "East Campus"
        
        eastmarker.map = mapView
        
        let westmarker = GMSMarker()
        westmarker.position = west
        westmarker.appearAnimation = kGMSMarkerAnimationPop
        westmarker.title = "Grand Blanc High School"
        westmarker.snippet = "West Campus"
        westmarker.map = mapView
        
        self.view = mapView
}
}
