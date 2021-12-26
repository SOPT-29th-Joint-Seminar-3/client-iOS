//
//  TimeMachineCVC.swift
//  Client-iOS
//
//  Created by 양수빈 on 2021/12/26.
//

import UIKit

class TimeMachineCVC: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configUI() {
        backView.layer.cornerRadius = 16
        /// backView shadow 넣기
    }
}
