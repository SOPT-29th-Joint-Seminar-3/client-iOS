//
//  AlbumTrackTVC.swift
//  Client-iOS
//
//  Created by 1v1 on 2021/11/19.
//

import UIKit

class AlbumTrackTVC: UITableViewCell {
    static let ID = "AlbumTrackTVC"

    @IBOutlet weak var albumImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        albumImageView.layer.cornerRadius = albumImageView.frame.height * 0.106382
    }
}
