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
    Cellが選択された際に呼び出される
    */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("Num: \(indexPath.row)")
        print("SectionNum:\(indexPath.section)")
        
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
                //背景画像の設定
                let backgroundImage: UIImage = UIImage(named:"kubota2.jpg")!
                cell.backgroundView = UIImageView(image: backgroundImage)
                cell.textLabel?.text = "久保田"
                cell.textLabel?.textColor = UIColor.whiteColor()
                cell.textLabel?.font = UIFont.boldSystemFontOfSize(25)
            }
            
        //default:
        //    print("section error")
        //    cell.backgroundColor = UIColor.whiteColor()
        //}
        
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}