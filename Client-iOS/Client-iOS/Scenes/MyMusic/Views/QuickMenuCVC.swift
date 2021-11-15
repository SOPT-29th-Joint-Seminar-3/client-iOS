//
//  quickMenuCVC.swift
//  Client-iOS
//
//  Created by 양수빈 on 2021/11/15.
//

import UIKit

class QuickMenuCVC: UICollectionViewCell {

    // MARK: - $IBOutlet
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    
    var count = 127
    
    // MARK: - Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }

    // MARK: - Custom Method
    func configUI() {
        backImageView.layer.cornerRadius = 12
        
        countLabel.text = "\(count)곡"
        
        /// countLabel medium 32 + "곡" 부분만 따로 meduim 14
        let font = UIFont.systemFont(ofSize: 14)
        let fullText = countLabel.text ?? ""
        let range = (fullText as NSString).range(of: "곡")
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        countLabel.attributedText = attributedString
        
    }
}
