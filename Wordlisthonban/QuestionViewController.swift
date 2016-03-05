//
//  QuestionViewController.swift
//  Wordlisthonban
//
//  Created by 花田奈々 on 2016/02/15.
//  Copyright © 2016年 com.litech. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var isAnswered:Bool = false //回答したか、次の回答にいくか
    var wordArray: [AnyObject] = [] //ユーザーデフォルトからとる配列
    var shuffleWordArray: [AnyObject] = []
    var nowNumber: Int = 0
    
    let saveData = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        wordArray = saveData.arrayForKey("WORD")!
        //問題をシャッフル
        shuffle()
        questionLabel.text = shuffleWordArray[nowNumber]["English"] as? String
    }
    
    func shuffle(){
        while wordArray.count > 0{
            let index = Int(rand()) % wordArray.count
            shuffleWordArray.append(wordArray[index])
            wordArray.removeAtIndex(index)
        }
    }
    
    @IBAction func nextButtonPushed(){
        
        //回答したか
        if isAnswered {
            //次の問題へ
            nowNumber++
            answerLabel.text = ""
            
            //次の問題を表示するか
            //シャッフル数よりも問題が少なかったら次の問題を出す
            if nowNumber < shuffleWordArray.count {
                questionLabel.text = shuffleWordArray[nowNumber]["English"] as? String
                //is Answeredをfalseにする
                isAnswered = false
                //ボタンのタイトルを変更する
                 nextButton.setTitle("答えを表示", forState: UIControlState.Normal)
                
            }else{
                //これ以上問題がないので次へ
                self.performSegueWithIdentifier("toFinishView", sender: nil)

            }
            
            
        }else{
            //答えを表示する（次の回答へ）
            answerLabel.text = shuffleWordArray[nowNumber]["Japanese"]as? String
            isAnswered = true
            nextButton.setTitle("次へ", forState: UIControlState.Normal)
            
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
