//
//  MyPlayListTVC.swift
//  Client-iOS
//
//  Created by 1v1 on 2021/11/14.
//

import UIKit

class MyPlayListCVC: UICollectionViewCell {
    static let ID = "MyPlayListCVC"
    
    @IBOutlet weak var albumImageView: UIImageView! {
        didSet {
            albumImageView.layer.cornerRadius = albumImageView.frame.height * 0.132352
        }
    }
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumCountLabel: UILabel!
    
//    func setData(data: MyPlayListForm) {
//        albumImageView.image = data.albumImage
//        albumTitleLabel.text = data.albumTitle
//        albumCountLabel.text = "\(data.albumCount)곡"
//    }
}
