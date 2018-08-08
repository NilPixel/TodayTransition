//
//  TodayListViewController.swift
//  TodayTransitionDemo
//
//  Created by zheng on 2018/7/31.
//  Copyright © 2018年 zheng. All rights reserved.
//

import UIKit

class TodayListViewController: UIViewController {
    
    let SCREEN_WIDTH = UIScreen.main.bounds.width
    let SCREEN_HEIGHT = UIScreen.main.bounds.height
    let identifier = "TodayListCell"
    
    var dataArray: Array<TodayListItemModel> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Today"
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        view.backgroundColor = UIColor.white
        registerCell()
        initDataSource()
        view.addSubview(listTableView)
    }
    
    lazy var listTableView: UITableView = {
        let listTV = UITableView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        listTV.delegate = self
        listTV.dataSource = self
        listTV.separatorStyle = .none
        listTV.tableHeaderView = UIView.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: 25))
        return listTV
    }()
    
    func registerCell() {
        let nib = UINib.init(nibName: identifier, bundle: nil)
        listTableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    func initDataSource() {
        let item1 = TodayListItemModel()
        item1.title = "哈弗H6Coupe震撼上市"
        item1.image = "Home_demo_01"
        item1.content = "体验“中国芯”动力新哈弗H6 Coupe"
        
        let item2 = TodayListItemModel()
        item2.title = "黑天鹅蛋糕"
        item2.image = "Home_demo_02"
        item2.content = "我的一生，为美而感动，为美而存在"
        
        let item3 = TodayListItemModel()
        item3.title = "高端健身会所入驻园区"
        item3.image = "Home_demo_03"
        item3.content = "让运动助力工作生活"
        
        dataArray.append(item1)
        dataArray.append(item2)
        dataArray.append(item3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension TodayListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (SCREEN_WIDTH - 40) * 1.3 + 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! TodayListCell
        let model = dataArray[indexPath.row]
        cell.bgImageView.image = UIImage.init(named: model.image)
        cell.titleLabel.text = model.title
        cell.contentLabel.text = model.content
        
        cell.shouldGroupAccessibilityChildren = true
        cell.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let cell = tableView.cellForRow(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        }
        return true
    }
    
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        UIView.animate(withDuration: 0.2) {
            cell?.transform = CGAffineTransform.init(scaleX: 1, y: 1)
        }
    }
}


extension TodayListViewController: UINavigationControllerDelegate, UIViewControllerAnimatedTransitioning {
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let cell = listTableView.cellForRow(at: listTableView.indexPathForSelectedRow!) as! TodayListCell
        let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let toView = toVC?.value(forKeyPath: "headerImageView") as! UIView
        let fromView = cell.bgView
        let containerView = transitionContext.containerView
        let snapShotView = UIImageView.init(image: cell.bgImageView.image)
        
        snapShotView.frame = containerView.convert((fromView?.frame)!, from: fromView?.superview)
        fromView?.isHidden = true
        
        toVC?.view.frame = transitionContext.finalFrame(for: toVC!)
        toVC?.view.alpha = 0
        toView.isHidden = true
        
        let titleLabel = UILabel.init(frame: CGRect(x: 15, y: 20, width: SCREEN_WIDTH - 30, height: 30))
        titleLabel.textColor = UIColor.white
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.boldSystemFont(ofSize: 25)
        titleLabel.text = cell.titleLabel.text
        
        let contentLabel = UILabel.init(frame: CGRect(x: 15, y: (SCREEN_WIDTH - 40) * 1.3 - 30, width: SCREEN_WIDTH - 44, height: 15))
        contentLabel.textColor = UIColor.white
        contentLabel.textAlignment = .left
        contentLabel.font = UIFont.boldSystemFont(ofSize: 25)
        contentLabel.text = cell.contentLabel.text
        contentLabel.alpha = 0.5
        
        snapShotView.addSubview(titleLabel)
        snapShotView.addSubview(contentLabel)
        containerView.addSubview((toVC?.view)!)
        containerView.addSubview(snapShotView)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1.0, options: .curveLinear, animations: {
            containerView.layoutIfNeeded()
            toVC?.view.alpha = 1.0
            
            snapShotView.frame = containerView.convert(toView.frame, to: toView.superview)
            titleLabel.frame = CGRect(x: 22, y: 30, width: self.SCREEN_WIDTH - 30, height: 30)
            contentLabel.frame = CGRect(x: 22, y: self.SCREEN_WIDTH*1.3-30, width: self.SCREEN_WIDTH*1.3-44, height: 15)
        }) { (finished) in
            toView.isHidden = false
            fromView?.isHidden = false
            snapShotView.removeFromSuperview()
            self.listTableView.reloadData()
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
}
