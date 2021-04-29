//
//  ViewController.swift
//  TP_MessageRoom
//
//  Created by Admin on 22.04.2021.
//

import UIKit
var messages:[String] = []

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    var users:[String]=["x"]
    var scores:[Int]=[0]
    
    @IBOutlet weak var scoreTableView: UITableView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var message: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonMessage: UIButton!
    @IBOutlet weak var lableMassege: UILabel!
    
    @IBOutlet weak var canvas: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.estimatedRowHeight = 44.0
        registerForKeyboardNotifications()
        //scrollView.contentInsetAdjustmentBehavior = .never
        if users.count > 0    {
            scoreTableView.beginUpdates()
            scoreTableView.insertRows(at: [IndexPath(row: users.count - 1, section: 0)], with: .automatic)
            scoreTableView.endUpdates()
        }
    }
    
    
//    var lastPoint : CGPoint = CGPoint(x:0,y:0)
//    var drawingColor = UIColor.black
//    let canvasWidth = 5.0
//    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first
//        lastPoint = (touch?.location(in: self.canvas))!
//        print(lastPoint)
//    }
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        let touch = touches.first
//        let currentPoint = (touch?.location(in: self.canvas))!
//        UIGraphicsBeginImageContext(self.canvas.frame.size)
//        let drawRect = CGRect.init(x: 0.0, y: 0.0, width: self.canvas.frame.width, height: self.canvas.frame.height)
//        self.canvas.image?.draw(in: drawRect)
//        let context = UIGraphicsGetCurrentContext()
//        context?.setStrokeColor(drawingColor.cgColor)
//        context?.setLineCap(CGLineCap.round)
//        context?.setLineWidth(CGFloat(canvasWidth))
//        context?.beginPath()
//        context?.move(to: lastPoint)
//        context?.addLine(to: currentPoint)
//        context?.strokePath()
//        self.canvas.image = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        lastPoint = currentPoint
//    }
    
    
    @IBAction func buttonMessageClick(_ sender: Any) {
        if message.text != ""   {
            messages.append(message.text)
            tableView.beginUpdates()
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
        if tableView == self.tableView {
            return messages.count
        }
        else{
            return users.count
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == self.tableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            // cell.backgroundColor = UIColor.darkGray
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 0.2
            cell.layer.cornerRadius = 12
            cell.clipsToBounds = true
            //cell.transform = tableView.transform
            cell.textLabel?.text = messages[indexPath.row]
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellScore", for: indexPath)
            cell.textLabel?.text = users[indexPath.row]
            cell.detailTextLabel?.text = String(scores[indexPath.row])
            return cell
        }
        return UITableViewCell()
        
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
        
        scrollView.contentOffset = CGPoint(x: 0, y: kbFrameSize.height - 29)
    }
    
    @objc func kbWillHide() {
        scrollView.contentOffset = CGPoint.zero
    }
    
}

