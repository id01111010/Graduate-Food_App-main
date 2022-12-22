//
//  ReusableImageView.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

import UIKit
class MyImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    func setup() {
     contentMode = .scaleAspectFit
     translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("error")
    }
}
