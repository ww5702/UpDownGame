//
//  ViewController.swift
//  UpDownGame
//
//  Created by 이재웅 on 2022/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    var randomValue: Int = 0    // 컴퓨터가 지시하는 랜덤변수
    var tryCount: Int = 0       // 시도횟수
    
    // 문법적 의미?
    // outlet은 인터페이스 빌더에 올라와있는 ui요소의 값을 가져오고 싶을 때 사용
    // weak이라는 개념은 나중에 다시 설명
    @IBOutlet weak var slider: UISlider!
    
    // 최대 최소 지정 레이블
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLabel: UILabel!
    
    // 몇번을 시도했는지 연결해줄 레이블
    @IBOutlet weak var tryCountLabel: UILabel!
    // 슬라이더의 현재값이 얼마나 되는지 연결해줄 레이블
    @IBOutlet weak var sliderValueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // asset 이미지 스토리보드가 아닌 코드로 넣기
        slider.setThumbImage(#imageLiteral(resourceName:"slider_thumb"), for: .normal)
        
        reset()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) {
            (action) in self.reset()
        }
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
        
    }
    
    func noticeAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let noticeAction = UIAlertAction(title: "OK", style: .default)
        
        alert.addAction(noticeAction)
        present(alert, animated: true, completion: nil)
    
    }
    
    // 슬라이드 했을 때 숫자 변경값 표시
    // IBAction은 인터페이스 빌더에 요소들이 이벤트를 받았을 때 반응하기 위한 코드
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        /*
         let integerValue: Int = Int(sender.value)
         sliderValueLabel.text = String(integerValue)
         */
        sliderValueLabel.text = String(Int(sender.value))
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        
        slider.value = Float(hitValue) // slider는 float값이기 때문에 정수값을 다시 실수값으로 변환한다.
        
        // 정답체크
        
        if(hitValue == randomValue) {
            showAlert(message: "YOU HIT!!")
            print("YOU HIT!!")
            tryCount += 1
            tryCountLabel.text = "\(tryCount) / 5"
            reset()     // 맞췄을 시 초기화
            return
        } else if (tryCount >= 4) {
            showAlert(message: "YOU LOSE..")
            print("YOU LOSE..")
            reset()     // 틀렸을 시 초기화
            return
        } else if(hitValue < randomValue) {
            noticeAlert(message: "UP!")
            print("UP!")
            tryCount += 1
            tryCountLabel.text = "\(tryCount) / 5"
            
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = "\(hitValue)"
            
        } else if(hitValue > randomValue) {
            noticeAlert(message: "DOWN!")
            print("DOWN!")
            tryCount += 1
            tryCountLabel.text = "\(tryCount) / 5"
            
            slider.maximumValue = Float(hitValue)
            maximumValueLabel.text = "\(hitValue)"
            
        } else {
            showAlert(message: "상정하지 못한 오류입니다.")
            print("상정하지 못한 오류입니다.")
        }
        
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        reset()
    }
    
    func reset() {
        print("reset!")
        // 초기화 버튼 누를시 매번 초기화되어야 하는 기능
        randomValue = Int.random(in: 0...100)   // 0에서 100 사이중에 랜덤
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        minimumValueLabel.text = "0"
        maximumValueLabel.text = "100"
        sliderValueLabel.text = "50"
    }
    
}

