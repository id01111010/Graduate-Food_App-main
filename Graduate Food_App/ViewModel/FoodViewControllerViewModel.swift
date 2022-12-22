//
//  FoodViewControllerViewModel.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

import UIKit
import SDWebImage

protocol FoodViewModelProtocol {
    var  view: FoodViewControllerInterface? { get set }
    func viewDidLoad()
    func viewWillAppear()
    func didSelectItemAt (at indexPath: IndexPath)
}

final class FoodViewViewModel {
  weak  var view: FoodViewControllerInterface?
   var model = [Food]()
    
    func getAllData() {
        FoodService.shared.getAllData { [weak self] result in
            switch result {
            case .success(let success):
                self?.model = success
                DispatchQueue.main.async {
                    self?.view?.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }

    }

}
    //MARK: - extension FoodViewViewModel: FoodViewModelProtocol
extension FoodViewViewModel: FoodViewModelProtocol {
    func viewDidLoad() {
        view?.addsubViews() 
        view?.prepareCollectionView()
        view?.setTitle()
         getAllData()
    }
    
    func viewWillAppear() {
        getAllData()
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

