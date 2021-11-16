//
//  Color.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/13.
//

import UIKit.UIColor

 // MARK: - 디자인 가이드의 색상 정의
 // 색상 초기화가 필요할 때 enum의 case를 추가하도록 합니다.
enum Color: String, CaseIterable {
    case primaryBlue = "primary_blue"
    case grey1 = "grey_1"
    case grey2 = "grey_2"
    case white1 = "white_1"
}

// MARK: - enum을 이용한 UIColor 편의 이니셜라이저 정의
// 아래와 같이 사용합니다.
// ex. UIColor(color: .primaryBlue)
extension UIColor {
    convenience init(color: Color) {
        self.init(named: color.rawValue)!
    }
}
