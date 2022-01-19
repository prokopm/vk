//
//  ViewController.swift
//  vk
//
//  Created by Максим Прокопенко on 24.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    //MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let hideKeyBoardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyBoard))
        scrollView.addGestureRecognizer(hideKeyBoardGesture)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHide(notification: )),
                                               name:UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillShowNotification,
                                                  object: nil)
        NotificationCenter.default.removeObserver(self,
                                                  name: UIResponder.keyboardWillHideNotification,
                                                  object: nil)
    }
    
    // MARK: - Actions
    @IBAction func loginButton(_ sender: Any) {
        if loginInput.text == "admin" && passwordInput.text == "1234" {
            print("succses")
        } else {
            print("failure")
        }
    }
    
    @objc func hideKeyBoard(){
        scrollView.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: Notification){
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInset = UIEdgeInsets(top: 0, left: 0, bottom: kbSize.height, right: 0)
        self.scrollView.contentInset = contentInset
        self.scrollView.scrollIndicatorInsets = contentInset
    }
    
    @objc func keyboardWillBeHide(notification: Notification){
        
        let contentInset = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
        
    }
}
