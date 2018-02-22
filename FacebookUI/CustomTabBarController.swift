//
//  CustomTabBarController.swift
//  FacebookUI
//
//  Created by sinbad on 6/6/1439 AH.
//  Copyright © 1439 AH sinbad. All rights reserved.
//

import UIKit
class CustomTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let feedController = FeedController(collectionViewLayout: UICollectionViewFlowLayout())
        let navigationControler  = UINavigationController(rootViewController: feedController)
        
        navigationControler.title = "News Feed"
        navigationControler.tabBarItem.image = UIImage(named:  "news_feed_icon")
        
        let friendRequestController = FriedReqestController()
        let secondNavigationController = UINavigationController(rootViewController: friendRequestController)
        secondNavigationController.title = "Request"
        secondNavigationController.tabBarItem.image = UIImage(named: "requests_icon")
        
        let messageController = MessageViewController()
        let messageCv = UINavigationController(rootViewController: messageController)
        messageCv.title = "Message"
        messageCv.tabBarItem.image = UIImage(named: "messenger_icon")
        
        
        let notificationController = NotificationViewController()
        let notificationVC  = UINavigationController(rootViewController: notificationController)
        notificationVC.title = "Message"
        notificationVC.tabBarItem.image = UIImage(named: "notification")
        
        let sideBar = LeftNavigationViewController()
        let sideBarCV  = UINavigationController(rootViewController: sideBar)
        sideBarCV.tabBarItem.image = UIImage(named: "menu")
        
        
        viewControllers = [navigationControler, secondNavigationController,messageCv,notificationVC,sideBarCV]
    }
}
