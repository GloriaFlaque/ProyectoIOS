//
//  VCItem2.swift
//  MiPrimerProyecto
//
//  Created by Gloria on 5/4/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class VCItem2: UIViewController, UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        /*let cell:MiCelda1 =
            tableView.dequeueReusableCell(withReuseIdentifier: "IDTable", for: indexPath) as! MiCelda1
        cell.lblNombre?.text =
            DataHolder.sharedInstance.arCoches[indexPath.row].sNombre
        cell.mostrarImagen(uri: DataHolder.sharedInstance.arCoches[indexPath.row].sUrl_image!)*/
        
        
        
        
        
        
        
        
        let cell:MiCelda1 = tableView.dequeueReusableCell(withIdentifier: "miTabla1") as! MiCelda1
       
        if indexPath.row == 0 {
            cell.lblNombre?.text="Gloria"
            cell.imgFoto?.image=#imageLiteral(resourceName: "IMG_9822")
        }
        else if indexPath.row == 1 {
            cell.lblNombre?.text="Laura"
            cell.imgFoto?.image=#imageLiteral(resourceName: "IMG_9901")
            
        }
        else if indexPath.row == 2 {
            cell.lblNombre?.text="Jose"
            cell.imgFoto?.image=#imageLiteral(resourceName: "IMG_9042")
        }
        else if indexPath.row == 3 {
            cell.lblNombre?.text="María"
            cell.imgFoto?.image=#imageLiteral(resourceName: "IMG_9110")
            
        }
        return cell
    }
    

    @IBOutlet var tabla1:UITableView?
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("************* ",DataHolder.sharedInstance.firestoreDB)
       /* DataHolder.sharedInstance.firestoreDB?.collection("coche").getDocuments() { (querySnapshot, err) in
            
            if let err = err {
                print("Error getting documents: \(err)")
                
            }
            else{
                //print("]]]]]]]pppppppppppppppp")
                DataHolder.sharedInstance.arCoches=[]
                
                for document in querySnapshot!.documents {
                    print("WOWOWOWOWOOWOW")
                    let coche:Coche = Coche()
                    coche.sid=document.documentID
                    coche.setMap(valores: document.data())
                    DataHolder.sharedInstance.arCoches.append(coche)
                    //self.arCoches.append(coche)
                    print("\(document.documentID) => \(document.data())")
                }
                print("--------- >>>",DataHolder.sharedInstance.arCoches.count)
                self.tabla1?.reloadData()
            }}}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func refreshUI() {
        DispatchQueue.main.async {
            self.tableView?.reloadData()
        }
    }
    return cell
}

func refreshUI() {
    DispatchQueue.main.async {
        self.Collection1?.reloadData()
    }
}*/
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
        
        }

}

