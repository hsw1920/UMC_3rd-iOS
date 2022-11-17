//
//  ViewController.swift
//  collectionView_tutorial
//
//  Created by 강석호 on 2022/11/04.
//

import UIKit

struct ImageInfo {
    let name: String
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpeg")
    }
    
    init (name: String) {
        self.name = name
    }
}


class ViewController: UIViewController,
                      UICollectionViewDataSource,
                      UICollectionViewDelegate {
    
    let viewModel = ImageViewModel() // 뷰모델 변수를 추가합니다.
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.countOfImageList // 뷰모델에서 카운트 가져옴
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as?
                Cell else {
            return UICollectionViewCell()
        }
        
        let imageInfo = viewModel.imageInfo(at: indexPath.item) // indexPath.item을 기준으로 뷰모델에서 ImageInfo 가져옴
        cell.update(info: imageInfo) // 해당 셀을 업데이트
        return cell

    }
    
    // 셀이 선택되었을 때
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let imageInfo = viewModel.imageInfo(at: indexPath.item)
        
        let dialog = UIAlertController(title: "\(imageInfo.name)", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "확인", style: UIAlertAction.Style.default)

        dialog.addAction(action)

        self.present(dialog, animated: true, completion: nil)

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

class Cell: UICollectionViewCell {
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func update(info: ImageInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
    }
    
}

// view model
class ImageViewModel {
    let imageInfoList: [ImageInfo] = [
        ImageInfo(name: "IU_1"),
        ImageInfo(name: "IU_2"),
        ImageInfo(name: "IU_4"),
//        ImageInfo(name: "Jellyfish"),
//        ImageInfo(name: "Koala"),
//        ImageInfo(name: "Lighthouse"),
//        ImageInfo(name: "Penguins"),
//        ImageInfo(name: "Tulips"),
    ]
    
    var countOfImageList: Int {
        return imageInfoList.count
    }
    
    func imageInfo(at index: Int) -> ImageInfo {
        return imageInfoList[index]
    }
}
