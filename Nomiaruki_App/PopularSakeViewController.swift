//
//  PopularSakeViewController.swift
//  Nomiaruki_App
//
//  Created by alan-arakawa-yoshihiro on H27/09/16.
//  Copyright (c) 平成27年 alancodvo. All rights reserved.
//

import UIKit

class PopularSakeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色を設定.
        self.view.backgroundColor = UIColor.whiteColor()
        
        // ボタンを作成.
        let backButton: UIButton = UIButton(frame: CGRectMake(0,0,70,30))
        //backButton.backgroundColor = UIColor.blueColor();
        backButton.layer.masksToBounds = true
        backButton.setTitle("←Back", forState: .Normal)
        backButton.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        //backButton.layer.cornerRadius = 20.0
        backButton.layer.position = CGPoint(x: 40 , y:40)
        backButton.addTarget(self, action: "onClickMyButton:", forControlEvents: .TouchUpInside)
        self.view.addSubview(backButton);
        
        
        // Labelを作成.
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        // Labelに文字を代入.
        myLabel.text = "おすすめ食べ合わせ"
        // 文字の色を白にする.
        myLabel.textColor = UIColor.blackColor()
        // Textを中央寄せにする.
        myLabel.textAlignment = NSTextAlignment.Center
        // 配置する座標を設定する.
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 40)
        // ViewにLabelを追加.
        self.view.addSubview(myLabel)
    
        
        //
        //テーブルの生成
        //
        // Tableで使用する配列を設定する
        private let myItems: NSArray = ["さきイカ","貝柱", ""]
        private var myTableView: UITableView!
        
        
        
    }
    
    /*
    ボタンイベント.
    */
    internal func onClickMyButton(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}