//
//  CVCGatos.swift
//  MiPrimerProyecto
//
//  Created by Gloria on 5/4/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class CVCGatos: UICollectionViewCell {
    @IBOutlet var lblNombre: UILabel?
    @IBOutlet var imggato: UIImageView?
    var imagenDescargada:UIImage?

    /*func mostrarImagen(uri:String) {
        self.imggato?.image = nil
        // if imagenDescargada == nil {
        
        
        // Create a reference to the file you want to download
        let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
        
        
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if error != nil {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                // let image = UIImage(data: data!)
                self.imagenDescargada = UIImage(data: data!)
                self.imggato?.image = self.imagenDescargada
            }
        }*/
        
        func mostrarimagen2(uri:String) {
            let IMGDES = DataHolder.sharedInstance.HMIMG[uri]
            if(IMGDES != nil) {
                imggato?.image = IMGDES
            }
            else{
                let gsReference = DataHolder.sharedInstance.firStorage?.reference(forURL: uri)
                
                
                // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
                gsReference?.getData(maxSize: 1 * 1024 * 1024) { data, error in
                    if error != nil {
                        // Uh-oh, an error occurred!
                    } else {
                        // Data for "images/island.jpg" is returned
                        // let image = UIImage(data: data!)
                        self.imagenDescargada = UIImage(data: data!)
                        self.imggato?.image = self.imagenDescargada
                        DataHolder.sharedInstance.HMIMG[uri] = self.imagenDescargada
                    }
                }
                
            }
        }
        
        
        
        //}
    }

