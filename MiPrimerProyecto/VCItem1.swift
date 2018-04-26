//
//  Item1.swift
//  MiPrimerProyecto
//
//  Created by Gloria on 5/4/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class VCItem1: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,DataHolderDelegate {
    
 
    
    @IBOutlet var Collection1:UICollectionView?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DataHolder.sharedInstance.DescargarCoche(delegate: self)
        //print("************* ",DataHolder.sharedInstance.firestoreDB)
           /* DataHolder.sharedInstance.firestoreDB?.collection("coche").getDocuments() { (querySnapshot, err) in
                
                if let err = err {
                    print("Error getting documents: \(err)")
                    
                }
                else{
                    //print("]]]]]]]pppppppppppppppp")
                    DataHolder.sharedInstance.arCoches=[]
                    
                    for document in querySnapshot!.documents {
                      
                        let coche:Coche = Coche()
                        coche.sid=document.documentID
                        coche.setMap(valores: document.data())
                        DataHolder.sharedInstance.arCoches.append(coche)
                        //self.arCoches.append(coche)
                        print("\(document.documentID) => \(document.data())")
                    }
                    print("--------- >>>",DataHolder.sharedInstance.arCoches.count)
                    self.Collection1?.reloadData()
                }
               
                //let coche0=Coche(valores: arTemp?[0] as! [String : AnyObject])
                //let coche0=arTemp?[0] as? [String:AnyObject]
                // print("El coche en la posicion 0 es: ",coche0.sNombre!)
                // print("LO DESCARGADO ES: ",snapshot.value )
                //if(DataHolder.sharedInstance.arCoches==nil){
                  //  DataHolder.sharedInstance.arCoches=Array<Coche>()
                //}
                
                /*for co in arTemp! as [AnyObject]{
                    let cochei=Coche(valores: co as! [String:AnyObject])
                    DataHolder.sharedInstance.arCoches?.append(cochei)
                    
                }*/
               // self.Collection1?.reloadData()
                
                
            }*/
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    func DHDDescargaCiudadesCompleta(blFin: Bool) {
        if blFin{
            self.Collection1?.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataHolder.sharedInstance.arCoches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda:CVCGatos =
            collectionView.dequeueReusableCell(withReuseIdentifier: "IDCeldaCol", for: indexPath) as! CVCGatos
        celda.lblNombre?.text =
            DataHolder.sharedInstance.arCoches[indexPath.row].sNombre
        celda.mostrarImagen(uri: DataHolder.sharedInstance.arCoches[indexPath.row].sUrl_image!)
        
        
        
        
        
        
      //  let _:Coche=DataHolder.sharedInstance.arCoches![indexPath.row]
        
       /*if indexPath.row == 0 {
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
            
        }*/
        
        return celda
    }
    
    func refreshUI() {
        DispatchQueue.main.async {
            self.Collection1?.reloadData()
        }
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
