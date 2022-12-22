//
//  CartViewModel.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

import UIKit
protocol CartViewModelProtocol {
    var  view: CartViewControllerInterface? { get set }
    func viewDidLoad()
    func viewWillAppear()
    func deleteRows(at indexpath: IndexPath, with: UITableView.RowAnimation)
}

final class CartViewControllerViewModel {
    weak  var view: CartViewControllerInterface?
    var model = [FoodsCart]()
    
    func getChartedFood() {
        FoodService.shared.getChartedFood(userName: "zohrab") {[weak self] result in
        switch result {
        case.success(let succes):
            self?.model = succes
            DispatchQueue.main.async {
                self?.view?.reloadData()
            }
          
        case.failure(let error):
            print(error.localizedDescription)
        }
    }
    }
}
extension CartViewControllerViewModel: CartViewModelProtocol {

    func viewDidLoad() {
        view?.setTitle()
        view?.prepareTableView()
        getChartedFood()
    }
    func viewWillAppear() {
        getChartedFood()
    }
    func deleteRows(at indexpath: IndexPath, with: UITableView.RowAnimation) {
        let id = model[indexpath.row].cartID
        FoodService.shared.deleteFood(cartId: id, userName: "zohrab")
        view?.beginUpdates()
        self.model.remove(at: indexpath.row)
        view?.deleteRows(at: [indexpath], with: .fade)
        view?.endUpdates()
    }
}
