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
        navigationController?.isNavigationBarHidden = true
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
        item1.titleTwo = "体验“中国芯”动力新哈弗H6 Coupe"
        item1.content = "前卫设计动感十足 体验“中国芯”动力新哈弗H6 Coupe\n新哈弗H6 Coupe是长城公司采用全新设计语言开发的一款具有酷颜值，酷动力，酷装备的SUV。此次新哈弗H6 Coupe由内而外的全面升级，必将引来大众的追捧，开创哈弗SUV新篇章...\n1.5GDIT发动机应用CVVL、缸内直喷等前沿技术，动力响应快、燃油经济性好，最大功率124kW，1400转爆发最大扭矩285N·m，百公里加速9.7s，百公里油耗仅6.8L，荣获“中国心”2017十佳发动机；\n7DCT湿式双离合变速器采用最先进的摩擦材料，速比范围高达8.0，换挡平顺、可靠性高，提升燃油经济性,荣获2018届世界十佳变速器。\n整车采用超刚性一体式安全结构车身；\n配备奥托立夫6安全气囊、帘式气囊贯穿前后，保护面积更宽泛；\n盲点侦测，保证行车安全；\n配备360环视影像系统、LED组合前灯，驾乘更安全。\n外观采用钻石形体光学设计，车身线条硬朗连贯，更动感；\n内饰采用大面贯穿式整体设计，断面式仪表板极具立体感，打造科技及尊享兼备的体验。"
        
        let item2 = TodayListItemModel()
        item2.title = "黑天鹅蛋糕"
        item2.image = "Home_demo_02"
        item2.titleTwo = "我的一生，为美而感动，为美而存在"
        item2.content = "一兆韦德健身管理有限公司目前有员工3000多人，拥有超过一百家健身会所。公司大力倡导绿色环保和时尚健身运动。凭借先进的管理理念、丰富的行业经验、完善的管理体系和管理团队，业已成为业内发展速度快、分店数量多、会员数量众多的健身连锁机构。公司多次通过权威机构认证，目前由国际著名投资公司——新加坡淡马锡集团注资，2015年更是获得了上海市著名商标，是健身行业内首个获得该荣誉的企业。公司希望通过全体员工的努力为社会提供有价值的健康生活服务，成为具世界竞争力的连锁健身企业之一。公司将打造更多的绿色生态会馆、为美好的城市生活贡献更多力量。"
        
        let item3 = TodayListItemModel()
        item3.title = "高端健身会所入驻园区"
        item3.image = "Home_demo_03"
        item3.titleTwo = "让运动助力工作生活"
        item3.content = "黑天鹅 \n隶属于北京黑天鹅餐饮管理有限公司，公司主要打造国内品质卓越，美味安心的蛋糕。黑天鹅蛋糕源于黄金比例的配方，精选世界各地优质食材，让您和朋友轻松享受精品蛋糕。\n用新锐的艺术理念和国际化的视野，带领团队重塑品牌，开启了黑天鹅与全球顶尖的甜品大师、设计大师和顶级原料商全面合作的阶段，让黑天鹅的产品和形象获得蜕变和飞跃，迅速跻身于国际一流烘焙品牌的行列。\n黑天鹅蛋糕推出以来，一直以一种“昂贵、奢华、精美”的形象示人，北京的首家实体店铺，自然要延续这个风格。先站在门口拍一张，这种风格的铺面，在蛋糕店里绝对令人耳目一新。"
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.transform = CGAffineTransform.init(scaleX: 0.95, y: 0.95)
        let detailVC = TodayDetailViewController()
        detailVC.selectIndexPath = indexPath
        detailVC.bgImage = imageForView()
        
        detailVC.titles = dataArray[indexPath.row].title
        detailVC.titleTwo = dataArray[indexPath.row].titleTwo
        detailVC.content = dataArray[indexPath.row].content
        detailVC.imageName = dataArray[indexPath.row].image
        
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    // MARK: - 截屏
    func imageForView() -> UIImage {
        UIGraphicsBeginImageContext(view.frame.size)
        let context = UIGraphicsGetCurrentContext()
        view.layer.render(in: context!)
        let theImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return theImage!
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
