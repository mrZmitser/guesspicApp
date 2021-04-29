//
//  MenuViewController.swift
//  TP_MessageRoom
//
//  Created by Admin on 28.04.2021.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func buttonCreateUser(_ sender: Any) {
        if textField.text == ""
        {
            textField.text = "User"
            let vc = storyboard?.instantiateViewController(withIdentifier: "GoPlay") as! ViewController
            //vc.property = "Green View Controller"
            self.navigationController?.pushViewController(vc, animated: true)
           // performSegue(withIdentifier: "GoPlay", sender: self)
        }
        else{
            let vc = storyboard?.instantiateViewController(withIdentifier: "GoPlay") as! ViewController
            //vc.property = "Green View Controller"
            self.navigationController?.pushViewController(vc, animated: true)
            //performSegue(withIdentifier: "GoPlay", sender: self)
        }
    }

}
