//
//  ViewController.swift
//  TODOLIST
//
//  Created by HARADA REO on 2015/09/28.
//  Copyright © 2015年 reo harada. All rights reserved.
//

import UIKit

// tableViewを使う準備その１
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var toDoTableView: UITableView!
    // データを用意
    var toDoData: [[String:String]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // tableViewを使う準備その２
        self.toDoTableView.delegate = self
        self.toDoTableView.dataSource = self
        
        // xibファイルを取得する
        let nib = UINib(nibName: "ToDoTableViewCell", bundle: nil)
        // 上のxibファイルをtableViewに登録する
        self.toDoTableView.registerNib(nib, forCellReuseIdentifier: "ToDoTableViewCell")
    }
    
    // 画面が表示される瞬間どうする？
    override func viewDidAppear(animated: Bool) {
        // NSUserDefaultsに保存されてるデータを取得する
        let defaults = NSUserDefaults.standardUserDefaults()
        guard let data = defaults.objectForKey("toDoData") else {
            // データがnilの場合は早期return
            return
        }
        
        // データがあれば、toDoDataに挿入
        self.toDoData = data as! [[String : String]]

        // データ更新がある場合は、tableViewを更新する
        self.toDoTableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // セクションの数どうする？
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    // セルの数どうする？
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.toDoData.count
    }

    // セルの中身どうする？
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // ToDoTableViewCellのセルを呼んでくる
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoTableViewCell", forIndexPath: indexPath) as! ToDoTableViewCell
        // 各プロパティを設定
        cell.toDoLabel.text = self.toDoData[indexPath.row]["content"]
        cell.dayLabel.text = self.toDoData[indexPath.row]["date"]
        cell.toDoImage.image = UIImage(named: self.toDoData[indexPath.row]["image"]!)
        
        return cell
    }
    
    // セルの高さどうする？
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 71
    }
    
    // セルを横スワイプで編集した時どうする？
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            // 削除を選択した場合
            // toDoDataから選択したものを削除
            self.toDoData.removeAtIndex(indexPath.row)
            
            // NSUserDefaultsを上書きする
            let defaults = NSUserDefaults.standardUserDefaults()
            defaults.setObject(self.toDoData, forKey: "toDoData")
            defaults.synchronize()
            
            // tableViewから選択したセルを削除
            self.toDoTableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
}

