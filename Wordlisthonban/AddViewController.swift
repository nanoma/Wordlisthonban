//
//  AddViewController.swift
//  Wordlisthonban
//
//  Created by 花田奈々 on 2016/02/15.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var englishTextField: UITextField!
    @IBOutlet var japaneseTextField: UITextField!
    
    var wordArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //NSのWORDの中にデータが入っていたら読み込み
        if saveData.arrayForKey("WORD") != nil{
            wordArray = saveData.arrayForKey("WORD")!
        }
    }
    
    @IBAction func saveWord() {
        let wordDictionary = ["english":englishTextField.text!,"japanese":japaneseTextField.text!] //nilを避ける
        
        //入力されていなかった場合、入力失敗の文字
        if englishTextField.text == "" || japaneseTextField.text == "" {
            
            let alert = UIAlertController(title: "保存が失敗しました", message: "もう一度入力してください", preferredStyle:  UIAlertControllerStyle.Alert)
            
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            
            //入力画面に戻る
            self.presentViewController(alert, animated: true, completion: nil)
            
        } else {
        
        wordArray.append(wordDictionary)
        
        //配列の表示
        saveData.setObject(wordArray, forKey: "WORD")
        
        //保存完了のアラート
        let alert = UIAlertController(title: "保存完了", message: "単語の登録が完了しました",
            preferredStyle: UIAlertControllerStyle.Alert)
        
        //アラートの下部ボタン部分
        alert.addAction(
            UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        //TextFiled内に記載
        englishTextField.text = ""
        japaneseTextField.text = ""
        
        }
        
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

}
