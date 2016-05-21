//
//  SettingImageViewController.swift
//  TODOLIST
//
//  Created by HARADA REO on 2015/09/28.
//  Copyright © 2015年 reo harada. All rights reserved.
//

import UIKit

class SettingImageViewController: UIViewController {
    
    var toDoContent: String!
    var date: String!
    @IBOutlet weak var imgSelectView: UIView!
    var toDoImage: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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

    @IBAction func tapWorkImage(sender: UIGestureRecognizer) {
        let img = sender.view as! UIImageView
        self.imgSelectView.center = img.center
        self.toDoImage = "work.jpg"
    }
    
    @IBAction func tapFamilyImage(sender: UIGestureRecognizer) {
        let img = sender.view as! UIImageView
        self.imgSelectView.center = img.center
        self.toDoImage = "family.jpeg"
    }
    
    @IBAction func tapLagerImage(sender: UIGestureRecognizer) {
        let img = sender.view as! UIImageView
        self.imgSelectView.center = img.center
        self.toDoImage = "lager.jpg"
    }
    
    @IBAction func tapDateImage(sender: UIGestureRecognizer) {
        let img = sender.view as! UIImageView
        self.imgSelectView.center = img.center
        self.toDoImage = "date.jpeg"
    }

    @IBAction func tapOKButton(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        var storeData = defaults.objectForKey("toDoData") as? Array<Dictionary<String,String>>
        if(storeData == nil){
            storeData = []
        }
        let saveData: Dictionary<String,String> = ["content": self.toDoContent!,"date": self.date!,"image": self.toDoImage!]
        storeData?.append(saveData)
        defaults.setObject(storeData, forKey: "toDoData")
        defaults.synchronize()
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}














