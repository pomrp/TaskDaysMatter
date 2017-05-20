//
//  Item.swift
//  TaskDaysMatter
//
//  Created by Yuan REN on 2017/5/16.
//  Copyright © 2017年 Yuan REN. All rights reserved.
//

import UIKit

class Item {
    var title: String
    var description: String?
    var isCompleted: Bool = false
    var colorNum: Int = 0
    var date: NSDate?
    
    //introducing the Statusji™
    var statusji: String = ""
    
    init(title providedTitle: String, description providedDescription: String?) {
        title = providedTitle
        description = providedDescription
        statusji = randomStatusji()
        date = NSDate()
    }
    
    init() {
        title = ""
        date = NSDate.init()
        statusji = randomStatusji()
    }
    
    func randomStatusji() -> String {
        let statusEmojis = ["🤘🏼","👍🏼","🙌🏼","✌🏼","👌🏼","😎","💁🏽","🍾","🏅","🦄"]
        let randomIndex = Int(arc4random_uniform(UInt32(statusEmojis.count)))
        
        return statusEmojis[randomIndex]
    }
}
