//
//  UIView+.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/12/03.
//

import UIKit

extension UIView {
    static func loadFromXib(withOwner: Any? = nil, options: [UINib.OptionsKey: Any]? = nil) -> Self {
        let bundle = Bundle(for: self)
        let nib = UINib(nibName: "\(self)", bundle: bundle)

        guard let view = nib.instantiate(withOwner: withOwner, options: options).first as? Self else {
            fatalError("Could not load view from nib file.")
        }
        return view
    }
}
