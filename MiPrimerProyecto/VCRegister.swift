//
//  VCRegister.swift
//  MiPrimerProyecto
//
//  Created by Gloria on 3/4/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit
import FirebaseAuth

class VCRegister: UIViewController {
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtEmail:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var txtRepetirPassword:UITextField?
    @IBOutlet var btnAceptar:UIButton?
    @IBOutlet var btnCancelar:UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func eventoClickCancelar(){
    self.performSegue(withIdentifier: "Identificador2", sender: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func clickRegistrar(){
        DataHolder.sharedInstance.miPerfil.nombre = "Gloria"
        DataHolder.sharedInstance.miPerfil.sApellidos = "Flaqué"
        DataHolder.sharedInstance.miPerfil.iFecha = 1999
        DataHolder.sharedInstance.miPerfil.altura = 23

        
        Auth.auth().createUser(withEmail: (txtEmail?.text)!, password:
        (txtPass?.text)!){ (user, error) in
            if user != nil{
                print("TE REGISTRASTES")
                //self.perform(shouldPerformSegue(withIdentifier: "", sender: self))
               
                DataHolder.sharedInstance.firestoreDB?.collection("Perfiles").document((user?.uid)!).setData(DataHolder.sharedInstance.miPerfil.getMap());
                self.performSegue(withIdentifier: "cc", sender: self)
            }
            else {
                print(error!)
            }
        }
        print("HOLA!")
    }

}

