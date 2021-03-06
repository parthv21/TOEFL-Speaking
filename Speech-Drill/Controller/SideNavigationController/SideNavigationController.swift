//
//  SideNavigationController.swift
//  Speech-Drill
//
//  Created by Parth Tamane on 24/01/21.
//  Copyright © 2021 Parth Tamane. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import GoogleSignIn

class SideNavigationController: UIViewController {
    
    let sideNavMenuItemReuseIdentifier = "SideNavMenuItemIdentifier"
    
    var interactor: Interactor? = nil
    var calledFromVCIndex: Int?
    let indexOfVCToShowOnLoad: Int = 0
    
    let sideNavContainer: UIView
    let sideNavTableView: UITableView
    let sideNavNoticesTableViewCell: SideNavNoticesTableViewCell
    let sideNavAdsTableViewCell: SideNavAdsTableViewCell
    let versionInfoView: VersionInfoView
    //var menuItems = [sideNavMenuItemStruct]()
    
    var menuItems = [SideNavItemName: SideNavMenuItemStruct]()
    var orderedMenuItemNames = [SideNavItemName]()
    
    let mainVC: MainVC
    let infoVC: InfoVC
    let DiscussionsVC: DiscussionsViewController
    
    var shouldAutoNavigateToChild = true
    var notificationUserInfo: [AnyHashable : Any]? = nil
    
    var unreadMessageCountUpdateQueryHandle: DatabaseHandle?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        logger.info("Initializing SideNavigationController")
        sideNavContainer = UIView()
        sideNavTableView = UITableView()
        sideNavNoticesTableViewCell = SideNavNoticesTableViewCell()
        sideNavAdsTableViewCell = SideNavAdsTableViewCell()
        versionInfoView = VersionInfoView()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        mainVC = storyboard.instantiateViewController(withIdentifier: "MainVC") as! MainVC
        infoVC = storyboard.instantiateViewController(withIdentifier: "InfoVC") as! InfoVC
        //Fully programatic VC - There is a reference to this in the VC too which I think will cause memory leaks
        DiscussionsVC = DiscussionsViewController()
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        logger.info("Loaded SideNavigationController view")
        
        super.viewDidLoad()
        
        sideNavTableView.delegate = self
        sideNavTableView.dataSource = self
        sideNavTableView.register(SideNavMenuItemCell.self, forCellReuseIdentifier: sideNavMenuItemReuseIdentifier)
        sideNavTableView.separatorStyle = .none
        
        sideNavNoticesTableViewCell.fetchNotices()
        sideNavAdsTableViewCell.fetchAds()
        
        configureSideNav()
        
        view.backgroundColor = MenuHelper.menuBGColor
        
//        updateUnreadMessagesCount()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        logger.info("SideNavigationControllers view will appear")
        
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        updateUnreadMessagesCount()
        
        if let userInfo = notificationUserInfo {
            calledFromVCIndex = 1
            viewDiscussions(with: userInfo, viewAnimated: true)
            notificationUserInfo = nil
        } else if shouldAutoNavigateToChild {
            if calledFromVCIndex == nil { calledFromVCIndex = indexOfVCToShowOnLoad }
            let menuItemToPresent = getSideNavMenuItem(at: calledFromVCIndex!)
            navigationController?.pushViewController(menuItemToPresent.presentedVC, animated: false)
            shouldAutoNavigateToChild = false
        } else {
            guard let calledFromVCIndex = calledFromVCIndex else { return }
            let indexPath = IndexPath(row: calledFromVCIndex, section: 1)
            sideNavTableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        logger.info("SideNavigationController's view will disapear")
        
        super.viewWillDisappear(animated)
        if navigationController?.topViewController?.isKind(of: type(of: DiscussionsVC)) ?? true {
            logger.debug("Calling stopUpdatingUnreadMessagesCount while presenting \(navigationController?.topViewController)")
            stopUpdatingUnreadMessagesCount()
        }
        
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func getSideNavMenuItem(at index: Int) -> SideNavMenuItemStruct {
        return menuItems[orderedMenuItemNames[index]]!
    }
}

////MARK:- Transition Animation
//extension SideNavigationController: UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
//    
//    func navigationController(
//            _ navigationController: UINavigationController,
//            animationControllerFor operation: UINavigationControllerOperation,
//            from fromVC: UIViewController,
//            to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//
//            print("From: ", fromVC, " To: ", toVC, " Operation: ", operation)
//
//            revealSideNav.pushStyle = operation == .push
//            return revealSideNav
//        }
//}


