//
//  ItemDetailTableViewController.swift
//  TaskDaysMatter
//
//  Created by Yuan REN on 2017/5/16.
//  Copyright © 2017年 Yuan REN. All rights reserved.
//

import UIKit

class ItemDetailTableViewController: UITableViewController {
    
    //MARK: Outlets
    @IBOutlet weak var itemNameTextField: UITextField!
    @IBOutlet weak var itemDescriptionTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!

    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var timeLeftLabel: UILabel!
    
    @IBOutlet weak var colorNumLabel: UILabel!
    var colorNum: Int = 0
    
    
    
    // MARK: Actions
    @IBAction func cancelButtonPressed(_ sender: AnyObject) {
        if(presentingViewController != nil){
            dismiss(animated: true, completion: nil)
        }
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true);
        }
    }
    
    @IBAction func datePickerChanged(_ sender: Any) {
        let picker: UIDatePicker = sender as! UIDatePicker
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd- HH:mm:ss"
        timeLeftLabel.text = formatter.string(from: picker.date)
        
    }
    
    // select color
    @IBAction func colorBtnClicked(_ sender: UIButton) {
        let button = sender as UIButton
        colorNum = button.tag
        colorNumLabel.text = "\(judgeColorStringByColorNumber(colorNumber: colorNum))"
    }
    
    
    var item: Item!
    var list: List!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        if let item = item {
            self.title = "Edit event"
            itemNameTextField.text = item.title
            itemDescriptionTextField.text = item.description
            colorNum = item.colorNum
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd- HH:mm:ss"
            timeLeftLabel.text = formatter.string(from: item.date! as Date)
        } else {
            item = Item.init()
            colorNum = 0
            timeLeftLabel.text = "Current"
        }
        
        colorNumLabel.text = "\(judgeColorStringByColorNumber(colorNumber: colorNum))"
    }

    // MARK: - Navigation

    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if saveButton === sender as? UIBarButtonItem {
            
            guard let name = itemNameTextField.text else { return true }
            
            if (name.isEmpty) {
                displayError()
                return false
                
            } else {
                return true
                
            }
            
        }
        
        return true
    }
    
    func displayError(){
        
        let alertController = UIAlertController(title: "Empty Event Name", message:
            "Please enter a event before saving", preferredStyle: UIAlertControllerStyle.alert)
        
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default,handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    // send back to previous view // using exit and unwindToView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if saveButton === sender as? UIBarButtonItem {
            
            let name = itemNameTextField.text ?? ""
            let description = itemDescriptionTextField.text ?? ""
            let date: NSDate? = datePicker.date as NSDate?
            
            item.title = name
            item.description = description
            item.date = date
            item.colorNum = colorNum
            
            
            // create notification
            let localNotification = UILocalNotification.init()
            localNotification.timeZone = NSTimeZone.system
            localNotification.fireDate = date! as Date
            localNotification.alertBody = name
            localNotification.soundName = UILocalNotificationDefaultSoundName
            localNotification.userInfo = [name : description]
            UIApplication.shared.scheduleLocalNotification(localNotification)
        }
    }
    
    func judgeColorStringByColorNumber(colorNumber selectcolor:Int) -> String {
        var colorStr:String = ""
        switch selectcolor {
        case 0:
            colorStr = "White"
        case 1:
            colorStr = "Yellow"
        case 2:
            colorStr = "Blue"
        case 3:
            colorStr = "Green"
        case 4:
            colorStr = "Purple"
        case 5:
            colorStr = "Red"
        case 6:
            colorStr = "Brown"
        default:
            colorStr = "White"
        }
        return colorStr
    }


}
