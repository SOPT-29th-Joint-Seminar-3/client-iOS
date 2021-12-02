//
//  PlaylistPopUpView.swift
//  Client-iOS
//
//  Created by taehy.k on 2021/12/02.
//

import UIKit

final class PlaylistPopUpView: UIView {
    static let instance = PlaylistPopUpView()
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var textFieldContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    private var eventHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    private func configure() {
        containerView.layer.cornerRadius = 8
        textFieldContainerView.layer.cornerRadius = 8
        textField.becomeFirstResponder()
    }
    
    // MARK: - Actions
    @IBAction func cancelBtnTapped(_ sender: Any) {
        moveOut()
    }
    
    private func moveOut() {
         UIView.animate(withDuration: 0.15) {
             self.alpha = 0
             self.containerView.alpha = 0
         } completion: { _ in
             self.removeFromSuperview()
         }
     }
    
    @IBAction func confirmBtnTapped(_ sender: Any) {
        eventHandler?()
        moveOut()
    }

    public func present(_ eventHandler: @escaping (() -> Void)) {
        self.eventHandler = eventHandler
        DispatchQueue.main.async {
            self.frame = UIScreen.main.bounds
            AppDelegate.currentKeyWindow?.addSubview(self)
            UIApplication.topViewController()?.view.endEditing(false)
            self.moveIn()
        }
    }
    
    private func moveIn() {
        self.alpha = 0.0
        self.containerView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        self.containerView.alpha = 0.0

        UIView.animate(withDuration: 0.2) {
            self.alpha = 1.0
        } completion: { _ in
            UIView.animate(withDuration: 0.05) {
                self.containerView.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                self.containerView.alpha = 1.0
            } completion: { _ in
                UIView.animate(withDuration: 0.15) {
                    self.containerView.transform = CGAffineTransform.identity
                }
            }
        }
    }
}

extension AppDelegate {
    static var currentKeyWindow: UIWindow? {
        UIApplication.shared.windows.first { $0.isKeyWindow }
    }
}
