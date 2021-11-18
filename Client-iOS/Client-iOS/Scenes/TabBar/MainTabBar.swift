//
//  MainTabBar.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/13.
//

import UIKit

enum MainTab: Int, CaseIterable {
    case home
    case forYou
    case search
    case myMusic
    case menu
}

extension MainTab {
    private var description: String {
        switch self {
        case .home:     return "홈"
        case .forYou:   return "For You"
        case .search:   return "검색"
        case .myMusic:  return "내음악"
        case .menu:     return "전체메뉴"
        }
    }
}

// 디자인 상 selected, unselected가 구분되어 있지 않으므로
// activeIcon, icon 두 가지 모두 동일한 아이콘 이미지를 사용합니다.
extension MainTab {
    private var activeIcon: UIImage? {
        switch self {
        case .home:     return Image.nvHome
        case .forYou:   return Image.nvForyou
        case .search:   return Image.nvSearch
        case .myMusic:  return Image.nvMymusic
        case .menu:     return Image.nvMenu
        }
    }
    
    private var icon: UIImage? {
        switch self {
        case .home:     return Image.nvHome
        case .forYou:   return Image.nvForyou
        case .search:   return Image.nvSearch
        case .myMusic:  return Image.nvMymusic
        case .menu:     return Image.nvMenu
        }
    }
}

extension MainTab {
    public func asTabBarItem() -> UITabBarItem {
        return UITabBarItem(
            title: description,
            image: icon,
            selectedImage: activeIcon
        )
    }
}
