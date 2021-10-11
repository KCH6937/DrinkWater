//
//  ViewController.swift
//  DrinkWater
//
//  Created by 강채현 on 2021/10/09.
//

import UIKit

class DrinkWaterViewController: UIViewController {
    
    @IBOutlet var todayDrink: UILabel!
    @IBOutlet var ml: UILabel!
    @IBOutlet var percentage: UILabel!
    @IBOutlet var recommendDrink: UILabel!
    
    @IBOutlet var toDrink: UITextField!

    @IBOutlet var growthImageView: UIImageView!
    
    @IBOutlet var drinkButton: UIButton!
    @IBOutlet var initButton: UIBarButtonItem!

    var recommendWater:Float = 0.0
    var drinkAmount:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        renderUI()
    }

    func renderUI() {
        toDrink.keyboardType = .numberPad
        toDrink.text = "ml"
        growthImageView.image = UIImage(named: "1-1")
        todayDrink.text = "-"
        ml.text = "0ml"
        percentage.text = "-"
        recommendDrink.text = "-"
        recommendDrink.text = "물 권장 섭취량을 위해 프로필을 입력해주세요!"
    }
    
    func drinkCycle() -> Int {
        let value1: [String]! = (ml.text)?.components(separatedBy: "ml")
        let value2: [String]! = (toDrink.text)?.components(separatedBy: "ml")
        let sum1: Int! = Int(value1[0])
        let sum2: Int! = Int(value2[0])
        if sum1 == nil || sum2 == nil {
            return drinkAmount
        }
        drinkAmount = sum1 + sum2
        return sum1 + sum2
    }
    
    func isUser() {
        if userApply == true && height != nil && weight != nil {
            recommendWater = ((Float(height) + Float(weight)) / 100)
            todayDrink.text = "잘하셨어요!\n오늘 마신 양은"
            percentage.text = "목표의 0%"
            recommendDrink.text = "\(String(nickname))님의 하루 물 권장 섭취량은 \(recommendWater)L 입니다."
            
        }
    }
    
    func growthImageChange(rate: Int) {
        let rate = rate / 10
        switch rate {
        case 1:
            growthImageView.image = UIImage(named: "1-1")
        case 2:
            growthImageView.image = UIImage(named: "1-2")
        case 3:
            growthImageView.image = UIImage(named: "1-3")
        case 4:
            growthImageView.image = UIImage(named: "1-4")
        case 5:
            growthImageView.image = UIImage(named: "1-5")
        case 6:
            growthImageView.image = UIImage(named: "1-6")
        case 7:
            growthImageView.image = UIImage(named: "1-7")
        case 8:
            growthImageView.image = UIImage(named: "1-8")
        case 9:
            growthImageView.image = UIImage(named: "1-9")
        case 10:
            growthImageView.image = UIImage(named: "1-9")
        default:
            growthImageView.image = UIImage(named: "1-1")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        isUser()
    }
    
    @IBAction func initButton(_ sender: UIBarButtonItem) {
        if userApply == true {
            percentage.text = "목표의 0%"
        } else {
            percentage.text = "-"
        }
        
        ml.text = "ml"
        toDrink.placeholder = "ml(밀리리터)"
        drinkAmount = 0
        renderUI()
    }
    
    @IBAction func sendDrink(_ sender: UIButton) {
        ml.text = String(drinkCycle()) + "ml"
        if userApply == true {
            let percent:Int = Int(Double(Double(drinkAmount) / Double(recommendWater * 1000)) * 100)
            percentage.text = "목표의 \(percent)%"
            growthImageChange(rate: percent)
        }
        toDrink.text = "ml"
        toDrink.placeholder = "ml(밀리리터)"
    }
    
    @IBAction func onViewClicked(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func onKeyboardReturned(_ sender: UITextField) {
      view.endEditing(true)
    }
    
    
    
    
}

