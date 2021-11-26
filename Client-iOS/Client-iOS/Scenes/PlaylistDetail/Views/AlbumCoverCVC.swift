//
//  AlbumCoverCVC.swift
//  Client-iOS
//
//  Created by 양수빈 on 2021/11/16.
//

import UIKit

class AlbumCoverCVC: UICollectionViewCell {

    @IBOutlet weak var centerImageView: UIImageView!
    @IBOutlet weak var rightSecondImageView: UIImageView!
    @IBOutlet weak var rightThirdImageView: UIImageView!
    @IBOutlet weak var leftSecondImageView: UIImageView!
    @IBOutlet weak var leftThirdImageView: UIImageView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func touchUpBackButton(_ sender: Any) {
        /// pop
        NotificationCenter.default.post(name: NSNotification.Name("pop"), object: nil)
    }
}
