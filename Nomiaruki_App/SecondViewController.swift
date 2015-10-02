//
//  SecondViewController.swift
//  UIKit013
//
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Viewの背景色をGreenに設定する.
        self.view.backgroundColor = UIColor.whiteColor()
        
        // tabBarItemのアイコンをMoreに、タグを2と定義する.
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.More, tag: 2)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    var myCollectionView : UICollectionView!
    private let myItems1: NSArray = ["八海山","","柿の種"]
    private let myItems2: NSArray = ["越乃景虎","","ホタテ貝柱"]
    private let myItems3: NSArray = ["清泉","","モツ煮"]
    private let myImages1: NSArray = ["hakkaisan.jpg","","kakinotane.JPG"]
    private let myImages2: NSArray = ["kagetora.jpg","","hotate.jpg"]
    private let myImages3: NSArray = ["kiyoizumi.jpg","","motsuni.jpg"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Labelを作成.
        let myLabel: UILabel = UILabel(frame: CGRectMake(0,0,200,50))
        // Labelに文字を代入.
        myLabel.text = "おすすめの食べ合わせ"
        // 文字の色を白にする.
        myLabel.textColor = UIColor.blackColor()
        // Textを中央寄せにする.
        myLabel.textAlignment = NSTextAlignment.Center
        // 配置する座標を設定する.
        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 40)
        // ViewにLabelを追加.
        self.view.addSubview(myLabel)
        
        
        // CollectionViewのレイアウトを生成.
        let layout = UICollectionViewFlowLayout()
        
        // Cell一つ一つの大きさのデフォルト値
        layout.itemSize = CGSizeMake(10, 10)
        
        // Cellのマージン.
        layout.sectionInset = UIEdgeInsetsMake(16, 32, 32, 32)
        
        // セクション毎のヘッダーサイズ.
        layout.headerReferenceSize = CGSizeMake(0,0)
        
        // CollectionViewを生成.
        myCollectionView = UICollectionView(frame: CGRectMake(0, 50, self.view.frame.width, self.view.frame.height - 100) , collectionViewLayout: layout)
        
        // Cellに使われるクラスを登録.
        myCollectionView.registerClass(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Section")
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        myCollectionView.backgroundColor = UIColor.whiteColor()
        
        
        self.view.addSubview(myCollectionView)
        
    }
    
    /*
    Sectionの数
    */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    /*
    Cellの総数を返す
    */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 3
    }
    
    //セルのサイズを条件によって変更する
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        if indexPath.row % 2 != 0 {
            return CGSizeMake(40, 40)
        }else {
            return CGSizeMake(self.view.frame.size.width/3 , self.view.frame.size.width/3)
        }
    }
    
    /*
    Cellに値を設定する
    */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : CustomUICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell", forIndexPath: indexPath) as! CustomUICollectionViewCell
        
        // Section毎にCellのプロパティを変える.
        //switch(indexPath.section){
        //case 1:
            if indexPath.row % 2 != 0{
                cell.backgroundColor = UIColor.whiteColor()
                cell.textLabel?.text = "×"
                cell.textLabel?.textColor = UIColor.blackColor()
                cell.textLabel?.font = UIFont.boldSystemFontOfSize(60)
            }else{
                if indexPath.section == 0{
                    let backgroundImage: UIImage = UIImage(named:"\(myImages1[indexPath.row])")!
                    cell.backgroundView = UIImageView(image: backgroundImage)
                    cell.textLabel?.text = "\(myItems1[indexPath.row])"
                    cell.textLabel?.textColor = UIColor.whiteColor()
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(25)
                    cell.textLabel!.shadowColor = UIColor.grayColor()
                }else if indexPath.section == 1{
                    let backgroundImage: UIImage = UIImage(named:"\(myImages2[indexPath.row])")!
                    cell.backgroundView = UIImageView(image: backgroundImage)
                    cell.textLabel?.text = "\(myItems2[indexPath.row])"
                    cell.textLabel?.textColor = UIColor.whiteColor()
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(25)
                    cell.textLabel!.shadowColor = UIColor.grayColor()
                }else if indexPath.section == 2{
                    let backgroundImage: UIImage = UIImage(named:"\(myImages3[indexPath.row])")!
                    cell.backgroundView = UIImageView(image: backgroundImage)
                    cell.textLabel?.text = "\(myItems3[indexPath.row])"
                    cell.textLabel?.textColor = UIColor.whiteColor()
                    cell.textLabel?.font = UIFont.boldSystemFontOfSize(25)
                    cell.textLabel!.shadowColor = UIColor.grayColor()
                }
            }
            
        //default:
        //    print("section error")
        //    cell.backgroundColor = UIColor.whiteColor()
        //}
        
        return cell
    }
    
    /*
    Cellが選択された時の動作
    */
    /*
    Cellが選択された際に呼び出される
    */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let myPlaceViewController: UIViewController = PlaceViewController()
        // アニメーションを設定する.
        myPlaceViewController.modalTransitionStyle = UIModalTransitionStyle.FlipHorizontal
        // Viewの移動する.
        self.presentViewController(myPlaceViewController, animated: true, completion: nil)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}