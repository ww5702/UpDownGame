//
//  RankViewController.swift
//  UpDownGame
//
//  Created by 이재웅 on 2022/11/24.
//

import UIKit

// UITableViewDataSource = 테이블 뷰 셀의 갯수, UITableViewDelegate = 테이블 뷰를 어떻게 보여줄 것인가
class RankViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var label: UILabel!
    var text: String?
    
    let memoName = ["여기에", "랭킹등수", "하는데", "이번에는", "물러간다", "다시보자"]
    let memoCount = ["언젠가", "넣어야", "일단", "여기서", "다음에",";;;"]
    
    
    // 테이블 뷰에서 행(row)의 개수를 반환
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return memoName.count   //셀의 갯수
    }
    
    // 행을 구성하는 셀을 반환
    // 하나의 재활용 가능한 셀(Reusable Cell)을 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            
            return UITableViewCell()
        }
        cell.nameLabel.text = memoName[indexPath.row]
        cell.countLable.text = memoCount[indexPath.row]
        return cell
        
    }
    
    
    // 창 닫기
    @IBAction func touchUpDismissButton(_ sender:UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    // @IBOutlet var tableView: UITableView!
    
    // main에서 텍스트 가져오기
    override func viewDidLoad() {
        if text != nil {
            label.text = text
        }
    }
    
    
}

class ListCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var countLable: UILabel!
}
