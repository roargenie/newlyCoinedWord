//
//  ViewController.swift
//  newlyCoinedWord
//
//  Created by 이명진 on 2022/07/08.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var mainTextField: UITextField!
    
    @IBOutlet weak var searchButton: UIButton!
    
    @IBOutlet var tagButtonArr: [UIButton]!
    
    @IBOutlet weak var divisionLineView: UIView!
    
    @IBOutlet weak var mainLabel: UILabel!
    
    var newlyCoinedWordsDic: [String: String] =
    ["머선129": "무슨 일이야?", "무물보": "무엇이든 물어보세요", "군싹": "군침이 싹 도네", "어쩔티비": "어쩌라고 가서TV나 봐", "좋댓구알": "좋아요, 댓글, 구독, 알림설정", "쿠쿠루삥뽕": "ㅋㅋㅋㅋㅋ비웃는 소리", "만잘부": "만나서 반가워 잘 부탁해", "억텐": "억지텐션", "주불": "주소 불러", "ㄱㅂㅈㄱ": "가보자고", "감동심해": "감동을 심하게 받았다"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainTextField.addTarget(self, action: #selector(performAction), for: .primaryActionTriggered)
        //mainTextField.delegate = self
        configureUI()
               
        
    }
    
    
    
    
    func configureUI() {
        mainTextField.layer.borderWidth = 3
        mainTextField.layer.borderColor = UIColor.black.cgColor
        mainTextField.placeholder = "입력해주세요"
        mainTextField.returnKeyType = .done
        
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
        searchButton.layer.borderWidth = 3
        searchButton.layer.borderColor = UIColor.black.cgColor
        
        
        for i in tagButtonArr {
            i.titleLabel?.adjustsFontSizeToFitWidth = true
            i.titleLabel?.adjustsFontForContentSizeCategory = true
            i.setTitle(" ", for: .normal)
            i.setTitleColor(.gray, for: .normal)
            i.layer.borderColor = UIColor.gray.cgColor
            i.layer.borderWidth = 2
            i.layer.cornerRadius = 10
            i.contentVerticalAlignment = .center
            i.titleLabel!.font = .systemFont(ofSize: 20, weight: .bold)
        }
        
        divisionLineView.layer.borderWidth = 1
        divisionLineView.layer.borderColor = UIColor.darkGray.cgColor
         
        mainLabel.textAlignment = .center
        mainLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        mainLabel.text = ""
        mainLabel.numberOfLines = 1
    }
    
    
    
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        var _ = newlyCoinedWordsDic.map { (key, value) in
            if mainTextField.text == key {
                mainLabel.text = value
            }
            tagButtonArr.map { Button in
                Button.randomElement()!.setTitle(key, for: .normal)
            }
            
        }
        //mainTextField.becomeFirstResponder()
        mainTextField.resignFirstResponder()
    }
    
    @IBAction func firstButtonTapped(_ sender: UIButton) {
        mainTextField.text = tagButtonArr[0].titleLabel!.text
    }
    
    @IBAction func secondButtonTapped(_ sender: UIButton) {
        mainTextField.text = tagButtonArr[1].titleLabel!.text
    }
    
    @IBAction func thirdButtonTapped(_ sender: UIButton) {
        mainTextField.text = tagButtonArr[2].titleLabel!.text
    }
    
    @IBAction func fourthButtonTapped(_ sender: UIButton) {
        mainTextField.text = tagButtonArr[3].titleLabel!.text
    }
    
    @IBAction func tapGestureTapped(_ sender: UITapGestureRecognizer) {
        
        view.endEditing(true)
        
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        mainTextField.resignFirstResponder()
//
//        return true
//    }
    
    @objc func performAction() {
        var _ = newlyCoinedWordsDic.map { (key, value) in
            if mainTextField.text == key {
                mainLabel.text = value
            }
            tagButtonArr.map { Button in
                Button.randomElement()!.setTitle(key, for: .normal)
            }
        }
    }
    
    
    
    
    
    
    

}

