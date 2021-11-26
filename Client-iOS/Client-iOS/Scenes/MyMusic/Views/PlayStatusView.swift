//
//  PlayStatusView.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/24.
//

import UIKit

class PlayStatusView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadView()
    }
    
    private func loadView() {
        let bundle = Bundle(for: PlayStatusView.self)
        let nib = UINib(nibName: "PlayStatusView", bundle: bundle)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            return
        }
        view.frame = bounds
        addSubview(view)
    }
}
