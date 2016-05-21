//
//  AddToDoListViewController.swift
//  TODOLIST
//
//  Created by HARADA REO on 2015/09/28.
//  Copyright © 2015年 reo harada. All rights reserved.
//

import UIKit

class AddToDoListViewController: UIViewController {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var toDoContent: UITextView!
    @IBOutlet weak var toDoDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.toDoContent.becomeFirstResponder()
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.stringFromDate(self.toDoDatePicker.date)
        self.dayLabel.text = date
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func changeDate(sender: AnyObject) {
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let date = formatter.stringFromDate(self.toDoDatePicker.date)
        self.dayLabel.text = date
    }

    @IBAction func tapSettingDayView(sender: AnyObject) {
        self.toDoContent.endEditing(true)
    }
    
    @IBAction func tapNextViewButton(sender: AnyObject) {
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("SettingImageViewController") as! SettingImageViewController
        vc.toDoContent = self.toDoContent.text
        vc.date = self.dayLabel.text
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
