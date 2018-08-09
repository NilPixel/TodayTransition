//
//  TodayDetailViewController.swift
//  TodayTransitionDemo
//
//  Created by zheng on 2018/8/2.
//  Copyright © 2018年 zheng. All rights reserved.
//

import UIKit

class TodayDetailViewController: UIViewController {

    var selectIndexPath: IndexPath?
    var bgImage: UIImage?
    var imageName: String?
    var titles: String?
    var titleTwo: String?
    var content: String?
    
    private var cellHeight: CGFloat?
    private var startPointX: CGFloat?
    private var startPointY: CGFloat?
    private var scale: CGFloat?
    private var isHorizontal: Bool?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
