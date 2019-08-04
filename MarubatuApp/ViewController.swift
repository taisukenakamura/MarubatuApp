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
    
    
    let questions: [[String : Any]] = [
        
        ["question" : "iPhoneアプリを開発する統合環境はZcodeである",
         "answer"   : false
        ],
        [ "question": "Xcode画面の右側にはユーティリティーズがある",
          "answer": true
        ],
        [ "question": "UILabelは文字列を表示する際に利用する",
          "answer": true
        ],
        [ "question": "ドラえもんは常に地面から浮いている",
          "answer": true
        ],
        
]
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    まるボタン
    @IBAction func tappedYesButton(_ sender: UIButton) {
    }
    
//    バツボタン
    @IBAction func tappedNoButton(_ sender: UIButton) {
    }
    
    func showQuestion(){
        let question = questions[currentQuestionNum]
        
        if let que  = question["question"] as? String{
            questionLabel.text = que
        }
    }
    
}

