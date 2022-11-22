//
//  ViewController.swift
//  UpDownGame
//
//  Created by 이재웅 on 2022/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    // 문법적 의미?
    // outlet은 인터페이스 빌더에 올라와있는 ui요소의 값을 가져오고 싶을 때 사용
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // asset 이미지 스토리보드가 아닌 코드로 넣기
        slider.setThumbImage(#imageLiteral(resourceName:"slider_thumb"), for: .normal)
    }
    
    // 슬라이드 했을 때 숫자 변경값 표시
    // IBAction은 인터페이스 빌더에 요소들이 이벤트를 받았을 때 반응하기 위한 코드
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
    }

    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
    
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
    }

}

