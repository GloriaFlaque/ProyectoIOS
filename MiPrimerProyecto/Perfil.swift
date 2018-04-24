//
//  Perfil.swift
//  MiPrimerProyecto
//
//  Created by Gloria on 12/4/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class Perfil: NSObject {
    let IDnombre="nombre"
     let IDapellido="apellido"
     let IDnacimiento="nacimiento"
     let IDaltura="altura"
    
    var nombre:String?
    var iFecha:Int?
    var sApellidos:String?
    var altura: Int?
    
    func setMap(valores: [String:Any]) {
        nombre = valores[IDnombre] as? String
        sApellidos = valores[IDapellido] as? String
        iFecha = valores[IDnacimiento] as? Int
        altura = valores[IDaltura] as? Int
    
        print("Nombre de tu perfil: ",nombre)
         print("Apellidos de tu perfil: ",sApellidos)
         print("Fecha de tu perfil: ",iFecha)
         print("Altura: ",altura)
    }
    
    func getMap() -> [String:Any] {
        return [
            IDnombre: nombre as Any,
            IDapellido: sApellidos as Any,
            IDnacimiento: iFecha as Any,
            IDaltura: altura as Any
        ]
    }

}
