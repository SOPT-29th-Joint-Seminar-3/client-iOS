//
//  MyPlayListTVC.swift
//  Client-iOS
//
//  Created by 1v1 on 2021/11/14.
//

import UIKit

class MyPlayListTVC: UITableViewCell {
    static let ID = "MyPlayListTVC"
    
    @IBOutlet weak var albumImageView: UIImageView! {
        didSet {
            albumImageView.layer.cornerRadius = albumImageView.frame.height * 0.132352
        }
    }
    @IBOutlet weak var albumTitleLabel: UILabel!
    @IBOutlet weak var albumCountLabel: UILabel!
    
    func setData(image: UIImage, title: String, count: Int) {
        albumImageView.image = image
        albumTitleLabel.text = title
        albumCountLabel.text = "\(count)곡"
    }
}
