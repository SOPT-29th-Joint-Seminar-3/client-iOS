//
//  BaseVC.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/18.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        style()
    }
    
    private func style() {
        view.backgroundColor = .systemBackground
    }
}
