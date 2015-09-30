//
//  FourthViewController.swift
//  Nomiaruki_App
//
//  Created by alan-arakawa-yoshihiro on H27/09/15.
//  Copyright (c) 平成27年 alancodvo. All rights reserved.
//


import UIKit

class FourthViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Viewの背景色をGreenに設定する.
        self.view.backgroundColor = UIColor.whiteColor()
        
        // tabBarItemのアイコンをContactsに、タグを4と定義する.
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Contacts, tag: 4)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    // Tableで使用する配列を設定する
    private let myItems: NSArray = ["基本情報","食べ合わせの投稿","食べ合わせのレビュー","設定"]
    private var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Labelを作成.
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        // Labelに文字を代入.
        myLabel.text = "マイページ"
        // 文字の色を白にする.
        myLabel.textColor = UIColor.blackColor()
        // Textを中央寄せにする.
        myLabel.textAlignment = NSTextAlignment.Center
        // 配置する座標を設定する.
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 40)
        // ViewにLabelを追加.
        self.view.addSubview(myLabel)
        
        
        /*
        テーブルの生成
        */
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
    Cellの総数を返すデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
    }
    
    /*
    Cellの1行のサイズを変更
    */
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCell")
        
        // Cellに値を設定する.
        cell.textLabel!.text = "\(myItems[indexPath.row])"
        cell.textLabel!.textColor = UIColor.blackColor()
        cell.textLabel!.font = UIFont.boldSystemFontOfSize(25)
        
        return cell
    }
    
    /*
    Cellが選択された時の動作
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        

        
    }
    
    
}