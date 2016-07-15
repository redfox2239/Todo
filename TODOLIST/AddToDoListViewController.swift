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
    // 日付をフォーマットする人を用意する
    let formatter = NSDateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // textViewにフォーカスする
        self.toDoContent.becomeFirstResponder()
        
        self.formatter.dateFormat = "yyyy/MM/dd"
        // DatePickerの値をフォーマットする
        let date = self.formatter.stringFromDate(self.toDoDatePicker.date)
        // ラベルに設定
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
    
    
    // DatePickerの値変えたらどうする？
    @IBAction func changeDate(sender: AnyObject) {
        self.formatter.dateFormat = "yyyy/MM/dd"
        // DatePickerの値をフォーマットする
        let date = self.formatter.stringFromDate(self.toDoDatePicker.date)
        // ラベルに設定
        self.dayLabel.text = date
    }

    @IBAction func tapSettingDayView(sender: AnyObject) {
        // キーボード閉じる
        self.toDoContent.resignFirstResponder()
    }
    
    @IBAction func tapNextViewButton(sender: AnyObject) {
        // SettingImageViewControllerの画面を呼んでくる
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("SettingImageViewController") as! SettingImageViewController
        // SettingImageViewControllerにデータを渡す
        vc.toDoContent = self.toDoContent.text
        vc.date = self.dayLabel.text
        // ナビゲーションコントローラーに移動を頼む
        self.navigationController?.showViewController(vc, sender: nil)
    }
}
