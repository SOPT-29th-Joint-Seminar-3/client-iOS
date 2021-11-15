//
//  quickMenuCVC.swift
//  Client-iOS
//
//  Created by 양수빈 on 2021/11/15.
//

import UIKit

class QuickMenuCVC: UICollectionViewCell {

    // MARK: - @IBOutlet
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }

    // MARK: - Custom Method
    func configUI() {
        backImageView.layer.cornerRadius = 12
    }
}
