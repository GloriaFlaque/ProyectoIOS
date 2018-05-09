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
    
    
    /*
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
    */
    func Registrarse(delegate:DataHolderDelegate, sEmail:String, sPassword:String) {
        var blfin:Bool = true
        //print(sEmail, "    fdgdfg    ", sPassword, "    dfgdf   ")
        Auth.auth().createUser(withEmail: (sEmail), password:
        (sPassword)){ (user, error) in
            if user != nil{
                print("TE REGISTRASTES")
                //self.perform(shouldPerformSegue(withIdentifier: "", sender: self))
                delegate.DHDDRegistro!(blFin: true)
                self.firestoreDB?.collection("Perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap());
            }
            else {
                print(error!)
                delegate.DHDDRegistro!(blFin: false)
            }
        }
        print("HOLA!")
    }
    
    func Login(delegate:DataHolderDelegate, sEmail:String, sPassword:String) {
         var blfin:Bool = true
        print(sEmail, "    fdgdfg    ", sPassword, "    dfgdf   ")
        Auth.auth().signIn(withEmail: (sEmail), password: (sPassword)) {
            (user, error) in
            if user != nil{
                let ruta =
                    DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document((user?.uid)!)
                ruta?.getDocument { (document, error) in
                    if document != nil{
                        self.miPerfil.setMap(valores: (document?.data()!)!)
                        print(document?.data())
                        delegate.DHDDLogin!(blFin: true)
                    }
                    
                }
                
            }
            else{
                print("No se ha logueado")
                print(error!)
                delegate.DHDDLogin!(blFin: false)
            }
        }
    }
    
}

@objc protocol DataHolderDelegate{
    @objc optional func DHDDescargaCiudadesCompleta(blFin:Bool)
    //@objc optional func DHDDescargaCochesCompleta(blFin:Bool)
    @objc optional func DHDDRegistro(blFin:Bool)
    @objc optional func DHDDLogin(blFin:Bool)
    
    
    
}
