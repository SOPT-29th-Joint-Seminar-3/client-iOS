//
//  MyPlayListHeaderView.swift
//  Client-iOS
//
//  Created by 1v1 on 2021/11/16.
//

import UIKit

class MyPlayListHeaderView: UICollectionReusableView {
    @IBOutlet weak var newBtn: UIButton!
    @IBOutlet weak var imgBtn: UIButton!
    @IBOutlet weak var songCountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func setUpUI() {
        newBtn.layer.cornerRadius = newBtn.frame.height * 0.260869
        imgBtn.layer.cornerRadius = imgBtn.frame.height * 0.260869
    }
    
    // 새로 만들기 버튼 눌렀을 때 팝업 호출
    @IBAction func addNewPlaylistBtnTapped(_ sender: Any) {
        PlaylistPopUpView
            .loadFromXib()
            .present { [weak self] title in
                // 클로저로 전달받은 텍스트 필드 속 값을 인자로 전달
                self?.createPlaylist(title: title)
            }
    }
    
    // 플레이리스트 생성 서버 통신
    private func createPlaylist(title: String) {
        PlaylistDetailService.shared.createPlaylist(title: title) { response in
            switch response {
            case .success(let data):
                guard let data = data as? PlaylistDetailModel else { return }
                print(data)
            default:
                print("데이터 불러오기 실패")
            }
        }
    }
}
