//
//  DetailViewControllerViewModel.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//


import UIKit
import SDWebImage

protocol DetailViewViewModelProtocol {
    var  view: DetailViewControllerInterface? { get set }
    func viewDidLoad()
    func didTapCartButton()
    func didSelectItemAt (at indexPath: IndexPath)
}

final class DetailViewControllerViewModel {
  weak  var view: DetailViewControllerInterface?
   var model = [Food]()
}
    //MARK: - extension FoodViewViewModel: FoodViewModelProtocol
extension DetailViewControllerViewModel: DetailViewViewModelProtocol {
    func viewDidLoad() {
        view?.setTitle()
        view?.prepareTableView()
        view?.setNavigationItem()
        view?.reloadData()
    }
    
    func didTapCartButton() {
        let vc = CartViewController()
        view?.goToDetail(to: vc, animated: true)
    }
    
 
    
    func didSelectItemAt(at indexPath: IndexPath) {
    let vc = DetailViewController()
    let models = model[indexPath.row]
    vc.viewModel.model.append(models)
    let navVC = UINavigationController(rootViewController: vc)
    navVC.modalPresentationStyle = .fullScreen
    view?.goToDetail(to: vc, animated: true)
    }
}


