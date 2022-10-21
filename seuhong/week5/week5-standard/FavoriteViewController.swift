//
//  TrashViewController.swift
//  week5-standard
//
//  Created by 홍승완 on 2022/10/21.
//

import UIKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.contentInset = .init(top: 10, left: 10, bottom: 10, right: 10)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }
    
    
}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = collectionView.frame.width / 2 - 15 //  2등분하여 배치, 옆 간격이 1이므로 1을 빼줌
        print("collectionView width=\(collectionView.frame.width)")
        print("cell하나당 width=\(width)")
        print("root view width = \(self.view.frame.width)")

        let size = CGSize(width: width, height: width)
        return size
    }
    
    // 위 아래 간격
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 10
        }

        // 옆 간격
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 5
        }

}

extension FavoriteViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var favoriteCount = DetailMemo.MemoList.lazy.filter({ $0.favorite }).count
        print(favoriteCount)
        return favoriteCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteCell", for: indexPath) as? FavoriteCell else {
            return UICollectionViewCell()
        }
        if(DetailMemo.MemoList[indexPath.row].favorite){
            cell.configure(item: DetailMemo.MemoList[indexPath.row])
            cell.layer.cornerRadius = 10
        }
        
        
        
        return cell
    }
    
    
}
