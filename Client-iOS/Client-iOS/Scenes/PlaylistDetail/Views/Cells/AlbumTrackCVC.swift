//
//  AlbumTrackTVC.swift
//  Client-iOS
//
//  Created by 1v1 on 2021/11/19.
//

import UIKit

class AlbumTrackCVC: UICollectionViewCell {
    static let ID = "AlbumTrackCVC"

    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albumImageView.layer.cornerRadius = albumImageView.frame.height * 0.106382
    }
    
    func setData(data: Song) {
        songTitleLabel.text = data.name
        artistLabel.text = data.singer
    }
}
