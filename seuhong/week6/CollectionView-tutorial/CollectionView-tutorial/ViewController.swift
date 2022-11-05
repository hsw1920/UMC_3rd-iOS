//
//  ViewController.swift
//  CollectionView-tutorial
//
//  Created by 홍승완 on 2022/11/04.
//

import UIKit

class Data {
    var imageName: String = ""
    var title: String = ""
    init(imageName: String, title: String) {
        self.imageName = imageName
        self.title = title
    }
    
    static var list: [Data] = [
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
        Data(imageName: "sun.max", title: "Title"),
    ]
}

let items = Data.list

class ViewController: UIViewController {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBAction func pageChanged(_ sender: UIPageControl) {
        
        let indexPath = IndexPath(item: sender.currentPage * 6, section: 0)
        
        // 인덱스패스위치로 컬렉션 뷰를 스크롤
        
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
  
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        pageControl.currentPage = 0
        
    }

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DataCell", for: indexPath) as? DataCell else {
            return UICollectionViewCell()
        }
        cell.configure(items[indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.layer.bounds.width/3, height: collectionView.layer.bounds.height/2-8)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let width = scrollView.bounds.size.width
        // 좌표보정을 위해 절반의 너비를 더해줌
        let x = scrollView.contentOffset.x + (width/2)
        
        let newPage = Int(x / width)
        if pageControl.currentPage != newPage {
            pageControl.currentPage = newPage
        }
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    
}

