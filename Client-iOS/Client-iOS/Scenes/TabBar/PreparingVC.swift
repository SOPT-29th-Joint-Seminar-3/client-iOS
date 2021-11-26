//
//  PreparingVC.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/11/18.
//

import UIKit

// MyMusicVC(내 음악 뷰)를 제외한 나머지 탭에 연결되는 뷰 컨트롤러
final class PreparingVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        alert()
    }
    
    private func alert() {
        let alertController = UIAlertController(title: "🙇🏻‍♂️ 준비중입니다.", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
