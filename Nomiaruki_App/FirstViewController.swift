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
        
        //tabBarItemのアイコンを「人気」に、タグを1と定義する.
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.MostViewed, tag: 1)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    private var mySearchBar: UISearchBar!
    
    // Tableで使用する配列を設定する
    private let myItems: NSArray = ["久保田","栃尾の油揚げ", "長岡技大第三食堂"]
    private let myItems2: NSArray = ["人気の日本酒","人気の料理", "人気の店"]
    private var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        テーブルの生成
        */
        // Status Barの高さを取得する.
        let barHeight: CGFloat = UIApplication.sharedApplication().statusBarFrame.size.height
        
        // Viewの高さと幅を取得する.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        
        
        // TableViewの生成する(status barの高さ分ずらして表示).
        myTableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight - 50))
        
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        
        // DataSourceの設定をする.
        myTableView.dataSource = self
        
        // Delegateを設定する.
        myTableView.delegate = self
        
        // Viewに追加する.
        self.view.addSubview(myTableView)
        
        
        /*
        検索バーの生成
        */
        // 検索バーを作成する.
        mySearchBar = UISearchBar()
        mySearchBar.delegate = self
        mySearchBar.frame = CGRectMake(0, 0, 300, 40)
        mySearchBar.layer.position = CGPoint(x: self.view.bounds.width/2, y: 50)
        mySearchBar.backgroundColor = UIColor.whiteColor()
        mySearchBar.layer.masksToBounds = true
        
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
        return 210
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
        cell.textLabel!.textColor = UIColor.whiteColor()
        cell.textLabel!.font = UIFont.boldSystemFontOfSize(25)
        
        cell.detailTextLabel!.text = "\(myItems2[indexPath.row])"
        cell.detailTextLabel!.textColor = UIColor.whiteColor()
        cell.detailTextLabel!.font = UIFont.boldSystemFontOfSize(14)
        
        //背景画像の設定
        let backgroundImage: UIImage = UIImage(named:"tochio.jpeg")!
        cell.backgroundView = UIImageView(image: backgroundImage)
        
        //セル選択時にセルが灰色になるのを防ぐ
        cell.selectedBackgroundView = UIImageView(image: backgroundImage)
        
        return cell
    }
    
    /*
    Cellが選択された時の動作
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let num = indexPath.row
        
        switch num{
        
        case 0:
            //一番上の項目を選択した場合の画面遷移
            // 遷移するViewを定義する.
            let myPopularViewController: UIViewController = PopularSakeViewController()
            // アニメーションを設定する.
            myPopularViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            // Viewの移動する.
            self.presentViewController(myPopularViewController, animated: true, completion: nil)
            
        case 1:
            //二番目を選択した場合の画面遷移
            // 遷移するViewを定義する.
            let myPopularViewController: UIViewController = PopularFoodViewController()
            // アニメーションを設定する.
            myPopularViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            // Viewの移動する.
            self.presentViewController(myPopularViewController, animated: true, completion: nil)
            
        case 2:
            //三番目を選択した場合の画面遷移
            // 遷移するViewを定義する.
            let myPopularViewController: UIViewController = PopularPlaceViewController()
            // アニメーションを設定する.
            myPopularViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
            // Viewの移動する.
            self.presentViewController(myPopularViewController, animated: true, completion: nil)
            
        default:
            break
        }

    }
    
}