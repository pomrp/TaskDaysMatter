//
//  FeedbackViewController.swift
//  TaskDaysMatter
//
//  Created by Yuan REN on 2017/5/16.
//  Copyright © 2017年 Yuan REN. All rights reserved.
//

import UIKit

class FeedbackViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func submitBtnClicked(_ sender: UIButton) {
        let str :String? = textView.text
        if str != nil {
            let alertController = UIAlertController(title: "Success", message:
                "Thank you for your feedback", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default,handler: nil))
            
            self.present(alertController, animated: true, completion: nil)

        }
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Feedback"
    }

}
