//
//  PlaceViewController.swift
//  Nomiaruki_App
//
//  Created by 和田絢也 on 2015/10/01.
//  Copyright © 2015年 alancodvo. All rights reserved.
//


import UIKit

class PlaceViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    // Tableで使用する配列を設定する
    private let myItems: NSArray = ["","長岡技大第九食堂","","長岡技大第十食堂","","長岡技大第十一食堂"]
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
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        // Labelに文字を代入.
        myLabel.text = "頂けるお店"
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
        // Status Barの高さを取得する.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        
        // TableViewの生成する(status barの高さ分ずらして表示).
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight+50, width: displayWidth, height: displayHeight - barHeight - 50))
        
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        
        // Delegateを設定する.
        myTableView.delegate = self
        
        // Viewに追加する.
        self.view.addSubview(myTableView)
        
        
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
        let num = indexPath.row
        if num%2 == 0{
            return 210
        }
        return 45
    }
    
    /*
    Cellに値を設定するデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // 再利用するCellを取得する.
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyCell")
        
        let num2 = indexPath.row
        
        if num2%2 == 0{
            //背景画像の設定
            let backgroundImage: UIImage = UIImage(named:"tochio.jpeg")!
            cell.backgroundView = UIImageView(image: backgroundImage)
        }else{
            // Cellに値を設定する.
            cell.textLabel!.text = "\(myItems[indexPath.row])"
            cell.textLabel!.font = UIFont.boldSystemFontOfSize(18)
            
        }
        
        //セル選択時になにも起きないようにする
        cell.selectionStyle = .None
        
        return cell
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
