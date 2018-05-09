//
//  Coche.swift
//  MiPrimerProyecto
//
//  Created by Gloria on 19/4/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class Coche: NSObject {
    var sNombre:String?
    var sMarca:String?
    var iFabricado:Int?
    var sid:String?
    var sUrl_image:String?
    var dLon:Double?
    var dLat:Double?


    
    let IDNombre = "Nombre"
    let IDMarca = "Marca"
    let IDFabricado = "Fabricado"
    let IDurlimage = "url_image"
    let IDLong = "latitud"
    let IDLat = "longitud"
    
   /*init(valores:[String:AnyObject]) {
        sNombre=valores["Nombre"] as? String
        sMarca=valores["Marca"] as? String
        iFabricado=valores["Fabricado"] as? Int
    }*/
    func setMap(valores:[String:Any])  {
        sNombre=valores[IDNombre] as? String
        sMarca=valores[IDMarca] as? String
        iFabricado=valores[IDFabricado] as? Int
        sUrl_image=valores[IDurlimage] as? String
        dLon=valores[IDLong] as? Double
        dLat=valores[IDLat] as? Double
        
        //if IDurlimage == nil{
        //    IDurlimage = "nada"
       // }
        
    }
    func getMap() -> [String:Any] {
        return[
            IDNombre: sNombre as? Any,
            IDMarca: sMarca as? Any,
            IDFabricado: iFabricado as? Any
        ]
    
    }

}
