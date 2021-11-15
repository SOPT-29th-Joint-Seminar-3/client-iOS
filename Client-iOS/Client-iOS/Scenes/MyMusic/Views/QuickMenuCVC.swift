//
//  quickMenuCVC.swift
//  Client-iOS
//
//  Created by 양수빈 on 2021/11/15.
//

import UIKit

class QuickMenuCVC: UICollectionViewCell {
    
    // MARK: - Dummy Data
    let categoryList = ["내가 좋아한", "내가 보관한", "최근 재생한", "많이 재생한"]
    let iconList = [""]

    // MARK: - $IBOutlet
    @IBOutlet weak var backImageView: UIImageView!
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
        
        /// countLabel medium 32 + "곡" 부분만 따로 meduim 14
        
    }
}
