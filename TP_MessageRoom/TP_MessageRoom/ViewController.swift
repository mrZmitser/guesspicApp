//
//  ViewController.swift
//  TP_MessageRoom
//
//  Created by Admin on 22.04.2021.
//

import UIKit
var messages:[String] = ["", "", "", "", "", "", "", "", "", "", "", ""]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonMessage: UIButton!
    @IBOutlet weak var lableMassege: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 44.0
        registerForKeyboardNotifications()
    }

  
    
    @IBAction func buttonMessageClick(_ sender: Any) {
        if message.text != ""   {
            messages.append(message.text)
            tableView.beginUpdates()
            if(messages[0] == "")
            {
                tableView.deleteRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
                messages.remove(at: 0)
            }
            
            tableView.insertRows(at: [IndexPath(row: messages.count - 1, section: 0)], with: .automatic)
            tableView.endUpdates()
                       
            let indexPath = NSIndexPath(item: messages.count - 1, section: 0)
            tableView.scrollToRow(at: indexPath as IndexPath, at: UITableView.ScrollPosition.bottom, animated: true)
            message.text = ""
        }
        message.resignFirstResponder()
        buttonMessage.resignFirstResponder()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //cell.transform = tableView.transform
        cell.textLabel?.text = messages[indexPath.row]
        return cell
    }
    deinit {
            removeKeyboardNotifications()
        }

    func registerForKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    var checer = true
    @objc func kbWillShow(_ notification: Notification) {
            let userInfo = notification.userInfo
        let kbFrameSize = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        tableView.transform = CGAffineTransform(scaleX: 1, y: -1)
//
//        if(messages.count != 0) {
//            if(checer) {
//                tableView.beginUpdates()
//                tableView.moveRow(at: IndexPath(row: 0, section: 0), to: IndexPath(row: messages.count - 1, section: 0))
//                tableView.endUpdates()
//                    checer = false
//            }
//            for i in 0...messages.count-1 {
//                let indexPath = IndexPath(row: i, section: 0)
//                let cell = tableView.cellForRow(at: indexPath)
//                cell!.transform = tableView.transform
//            }
//        }
        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height - 30)
        }
    
    @objc func kbWillHide() {
//        tableView.transform = CGAffineTransform(scaleX: 1, y: 1)
        
//        if(messages.count != 0)
//        {
//            if(!checer)
//            {
//            tableView.moveRow(at: IndexPath(row: 0, section: 0), to: IndexPath(row: messages.count - 2, section: 0))
//            tableView.endUpdates()
//                checer = true
//            }
//            for i in 0...messages.count-1
//            {
//                let indexPath = IndexPath(row: i, section: 0)
//                let cell = tableView.cellForRow(at: indexPath)
//                cell!.transform = tableView.transform
//            }
//        }
        scrollView.contentOffset = CGPoint.zero
        }
    
}

