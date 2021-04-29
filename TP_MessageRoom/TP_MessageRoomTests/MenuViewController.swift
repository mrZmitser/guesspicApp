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
            performSegue(withIdentifier: "GoPlay", sender: nil)
        }
        else{
            performSegue(withIdentifier: "GoPlay", sender: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
