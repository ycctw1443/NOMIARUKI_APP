//
//  FirstViewController.swift
//  UIKit013
//
//

import UIKit

class FirstViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Viewの背景色をWhiteに設定する.
        self.view.backgroundColor = UIColor.whiteColor()
        
        //tabBarItemのアイコンをSearchに、タグを1と定義する.
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Search, tag: 1)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    private var mySearchBar: UISearchBar!
    
    // Tableで使用する配列を設定する
    private let myItems: NSArray = ["TEST1", "TEST2", "TEST3"]
    private let myItems2: NSArray = ["TEST1", "TEST2", "TEST3"]
    private var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // ロゴLabelを作成.
        let myLogoLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        
        // 枠を丸くする.
        myLogoLabel.layer.masksToBounds = true
        
        // コーナーの半径.
        myLogoLabel.layer.cornerRadius = 20.0
        
        // ロゴLabelに文字を代入.
        myLogoLabel.text = "食べ合わせアプリ"
        
        // 文字の色を白にする.
        myLogoLabel.textColor = UIColor.whiteColor()
        
        // Textを中央寄せにする.
        myLogoLabel.textAlignment = NSTextAlignment.Center
        
        // 検索バーを作成する.
        mySearchBar = UISearchBar()
        mySearchBar.delegate = self
        mySearchBar.frame = CGRectMake(0, 0, 300, 80)
        mySearchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 100)
        
        // キャンセルボタンを有効にする.
        mySearchBar.showsCancelButton = true
        
        // ブックマークボタンを無効にする.
        mySearchBar.showsBookmarkButton = false
        
        // バースタイルをDefaultに設定する.
        mySearchBar.searchBarStyle = UISearchBarStyle.Minimal
        
        // 説明文を設定する.
        mySearchBar.placeholder = "ここに入力してください"
        
        // カーソル、キャンセルボタンの色を設定する.
        mySearchBar.tintColor = UIColor.redColor()
        
        // 検索結果表示ボタンは非表示にする.
        mySearchBar.showsSearchResultsButton = false
        
        // 検索バーをViewに追加する.
        self.view.addSubview(mySearchBar)
        
        // Status Barの高さを取得する.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        // 配置する座標を設定する.
        myLogoLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: barHeight + 30)
        
        // ロゴの背景色を設定する。
        myLogoLabel.backgroundColor = UIColor.blueColor()
        
        // ViewにロゴLabelを追加.
        self.view.addSubview(myLogoLabel)
        
        // TableViewの生成する(status barの高さ分ずらして表示).
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight + 100, width: displayWidth, height: displayHeight - barHeight))
        
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
    Cancelボタンが押された時に呼ばれる
    */
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        mySearchBar.text = ""
    }
    
    /*
    Searchボタンが押された時に呼ばれる
    */
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        mySearchBar.text = ""
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /*
    Cellが選択された際に呼び出されるデリゲートメソッド.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        println("Num: \(indexPath.row)")
        println("Value: \(myItems[indexPath.row])")
    }
    
    /*
    Cellの総数を返すデータソースメソッド.
    (実装必須)
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myItems.count
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
        cell.detailTextLabel?.text = "\(myItems2[indexPath.row])"
        //背景画像の設定
        cell.backgroundColor = UIColor(patternImage: UIImage(named: "kubota.jpg")!)
        
        return cell
    }
    
}