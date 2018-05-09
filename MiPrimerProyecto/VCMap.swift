//
//  VCMap.swift
//  MiPrimerProyecto
//
//  Created by Gloria on 19/4/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

class VCMap: UIViewController, CLLocationManagerDelegate,  LocationAdminDelegate, DataHolderDelegate {
    @IBOutlet var miMapa: MKMapView?
    
    var pines:[String:MKAnnotation]? = [:]
    var locationManager:CLLocationManager?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.DescargarCoche(delegate: self)
        miMapa?.showsUserLocation = true
        
        
      /*  DataHolder.sharedInstance.firDataBaseRef.child("coche").observe(DataEventType.value, with: { (snapshot)
            in
            let arTemp=snapshot.value as? Array<AnyObject>
            DataHolder.sharedInstance.arCoches=Array<Coche>()
            for co in arTemp! as [AnyObject] {
                let cochei=Coche()
                DataHolder.sharedInstance.arCoches.append(cochei)
                var coordTemp:CLLocationCoordinate2D = CLLocationCoordinate2D()
                coordTemp.latitude = cochei.dLat!
                coordTemp.longitude = cochei.dLon!
                self.agregarPin(coordenada: coordTemp, titulo: cochei.sNombre!)
            }
        })*/
        
        
        
      /* DataHolder.sharedInstance.firestoreDB?.collection("coche").getDocuments() { (snapshot, err)
            in
            //let arTemp = snapshot.value as? Array<AnyObject>
        
            DataHolder.sharedInstance.arCoches=Array<Coche>()
            
            for co in arTemp! as [AnyObject] {
                let cochei=Coche(valores: co as! [String:AnyObject])
                DataHolder.sharedInstance.arCoches?.append(cochei)
                var coordTemp:CLLocationCoordinate2D = CLLocationCoordinate2D()
                coordTemp.latitude = cochei.dLat!
                coordTemp.longitude = cochei.dLon!
                agregarPin(coordenada: coordTemp, titulo: cochei.sNombre)
            }
            
        }*/
        
        
        //DataHolder.sharedInstance.locationAdmin?.delegate=self
        
      /* var coordTemp:CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp.latitude = 40.4165
        coordTemp.longitude = -4.702
        agregarPin(coordenada: coordTemp, titulo: "PIN1")
        
        var coordTemp2:CLLocationCoordinate2D = CLLocationCoordinate2D()
        coordTemp2.latitude = 47.4165
        coordTemp2.longitude = -8.702
        agregarPin(coordenada: coordTemp, titulo: "PIN2")*/
        
        
        
       /* self.agregarpin(titulo: "HOLA", latitude: 42, longitude: -3)*/
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.startUpdatingLocation()
        miMapa?.showsUserLocation = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
   /* func DHDDescargaCiudadesCompleta(blFin: Bool) {
        if blFin{
            self.
        }
    }*/
    
    func agregarPin(coordenada:CLLocationCoordinate2D, titulo varTitulo:String){
        var annotation: MKPointAnnotation = MKPointAnnotation()
        if(pines?[varTitulo] == nil){
            
        }
        else{
            annotation = pines?[varTitulo] as! MKPointAnnotation
            miMapa?.removeAnnotation(annotation)
        }
        annotation.coordinate = coordenada
        annotation.title = varTitulo
        pines?[varTitulo] = annotation
        miMapa?.addAnnotation(annotation)
    }
    
    func LocalizacionActualizada(coordenada:CLLocationCoordinate2D){
        centralizarEnPosicion(coordenada: coordenada)
    }
    
    func centralizarEnPosicion(coordenada:CLLocationCoordinate2D){
        //let region:MKCoordinateRegion = MKCoordinateRegion(center:coordenada, span:MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
        //miMapa?.setRegion(region, animated: true)
    }
    func mapView(_mapView: MKMapView, didUpdate userLocation: MKUserLocation){
        centralizarEnPosicion(coordenada: userLocation.coordinate)
    }
    
    func DHDDescargaCiudadesCompleta(blFin: Bool) {
        if blFin{
            for co in DataHolder.sharedInstance.arCoches {
                self.agregarpin(titulo: co.sNombre!, latitude: co.dLat!, longitude: co.dLon!)
            }
        }
    }
    
    
    func agregarpin(titulo:String, latitude lat:Double, longitude long:Double){
        var miPin:MKPointAnnotation = MKPointAnnotation()
        
        if (pines?[titulo] == nil) {
            
        }
        else{
            miPin = pines?[titulo] as! MKPointAnnotation
            miMapa?.removeAnnotation(miPin)
        }
      //print(long,"       fdfg       ",lat)
        miPin.coordinate.longitude = long
        miPin.coordinate.latitude = lat
        miPin.title = titulo
        pines?[titulo] = miPin
        miMapa?.addAnnotation(miPin)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print(locations[0])
        self.nuevaregionmapa(latitude: locations[0].coordinate.latitude, longitude: locations[0].coordinate.longitude)
    }
    func nuevaregionmapa(latitude lat: Double,longitude long:Double){
        let miSpan:MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: 0.01,longitudeDelta: 0.01)
        let puntoCentro:CLLocationCoordinate2D = CLLocationCoordinate2D(latitude : lat,longitude: long)
        let miRegion:MKCoordinateRegion = MKCoordinateRegion(center: puntoCentro, span :miSpan)
        miMapa?.setRegion(miRegion, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
