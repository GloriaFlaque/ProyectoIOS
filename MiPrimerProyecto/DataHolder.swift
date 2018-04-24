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
}
