//
//  ReusableView.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

import UIKit

class MyConteinerView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    func setup() {
       backgroundColor = .systemBackground
       layer.cornerRadius = 10
       layer.shadowOffset = CGSize(width: 0, height: 2)
       layer.shadowRadius = 2
       layer.shadowOpacity = 2
       layer.shadowColor = UIColor.lightGray.cgColor
       translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("error")
    }
}
