//
//  ThirdViewController.swift
//  Nomiaruki_App
//
//  Created by alan-arakawa-yoshihiro on H27/09/15.
//  Copyright (c) 平成27年 alancodvo. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        // Viewの背景色をGreenに設定する.
        self.view.backgroundColor = UIColor.greenColor()

        // tabBarItemのアイコンをFavotitesに、タグを3と定義する.
        self.tabBarItem = UITabBarItem(tabBarSystemItem: UITabBarSystemItem.Favorites, tag: 3)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    required override init(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}