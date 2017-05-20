//
//  DateCalculatorViewController.swift
//  TaskDaysMatter
//
//  Created by Yuan REN on 2017/5/16.
//  Copyright © 2017年 Yuan REN. All rights reserved.
//

import UIKit

class DateCalculatorViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var beforTextField: UITextField!
    
    @IBOutlet weak var afterTextField: UITextField!

    @IBOutlet weak var beforeLabel: UILabel!
    
    @IBOutlet weak var afterLabel: UILabel!
    
    @IBOutlet weak var daysIntervalLabel: UILabel!
    
    
    // start time choose
    @IBAction func firstBtnClicked(_ sender: UIButton) {
        let alertController:UIAlertController=UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let datePicker = UIDatePicker( )
        datePicker.locale = NSLocale(localeIdentifier: "en") as Locale
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.date = NSDate() as Date
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
            (alertAction)->Void in
            self.firstLabel.text = self.getDateStringByDate(datePicker.date)
            self.firstDate = datePicker.date as NSDate
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel,handler:nil))
        alertController.view.addSubview(datePicker)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // end time choose
    @IBAction func secondBtnClicked(_ sender: UIButton) {
        let alertController:UIAlertController=UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        let datePicker = UIDatePicker( )
        datePicker.locale = NSLocale(localeIdentifier: "en") as Locale
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.date = NSDate() as Date
        alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default){
            (alertAction)->Void in
            self.secondLabel.text = self.getDateStringByDate(datePicker.date)
            self.secondDate = datePicker.date as NSDate
            let interval: TimeInterval = self.secondDate!.timeIntervalSince(self.firstDate! as Date)
            let second = Int(round(interval))
            let days = second / 24 / 3600
            self.daysIntervalLabel.text = "\(days) days"
        })
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel,handler:nil))
        alertController.view.addSubview(datePicker)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    // before number
    @IBAction func beforeValueChanged(_ sender: Any) {
        print("before")
        let str: String? = beforTextField.text
        if str != nil && str != "" {
            let days = Int(str!)
            var newDateComponents = DateComponents()
            newDateComponents.day = days
            let calendar = Calendar.current
            let calculatedDate = calendar.date(byAdding: newDateComponents, to: firstDate! as Date)
            beforeLabel.text = getDateStringByDate(calculatedDate!)
        }
        
        
    }
    
    // after number
    @IBAction func afterValueChanged(_ sender: Any) {
        print("after")
        let str: String? = afterTextField.text
        if str != nil && str != "" {
            let days = Int(str!)
            var newDateComponents = DateComponents()
            newDateComponents.day = -days!
            let calendar = Calendar.current
            let calculatedDate = calendar.date(byAdding: newDateComponents, to: firstDate! as Date)
            afterLabel.text = getDateStringByDate(calculatedDate!)
        }
    }
    
    
    
    
    var firstDate: NSDate?
    var secondDate: NSDate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstDate = NSDate()
        secondDate = NSDate()
        firstLabel.text = getDateStringByDate(firstDate! as Date)
        secondLabel.text = getDateStringByDate(secondDate! as Date)
        beforeLabel.text = getDateStringByDate(firstDate! as Date)
        afterLabel.text = getDateStringByDate(firstDate! as Date)
        daysIntervalLabel.text = "0 day"
    }
    
    
    func getDateStringByDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let str = formatter.string(from: date as Date)
        return str
    }
    
}
