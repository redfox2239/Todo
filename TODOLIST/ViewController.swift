r//
//  ViewController.swift
//  TODOLIST
//
//  Created by HARADA REO on 2015/09/28.
//  Copyright © 2015年 reo harada. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var toDoTableView: UITableView!
    var toDoData: Array<Dictionary<String,String>>? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let defaults = NSUserDefaults.standardUserDefaults()
        self.toDoData = defaults.objectForKey("toDoData") as? Array<Dictionary<String,String>>
        if(self.toDoData == nil){
            self.toDoData = []
        }
        
        self.toDoTableView.delegate = self
        self.toDoTableView.dataSource = self
        
        let nib = UINib(nibName: "ToDoTableViewCell", bundle: nil)
        self.toDoTableView.registerNib(nib, forCellReuseIdentifier: "ToDoTableViewCell")
    }
    
    override func viewDidAppear(animated: Bool) {
        let defaults = NSUserDefaults.standardUserDefaults()
        self.toDoData = defaults.objectForKey("toDoData") as? Array<Dictionary<String,String>>
        if(self.toDoData == nil){
            self.toDoData = []
        }
        self.toDoTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoData!.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoTableViewCell", forIndexPath: indexPath) as! ToDoTableViewCell
        cell.toDoLabel.text = self.toDoData![indexPath.row]["content"]
        cell.dayLabel.text = self.toDoData![indexPath.row]["date"]
        cell.toDoImage.image = UIImage(named: self.toDoData![indexPath.row]["image"]!)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 71
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            self.toDoData?.removeAtIndex(indexPath.row)
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(self.toDoData, forKey: "toDoData")
            self.toDoTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
            defaults.synchronize()
        }
    }
}

