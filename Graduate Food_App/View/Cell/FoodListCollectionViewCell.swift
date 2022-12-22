//
//  FoodListCollectionViewCell.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

import UIKit

class FoodListCollectionViewCell: UICollectionViewCell {
    static let identifier = "FoodListCollectionViewCell"
    
    let conteinerView = MyConteinerView()
    let headerImage = MyImageView(frame: .zero)
    let nameLabel = MyReusableLabel(labelType: .H2, labelColor: .gray)
    let priceLabel = MyReusableLabel(labelType: .H1, labelColor: .brown)
    let idLabel = MyReusableLabel(labelType: .H3, labelColor: .gray)
    let categoryLabel = MyReusableLabel(labelType: .H3, labelColor: .brown)

  override init(frame: CGRect) {
      super.init(frame: frame)
      contentView.addSubview(conteinerView)
      conteinerView.addSubview(headerImage)
      conteinerView.addSubview(nameLabel)
      conteinerView.addSubview(categoryLabel)
      conteinerView.addSubview(priceLabel)
      conteinerView.addSubview(idLabel)
  }
    func configure(with model: Food) {
        self.headerImage.sd_setImage(with: URL(string: Constants.getImages + model.image))
        self.nameLabel.text = model.name
        self.priceLabel.text = "\(model.price) AZN"
        self.idLabel.text = String(model.id)
        self.categoryLabel.text = model.category.rawValue
     }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
    //MARK: - NSLayoutConstraint
extension FoodListCollectionViewCell {
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

  nameLabel.topAnchor.constraint(
  equalTo: conteinerView.topAnchor,
  constant: 10),
  nameLabel.leadingAnchor.constraint(
  equalTo: conteinerView.leadingAnchor,
  constant: 15),
  nameLabel.trailingAnchor.constraint(
  equalTo: conteinerView.trailingAnchor,
  constant: -15),

  headerImage.topAnchor.constraint(
  equalTo: nameLabel.bottomAnchor,
  constant: 25),
  headerImage.leadingAnchor.constraint(
  equalTo: conteinerView.leadingAnchor,
  constant: 10),
  headerImage.trailingAnchor.constraint(
  equalTo: conteinerView.trailingAnchor,
  constant: -10),
  headerImage.heightAnchor.constraint(
  equalToConstant: 150),

  priceLabel.topAnchor.constraint(
  equalTo: conteinerView.bottomAnchor,
  constant: 10),
  priceLabel.trailingAnchor.constraint(
  equalTo: conteinerView.trailingAnchor,
  constant: -20),
  priceLabel.leadingAnchor.constraint(
  equalTo: conteinerView.leadingAnchor,
  constant: 20),

  idLabel.topAnchor.constraint(
  equalTo: conteinerView.bottomAnchor,
  constant: -25),
  idLabel.leadingAnchor.constraint(
  equalTo: conteinerView.leadingAnchor,
  constant: 20),

  categoryLabel.topAnchor.constraint(
  equalTo: conteinerView.bottomAnchor,
  constant: -25),
  categoryLabel.leadingAnchor.constraint(
  equalTo: idLabel.trailingAnchor,
  constant: 25),
])
    }
}
