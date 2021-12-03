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
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var bookmarkButton: UIButton!
    
    // 일시적인 토글 처리
    private var isSelectedBookmarkBtn: Bool = false {
        didSet {
            if isSelectedBookmarkBtn {
                bookmarkButton.setImage(
                    UIImage(named: "icn_star_fill"), for: .normal
                )
            } else {
                bookmarkButton.setImage(
                    UIImage(named: "icn_star"), for: .normal
                )
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }
    
    private func configUI() {
        titleLabel.text = ""
        descriptionLabel.text = ""
        arrowButton.alpha = 0
    }
    
    func setData(data: PlaylistDetailData) {
        titleLabel.text = data.title
        descriptionLabel.text = data.dataDescription
    }

    @IBAction func touchUpBackButton(_ sender: Any) {
        /// pop
        NotificationCenter.default.post(name: NSNotification.Name("pop"), object: nil)
    }
    
    @IBAction func touchUpBookmarkButton(_ sender: Any) {
        isSelectedBookmarkBtn.toggle()
    }
}
