//
//  BaseViewController.swift
//  FCJ
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    var mainTopOffset: CGFloat {
        return 150
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        addKeyboardWillShowObserver()
        addKeyboardDidShowObserver()
        addKeyboardWillHideObserver()
        addKeyboardDidHideObserver()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        super.present(viewControllerToPresent, animated: flag, completion: completion)
    }
    
    func keyboardWillShow(startFrame: CGRect?, endFrame: CGRect?) {}
    
    func keyboardDidShow(startFrame: CGRect?, endFrame: CGRect?) {}
    
    func keyboardWillHide(startFrame: CGRect?, endFrame: CGRect?) {}
    
    func keyboardDidHide(startFrame: CGRect?, endFrame: CGRect?) {}
}

extension BaseViewController {
    fileprivate func addKeyboardWillShowObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector:#selector(BaseViewController.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object:nil)
    }
    
    fileprivate func addKeyboardDidShowObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector:#selector(BaseViewController.keyboardDidShow(_:)),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object:nil)
    }
    
    fileprivate func addKeyboardWillHideObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector:#selector(BaseViewController.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object:nil)
    }
    
    fileprivate func addKeyboardDidHideObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector:#selector(BaseViewController.keyboardDidHide(_:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object:nil)
    }
    
    @objc private func keyboardWillShow(_ notification: NSNotification) {
        let frames = getKeyboardFrames(notification)
        keyboardWillShow(startFrame: frames.startFrame, endFrame: frames.endFrame)
    }
    
    @objc private func keyboardDidShow(_ notification: NSNotification) {
        let frames = getKeyboardFrames(notification)
        keyboardDidShow(startFrame: frames.startFrame, endFrame: frames.endFrame)
    }
    
    @objc private func keyboardWillHide(_ notification: NSNotification) {
        let frames = getKeyboardFrames(notification)
        keyboardWillHide(startFrame: frames.startFrame, endFrame: frames.endFrame)
    }
    
    @objc private func keyboardDidHide(_ notification: NSNotification) {
        let frames = getKeyboardFrames(notification)
        keyboardDidHide(startFrame: frames.startFrame, endFrame: frames.endFrame)
    }
    
    private func getKeyboardFrames(_ notification: NSNotification) -> (startFrame: CGRect?, endFrame: CGRect?) {
        let startFrame = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue
        let endFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        return (startFrame, endFrame)
    }
}
