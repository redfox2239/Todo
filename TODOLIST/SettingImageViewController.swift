//
//  SettingImageViewController.swift
//  TODOLIST
//
//  Created by HARADA REO on 2015/09/28.
//  Copyright © 2015年 reo harada. All rights reserved.
//

import UIKit

class SettingImageViewController: UIViewController {
    
    // NSUserDefaultsに保存するためのテキストコンテンツ
    var toDoContent: String!
    // NSUserDefaultsに保存するための日時
    var date: String!
    @IBOutlet weak var imgSelectView: UIView!
    // NSUserDefaultsに保存するための画像ファイル名
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
        // タップした画像を取得
        let img = sender.view as! UIImageView
        // 選択済みViewを移動する
        self.imgSelectView.center = img.center
        // 選択した画像ファイルを特定しておく
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
        // NSUserDefaultsを用意
        let defaults = NSUserDefaults.standardUserDefaults()
        guard let toDoData = defaults.objectForKey("toDoData") else {
            // storeDataがnilの場合、空配列を初期値としてセットする
            defaults.setObject([], forKey: "toDoData")
            defaults.synchronize()
            return
        }
        
        var storeData = toDoData as! [[String:String]]

        // 保存するデータを用意
        let saveData: [String:String] = [
            "content": self.toDoContent!,
            "date": self.date!,
            "image": self.toDoImage!
        ]
        
        // データを追加
        storeData.append(saveData)
        
        // NSUserDefaultsに保存する
        defaults.setObject(storeData, forKey: "toDoData")
        defaults.synchronize()

        // 今の画面を閉じる
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}














