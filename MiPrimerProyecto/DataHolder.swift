//
//  DataHolder.swift
//  MiPrimerProyecto
//
//  Created by Gloria on 10/4/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseDatabase
import FirebaseStorage

class DataHolder: NSObject {
    static let sharedInstance:DataHolder = DataHolder()
    //var sNick:String = " "
    var arCoches:[Coche] = []
    var HMIMG:[String:UIImage]=[:]
    var numeroCeldasColeccion:UInt=20;
    var locationAdmin:LocationAdmin?
    var firDataBaseRef: DatabaseReference!
    //var arCoches:Array<Coche>?
    var firestoreDB:Firestore?
    var firStorage:Storage?
    
    var miPerfil:Perfil = Perfil()

    func initFireBAse(){
        FirebaseApp.configure()
        firestoreDB = Firestore.firestore()
        firStorage = Storage.storage()
    }
    func initLocationAdmin(){
        locationAdmin=LocationAdmin()
    }
    func DescargarCoche(delegate:DataHolderDelegate) {
        
        self.firestoreDB?.collection("coche").getDocuments() { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
                
            }
            else{
                DataHolder.sharedInstance.arCoches=[]
                
                for document in querySnapshot!.documents {
                    
                    let coche:Coche = Coche()
                    coche.sid=document.documentID
                    coche.setMap(valores: document.data())
                    DataHolder.sharedInstance.arCoches.append(coche)
                    //self.arCoches.append(coche)
                   // print("\(document.documentID) => \(document.data())")
                }
                print("--------- >>>",DataHolder.sharedInstance.arCoches.count)
                delegate.DHDDescargaCiudadesCompleta!(blFin: true)
              //  self.Collection1?.reloadData()
               
            }
        }
        
    }
    
    
    
    func CochesTablas(delegate:DataHolderDelegate) {
        var blfin:Bool = true
        self.firestoreDB?.collection("coche").getDocuments() { (querySnapshot, err) in
        
            if let err = err {
                print("Error getting documents: \(err)")
                blfin = false
            }
            else{
                DataHolder.sharedInstance.arCoches=[]
                
                for document in querySnapshot!.documents {
                    
                    let coche:Coche = Coche()
                    coche.sid=document.documentID
                    coche.setMap(valores: document.data())
                    DataHolder.sharedInstance.arCoches.append(coche)
                    //self.arCoches.append(coche)
                    // print("\(document.documentID) => \(document.data())")
                }
                print("--------- >>>",DataHolder.sharedInstance.arCoches.count)
                blfin=true
                delegate.DHDDescargaCochesCompleta!(blFin: blfin)
                //  self.Collection1?.reloadData()
                
            }
        }
    }
}

@objc protocol DataHolderDelegate{
    @objc optional func DHDDescargaCiudadesCompleta(blFin:Bool)
    @objc optional func DHDDescargaCochesCompleta(blFin:Bool)
    
    
    
}
