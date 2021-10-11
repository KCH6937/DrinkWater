//
//  ProfileViewController.swift
//  DrinkWater
//
//  Created by 강채현 on 2021/10/10.
//

import UIKit
import TextFieldEffects

var nickname: String!
var height: Int!
var weight: Int!
var userApply: Bool = false

class ProfileViewController: UIViewController {
    
    @IBOutlet var saveButton: UIBarButtonItem!
    
    @IBOutlet var growthImageView: UIImageView!
    
    @IBOutlet var nicknameField: JiroTextField!
    @IBOutlet var heightField: JiroTextField!
    @IBOutlet var weightField: JiroTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        config()
    }
    
    func config() {
        heightField.keyboardType = .numberPad
        weightField.keyboardType = .numberPad
    }
    
    func alertConfig(til : String, msg: String, conf: String) {
        let alert = UIAlertController(title: til, message: msg, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: conf, style: .default) { (action) in}
        alert.addAction(okAction)
        present(alert, animated: false, completion: nil)
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        if nicknameField.text == "" || heightField.text == "" || weightField.text == "" {
            alertConfig(til: "잠시만요!!", msg: "닉네임, 키, 체중을 모두 입력해주세요!", conf: "닫기")
        } else {
            nickname = nicknameField.text
            height = Int(heightField.text ?? "잘못된 입력입니다.")
            weight = Int(weightField.text ?? "잘못된 입력입니다.")
            userApply = true
            alertConfig(til: "저장이 완료되었습니다 :)", msg: "닉네임: \(nickname!)\n키: \(height!)\n체중: \(weight!)\n입니다.", conf: "확인")
        }
    }
        
    @IBAction func onviewClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func onKeyboardReturned(_ sender: UITextField) {
        view.endEditing(true)
    }
    
}
