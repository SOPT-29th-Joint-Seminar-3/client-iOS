//
//  MyMusicColorCVC.swift
//  Client-iOS
//
//  Created by 양수빈 on 2021/12/26.
//

import UIKit

class MyMusicColorCVC: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var album_first: UIImageView!
    @IBOutlet weak var album_second: UIImageView!
    @IBOutlet weak var album_third: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configUI()
    }

    func configUI() {
        backView.layer.cornerRadius = 16
    }
}
