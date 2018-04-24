//
//  ViewController.swift
//  MiPrimerProyecto
//
//  Created by Gloria on 22/3/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    @IBOutlet var lblPrueba:UILabel?
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var txtVConsola:UITextField?
    @IBOutlet var btnLogin:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // txtUser?.text = DataHolder.sharedInstance.sNick
        //DataHolder.sharedInstance.sNick="Nacho"
        
        lblPrueba?.text="HELLO!"
        
        /*do{
            try Auth.auth().signOut()
        }
        catch{
            
        }*/
        /*Auth.auth().addStateDidChangeListener { (auth, user) in
            // ...
            if user != nil{
                //self.performSegue(withIdentifier: "trlogin", sender: self)
            }
        }*/
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func eventoClickLogin()
    {
        
        //txtVConsola?.text=String(format:"Hola Mundo USUARIO: %@ PASSWORD: %@", (txtUser?.text)!, (txtPass?.text)!)
        print("HEY QUE TAL!!!"+(txtUser?.text)!)
        Auth.auth().signIn(withEmail: (txtUser?.text)!, password: (txtPass?.text)!) {
            (user, error) in
            if user != nil{
                let ruta =
                    DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document((user?.uid)!)
                ruta?.getDocument { (document, error) in
                    if document != nil{
                        DataHolder.sharedInstance.miPerfil.setMap(valores: (document?.data()!)!)
                        print(document?.data())
                        self.performSegue(withIdentifier: "dd", sender: self)
                    }
                    
                }
                
            }
            else{
                print("No se ha logueado")
                print(error!)
            }
        }
        //if txtUser?.text == "Gloria"{
        
       // }
       
    }
  
}

