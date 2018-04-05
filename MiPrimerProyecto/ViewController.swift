//
//  ViewController.swift
//  MiPrimerProyecto
//
//  Created by Gloria on 22/3/18.
//  Copyright © 2018 Gloria. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblPrueba:UILabel?
    @IBOutlet var txtUser:UITextField?
    @IBOutlet var txtPass:UITextField?
    @IBOutlet var txtVConsola:UITextField?
    @IBOutlet var btnLogin:UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lblPrueba?.text="HELLO!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func eventoClickLogin()
    {
        
        txtVConsola?.text=String(format:"Hola Mundo USUARIO: %@ PASSWORD: %@", (txtUser?.text)!, (txtPass?.text)!)
        print("HEY QUE TAL!!!"+(txtUser?.text)!)
        if txtUser?.text == "Gloria"{
            self.performSegue(withIdentifier: "dd", sender: self)
        }
        else{
            
        }
    }

}

