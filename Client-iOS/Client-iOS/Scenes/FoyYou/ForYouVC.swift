//
//  ForYouVC.swift
//  Client-iOS
//
//  Created by 양수빈 on 2021/12/23.
//

import UIKit

class ForYouVC: UIViewController {
    
    // MARK: - IBOutlets
    
    // MARK: - Properties
    

    // MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setStyle()
    }
    
    // MARK: - Setup
    
    private func setStyle() {
        navigationController?.navigationBar.isHidden = true
    }
}
