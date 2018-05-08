//
//  MiCelda1.swift
//  MiPrimerProyecto
//
//  Created by Gloria on 5/4/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class MiCelda1: UITableViewCell {
    @IBOutlet var lblNombre:UILabel?
    @IBOutlet var imgFoto:UIImageView?
     var imagenDescargada:UIImage?
    //var imagenDescargada:UIImage?
    /*override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }*/

   /* override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/
    func mostrarImagen(uri:String) {
        self.imgFoto?.image = nil
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
                self.imgFoto?.image = self.imagenDescargada
            }
        }
        
   /* func mostrarImagen(uri:String) {
        self.imgFoto?.image = nil
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
                self.imgFoto?.image = self.imagenDescargada
            }
        }*/

    //}
    }
    

}
