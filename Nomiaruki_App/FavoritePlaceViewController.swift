//
//  FavoritePlaceViewController.swift
//  Nomiaruki_App
//
//  Created by 和田絢也 on 2015/10/01.
//  Copyright © 2015年 alancodvo. All rights reserved.
//


import UIKit


class FavoritePlaceViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private var myTableView: UITableView!
    
    
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
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,250,50))
        // Labelに文字を代入.
        myLabel.text = "お気に入りの店"
        // 文字の色を白にする.
        myLabel.textColor = UIColor.blackColor()
        // Textを中央寄せにする.
        myLabel.textAlignment = NSTextAlignment.Center
        // 配置する座標を設定する.
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 40)
        // ViewにLabelを追加.
        self.view.addSubview(myLabel)
        
        
        // Status Barの高さを取得する.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // TableViewの生成する(status barの高さ分ずらして表示).
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight + 50, width: displayWidth, height: displayHeight - barHeight - 50))
        
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        
        // Delegateを設定する.
        myTableView.delegate = self
        
        // Viewに追加する.
        self.view.addSubview(myTableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    Cellが選択された際に呼び出されるデリゲートメソッド.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(favoritePlaceItems[indexPath.row])")
    }
    
    /*
    Cellの総数を返すデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoritePlaceItems.count
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
        
        // Cellに値を設定する.
        cell.textLabel!.text = "\(favoritePlaceItems[indexPath.row])"
        
        return cell
    }
    
    /*
    ボタンイベント.
    */
    internal func onClickMyButton(sender: UIButton){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}