//
//  CartTableViewCell.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

import UIKit

class CartTableViewCell: UITableViewCell {
static let identifier = "CartTableViewCell"
    
    let conteinerView = MyConteinerView()
    let headerImage = MyImageView(frame: .zero)
    let nameLabel = MyReusableLabel(labelType: .H3, labelColor: .gray)
    let priceLabel = MyReusableLabel(labelType: .H1, labelColor: .brown)
    let idLabel = MyReusableLabel(labelType: .H3, labelColor: .gray)
    let categoryLabel = MyReusableLabel(labelType: .H3, labelColor: .brown)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(conteinerView)
        conteinerView.addSubview(headerImage)
        conteinerView.addSubview(nameLabel)
        conteinerView.addSubview(categoryLabel)
        conteinerView.addSubview(priceLabel)
        conteinerView.addSubview(idLabel)
    }
    func configure(with model: FoodsCart) {
        self.nameLabel.text = model.name
        self.idLabel.text = "ID : \(model.cartID)"
        self.priceLabel.text = "Total price : \(model.price) AZN"
        self.categoryLabel.text = model.category
        self.headerImage.sd_setImage(with:URL(string: "\(Constants.getImages)\(model.image)"))
        
     }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    //MARK: - NSLayoutConstraint
extension CartTableViewCell {
    override func layoutSubviews() {
NSLayoutConstraint.activate([
    conteinerView.topAnchor.constraint(
    equalTo: contentView.topAnchor,
    constant: 10),
    conteinerView.leadingAnchor.constraint(
    equalTo: contentView.leadingAnchor,
    constant: 10),
    conteinerView.trailingAnchor.constraint(
    equalTo: contentView.trailingAnchor,
    constant: -10),
    conteinerView.bottomAnchor.constraint(
    equalTo: contentView.bottomAnchor,
    constant: -10),

    headerImage.topAnchor.constraint(
    equalTo: conteinerView.topAnchor,
    constant: 0),
    headerImage.leadingAnchor.constraint(
    equalTo: conteinerView.leadingAnchor,
    constant: -60),
    headerImage.heightAnchor.constraint(
    equalToConstant: 100),

    nameLabel.topAnchor.constraint(
    equalTo: conteinerView.topAnchor,
    constant: 10),
    nameLabel.leadingAnchor.constraint(
    equalTo: headerImage.trailingAnchor,
    constant: -40),
    
    categoryLabel.topAnchor.constraint(
    equalTo: nameLabel.bottomAnchor,
    constant: 20),
    categoryLabel.leadingAnchor.constraint(
    equalTo: headerImage.trailingAnchor,
    constant: -40),
    
    idLabel.topAnchor.constraint(
    equalTo: nameLabel.bottomAnchor,
    constant: 20),
    idLabel.leadingAnchor.constraint(
    equalTo: categoryLabel.trailingAnchor,
    constant: 20),
    
    priceLabel.topAnchor.constraint(
    equalTo: headerImage.bottomAnchor),
    priceLabel.trailingAnchor.constraint(
    equalTo: conteinerView.trailingAnchor,
    constant: -30),
    




    ])
    
}
    
}
