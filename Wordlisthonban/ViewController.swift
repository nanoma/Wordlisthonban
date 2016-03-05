//
//  ViewController.swift
//  Wordlisthonban
//
//  Created by 花田奈々 on 2016/02/14.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back(segue: UIStoryboardSegue){
        
    }
    
    @IBAction func startButtonTapped(){
        //既存データに接続？
        let saveData = NSUserDefaults.standardUserDefaults()
        //配列があるかチェック？
        if let wordArray = saveData.arrayForKey("WORD"){
            if wordArray.count > 0 {
                self.performSegueWithIdentifier("toQuestionView", sender: nil)
                return
            }
        }
        //単語が登録されていなかったら
        let alert: UIAlertController = UIAlertController(
            title: "単語", message: "単語を登録してください", preferredStyle: .Alert)
        
        alert.addAction(UIAlertAction(
            title: "OK", style: .Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }


}

