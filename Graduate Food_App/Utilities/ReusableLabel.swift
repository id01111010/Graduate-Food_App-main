//
//  ReusableLabel.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

import UIKit

class MyReusableLabel: UILabel {
    
    enum labelTypeEnum {
        case H1
        case H2
        case H3
    }
    
    enum colorStyle {
        case gray
        case brown
    }
    
    public private(set) var labelType: labelTypeEnum

    public private(set) var labelColor: colorStyle
    
    init( labelType: labelTypeEnum, labelColor: colorStyle) {
      
        self.labelType = labelType
        self.labelColor = labelColor
        
        super.init(frame: .zero)
        self.configureLabelStyle()
        self.configureLabelColor()
        textAlignment = .center
        self.translatesAutoresizingMaskIntoConstraints = false

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLabelColor() {
        switch labelColor {
        case .gray:
            self.textColor = UIColor(named: "gray")
        case .brown:
            self.textColor = UIColor(named: "brown")

        }
    }
    
    private func configureLabelStyle() {
        switch labelType {
        case .H1:
            self.font = UIFont(name: "SuperMarioGalaxy", size: 24)
        case .H2:
            self.font = UIFont(name: "SuperMarioGalaxy", size: 14)
        case .H3:
            self.font = UIFont(name: "SuperMarioGalaxy", size: 16)
            
        }
    }
}
