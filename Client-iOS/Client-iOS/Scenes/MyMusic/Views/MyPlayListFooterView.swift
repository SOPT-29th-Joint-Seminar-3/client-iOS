//
//  MyPlayListFooterView.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/26.
//

import UIKit

// 펼친 상태, 접힌 상태 enum
enum ToggleState {
    case fold
    case unfold
    
    var currentBtnImage: UIImage? {
        switch self {
        case .fold:    return UIImage(named: "btn_fold")
        case .unfold:  return UIImage(named: "btn_unfold")
        }
    }
}

class MyPlayListFooterView: UICollectionReusableView {
    @IBOutlet weak var toggleBtn: UIButton!
    
    // 상태에 따른 액션과 버튼 이미지 처리
    var toggleState: ToggleState = .unfold {
        didSet {
            action(toggleState)
            toggleBtn.setImage(toggleState.currentBtnImage, for: .normal)
        }
    }
    // 클로저로 버튼 액션 처리
    var action = { (state: ToggleState) in }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // 버튼 눌렸을 때, 상태만 토글
    @IBAction func toggleButtonDidTap(_ sender: Any) {
        self.toggleState = toggleState == .fold ? .unfold : .fold
    }
}
