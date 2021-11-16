//
//  Typography.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/13.
//

import UIKit.UIFont

// MARK: - NotoSansKR 폰트 타입 열거형 정의
fileprivate enum NotoSansKRType: String, CaseIterable {
    case bold = "NotoSansKR-Bold"
    case medium = "NotoSansKR-Medium"
    case regular = "NotoSansKR-Regular"
    
    var name: String {
        return self.rawValue
    }
}

// MARK: - Genie의 5가지 타이포 스타일 열거형 정의
public enum GenieTypoStyle: CaseIterable {
    case headline
    case title
    case body
    case caption
    case smallCaption
}

// MARK: - 타이포 스타일에 따라 Genie에서 사용되는 font 정의
// 아래와 같이 사용합니다.
// ex. fontLabel.font = GenieTypoStyle.body.font
extension GenieTypoStyle {
    public var font: UIFont {
        switch self {
        case .headline:     return UIFont(name: NotoSansKRType.bold.name, size: 18)!
        case .title:        return UIFont(name: NotoSansKRType.medium.name, size: 14)!
        case .body:         return UIFont(name: NotoSansKRType.bold.name, size: 14)!
        case .caption:      return UIFont(name: NotoSansKRType.bold.name, size: 12)!
        case .smallCaption: return UIFont(name: NotoSansKRType.bold.name, size: 9)!
        }
    }
}
