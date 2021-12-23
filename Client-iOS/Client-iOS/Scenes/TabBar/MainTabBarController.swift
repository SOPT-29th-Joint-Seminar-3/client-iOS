//
//  MainTabBarController.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/13.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        setTabBar()
    }
    
    private func style() {
        tabBar.tintColor = UIColor(color: .grey1)
        tabBar.barTintColor = UIColor(color: .white1)
    }
    
    private func setTabBar() {
        guard let myMusicVC = UIStoryboard(name: "MyMusicVC", bundle: nil)
                .instantiateViewController(withIdentifier: "MyMusicVC") as? MyMusicVC else { return }
        guard let forYouVC = UIStoryboard(name: "ForYouVC", bundle: nil)
                .instantiateViewController(withIdentifier: "ForYouVC") as? ForYouVC else { return }
                
        let viewControllers = [
            PreparingVC(),
            UINavigationController(rootViewController: forYouVC),
            PreparingVC(),
            UINavigationController(rootViewController: myMusicVC),
            PreparingVC(),
        ]
        
        MainTab.allCases.forEach {
            viewControllers[$0.rawValue].tabBarItem = $0.asTabBarItem()
        }
        
        setViewControllers(viewControllers, animated: true)
    }
}
