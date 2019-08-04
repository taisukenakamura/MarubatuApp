//
//  ViewController.swift
//  MarubatuApp
//
//  Created by 中村泰輔 on 2019/08/03.
//  Copyright © 2019 icannot.t.n. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
//    クイズの問題を表示
    @IBOutlet weak var questionLabel: UILabel!
    
    //    現在のクイズ番号を管理
    var currentQuestionNum : Int = 0
    var collectAnswerCount : Int = 0
    var alreadyHinted : Bool = false
    
    
    let questions: [[String : Any]] = [
        
        ["question" : "iPhoneアプリを開発する統合環境はZcodeである",
         "answer"   : false,
         "hint"     : "バツ"
        ],
        [ "question": "Xcode画面の右側にはユーティリティーズがある",
          "answer"  : true,
          "hint"    : "マル"
        ],
        [ "question": "UILabelは文字列を表示する際に利用する",
          "answer"  : true,
          "hint"  : "マル"
        ],
        [ "question": "ドラえもんは常に地面から浮いている",
          "answer"  : true,
          "Hint"  : "マル"
        ],
        
]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        showQuestion()
    }
    
    func showQuestion(){
        //        どの問題か取得する
        let question = questions[currentQuestionNum]
        
        if let que  = question["question"] as? String{
            questionLabel.text = que
        }
    }
//    回答チェック、正解ならば次の問題へ
    func checkAnswer(yourAnswer : Bool) {
        
        let question = questions[currentQuestionNum]
        
        
        
        
        //        問題の答えを取り出す
        if let ans = question["answer"] as? Bool{
            
            if currentQuestionNum < questions.count - 1{
                
            if yourAnswer == ans{
                // 正解なので次の問題に進む
                currentQuestionNum += 1
                collectAnswerCount += 1
                showAlert(message: "正解")
            }else{
                //  不正解
                currentQuestionNum += 1
                showAlert(message : "不正解")
                }
            }else{
                showAlert(message: "\(questions.count)問中\(collectAnswerCount)問正解しました！")
                collectAnswerCount = 0
                currentQuestionNum = 0
                alreadyHinted = false
        }
          
}else{
            print("答えが入っていません")
            return
        }
        //        currentQuestionNumが問題数以上になると最初に戻る
        if currentQuestionNum >= questions.count{
            
            currentQuestionNum = 0
//            showAlert(message: "４問中\(collectAnswerNum)問正解")
        }
        
        
        //       問題を表示し、正解であれば次の問題、不正解ならば同じ問題が最表示
        showQuestion()
        
    }
//    アラートを表示する関数
    func showAlert (message : String){
       
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let close = UIAlertAction(title: "閉じる", style: .cancel, handler: nil)
        
        alert.addAction(close)
        
        present(alert, animated: true, completion:nil)
    }
    
    
    
    @IBAction func tappedHintButton(_ sender: UIButton) {
        let question = questions[currentQuestionNum]
        
        if alreadyHinted{
            showAlert(message: "もうすでに一回押されています")
        }else {
            if let hint = question["hint"] as? String{
                showAlert(message: hint)
                alreadyHinted = true
            }else{
                print("ヒントが登録されていません")
            }
        }
    }
    
    
//    まるボタン
    @IBAction func tappedYesButton(_ sender: UIButton) {
        
        checkAnswer(yourAnswer : true)
       
    }
    
//    バツボタン
    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
        
    }
    
    
    
    
    
   
}

