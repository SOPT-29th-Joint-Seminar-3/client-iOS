//
//  AlbumTrackHeaderView.swift
//  Client-iOS
//
//  Created by 1v1 on 2021/11/18.
//

import UIKit

class AlbumTrackHeaderView: UIView {
    @IBOutlet weak var newBtn: UIButton!
    @IBOutlet weak var imgBtn: UIButton!
    @IBOutlet weak var songCountLabel: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpUI() {
        newBtn.layer.cornerRadius = newBtn.frame.height / 0.260869
        imgBtn.layer.cornerRadius = imgBtn.frame.height / 0.260869
    }
}
