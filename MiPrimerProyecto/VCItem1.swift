//
//  Item1.swift
//  MiPrimerProyecto
//
//  Created by Gloria on 5/4/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class VCItem1: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
 
    
    @IBOutlet var Collection1:UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda:CVCGatos = collectionView.dequeueReusableCell(withReuseIdentifier: "IDCeldaCol", for: indexPath) as! CVCGatos
        
        if indexPath.row == 0 {
            celda.lblNombre?.text="Luck"
            celda.imggato?.image=#imageLiteral(resourceName: "luck")
        }
        else if indexPath.row == 1 {
            celda.lblNombre?.text="Lulu"
            celda.imggato?.image=#imageLiteral(resourceName: "lulu")
            
        }
        else if indexPath.row == 2 {
            celda.lblNombre?.text="Babi"
            celda.imggato?.image=#imageLiteral(resourceName: "babi")
        }
        else if indexPath.row == 3 {
            celda.lblNombre?.text="Bairon"
            celda.imggato?.image=#imageLiteral(resourceName: "bairon")
            
        }
        else if indexPath.row == 4 {
            celda.lblNombre?.text="Julieta"
            celda.imggato?.image=#imageLiteral(resourceName: "julieta")
            
        }
        
        return celda
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
