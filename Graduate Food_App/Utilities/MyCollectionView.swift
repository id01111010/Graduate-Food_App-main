//
//  MyCollectionView.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

import UIKit
class MyCollectionView: UICollectionView {
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 70
        layout.minimumInteritemSpacing = 1
        layout.scrollDirection = .vertical
        super.init(frame: frame, collectionViewLayout: layout)
      
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
