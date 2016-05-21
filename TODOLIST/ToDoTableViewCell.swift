//
//  ToDoTableViewCell.swift
//  TODOLIST
//
//  Created by HARADA REO on 2015/09/28.
//  Copyright © 2015年 reo harada. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var toDoLabel: UILabel!
    @IBOutlet weak var toDoImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
