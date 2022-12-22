//
//  DetailTableViewCell.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//


import UIKit

final class DetailTableViewCell: UITableViewCell {
    static let identifier = "DetailTableViewCell"
    var isLiked = false
    var imageName = String()
    lazy var priceText = Int()
    let conteinerView = MyConteinerView()
    let headerImage = MyImageView(frame: .zero)
    let nameLabel = MyReusableLabel(labelType: .H1, labelColor: .gray)
    let priceLabel = MyReusableLabel(labelType: .H1, labelColor: .brown)
    let idLabel = MyReusableLabel(labelType: .H3, labelColor: .gray)
    let categoryLabel = MyReusableLabel(labelType: .H3, labelColor: .brown)
    let stepperCount = MyReusableLabel(labelType: .H1, labelColor: .gray)
    let totalCount = MyReusableLabel(labelType: .H1, labelColor: .gray)
    
    let firstStepper: UIStepper = {
         let stepper = UIStepper()
         stepper.minimumValue = 1
         stepper.maximumValue = 10
         stepper.value = 1
         stepper.translatesAutoresizingMaskIntoConstraints = false
         return stepper
     }()
    let addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Add to Cart", for: .normal)
        button.backgroundColor = .brown
        button.layer.cornerRadius = 10
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        stepperCount.text = "1"
        contentView.addSubview(conteinerView)
        conteinerView.addSubview(headerImage)
        conteinerView.addSubview(nameLabel)
        conteinerView.addSubview(categoryLabel)
        conteinerView.addSubview(priceLabel)
        conteinerView.addSubview(idLabel)
        conteinerView.addSubview(firstStepper)
        conteinerView.addSubview(stepperCount)
        conteinerView.addSubview(addToCartButton)
        conteinerView.addSubview(totalCount)
        
        firstStepper.addTarget(
        self,
        action: #selector(tappedStepper),
        for: .touchUpInside)
        
        addToCartButton.addTarget(
        self,
        action: #selector(tappedCartButton),
        for: .touchUpInside)
    }
    
    func configure(with model: Food) {
        self.nameLabel.text = model.name
        self.idLabel.text = "ID : \(model.id)"
        self.priceLabel.text = "\(model.price) AZN"
        self.priceText = model.price
        self.totalCount.text = "\(model.price) AZN"
        self.categoryLabel.text = model.category.rawValue
        self.headerImage.sd_setImage(with:URL(string: "\(Constants.getImages)\(model.image)"))
        self.imageName = model.image
     }
    

    
        @objc private func tappedCartButton() {
          isLiked = !isLiked
          animate()
            guard let id  = idLabel.text else {return}
            guard let name  = nameLabel.text else {return}
            guard let category  = categoryLabel.text else {return}
            let count =  "\(Int(firstStepper.value))"
            let total = Int(count)! * priceText
            FoodService.shared.insertFood(cartId: Int(id) ?? 1, name: name, image: imageName, price: total, category: "\(category)", orderAmount: count, userName: "zohrab")
       
            }
    
        private func animate() {
          UIView.animate(withDuration: 0.1, animations: {
            self.transform = self.transform.scaledBy(x: 0.8, y: 0.8)
          }, completion: { _ in
          UIView.animate(withDuration: 0.1, animations: {
            self.transform = CGAffineTransform.identity
            })
          })
        }

    @objc private func tappedStepper() {
        stepperCount.text  = "\(Int(firstStepper.value))"
        let count = Int(firstStepper.value)
        let total = count * priceText
        totalCount.text = "\(total) AZN"
   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
}
    //MARK: - Constraints
extension DetailTableViewCell {
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
    constant: -10),
    headerImage.leadingAnchor.constraint(
    equalTo: conteinerView.leadingAnchor,
    constant: 10),
    headerImage.trailingAnchor.constraint(
    equalTo: conteinerView.trailingAnchor,
    constant: -10),
    headerImage.heightAnchor.constraint(
    equalToConstant: 150),

    priceLabel.topAnchor.constraint(
    equalTo: headerImage.bottomAnchor,
    constant: 20),
    priceLabel.leadingAnchor.constraint(
    equalTo: conteinerView.leadingAnchor,
    constant: 20),
    priceLabel.trailingAnchor.constraint(
    equalTo: conteinerView.trailingAnchor,
    constant: -20),

    idLabel.topAnchor.constraint(
    equalTo: priceLabel.bottomAnchor,
    constant: 10),
    idLabel.leadingAnchor.constraint(
    equalTo: conteinerView.leadingAnchor,
    constant: 20),
    idLabel.trailingAnchor.constraint(
    equalTo: conteinerView.trailingAnchor,
    constant: -20),
    
    categoryLabel.topAnchor.constraint(
    equalTo: idLabel.bottomAnchor,
    constant: 10),
    categoryLabel.leadingAnchor.constraint(
    equalTo: conteinerView.leadingAnchor,
    constant: 20),
    categoryLabel.trailingAnchor.constraint(
    equalTo: conteinerView.trailingAnchor,
    constant: -20),

    firstStepper.topAnchor.constraint(
    equalTo: categoryLabel.bottomAnchor,
    constant: 20),
    firstStepper.leadingAnchor.constraint(
    equalTo: conteinerView.leadingAnchor,
    constant: 135),
    firstStepper.trailingAnchor.constraint(
    equalTo: conteinerView.trailingAnchor,
    constant: -135),

    stepperCount.topAnchor.constraint(
    equalTo: firstStepper.bottomAnchor,
    constant: 10),
    stepperCount.leadingAnchor.constraint(
    equalTo: conteinerView.leadingAnchor,
    constant: 10),
    stepperCount.trailingAnchor.constraint(
    equalTo: conteinerView.trailingAnchor,
    constant: -10),


    addToCartButton.topAnchor.constraint(
    equalTo: stepperCount.bottomAnchor,
    constant: 20),
    addToCartButton.leadingAnchor.constraint(
    equalTo: conteinerView.leadingAnchor,
    constant: 40),
    addToCartButton.trailingAnchor.constraint(
    equalTo: conteinerView.trailingAnchor,
    constant: -40),
    addToCartButton.heightAnchor.constraint(
    equalToConstant: 48),

    totalCount.topAnchor.constraint(
    equalTo: addToCartButton.bottomAnchor,
    constant: 20),
    totalCount.leadingAnchor.constraint(
    equalTo: conteinerView.leadingAnchor,
    constant: 20),
    totalCount.trailingAnchor.constraint(
    equalTo: conteinerView.trailingAnchor,
    constant: -20),
            
        ])
        
    }
}

 

