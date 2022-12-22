//
//  CartViewController.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

import UIKit
import SDWebImage
protocol CartViewControllerInterface: AnyObject {
    func setTitle()
    func prepareTableView()
    func reloadData()
    func beginUpdates()
    func deleteRows(
    at indexpath: [IndexPath],
    with: UITableView.RowAnimation)
    func endUpdates()
}
class CartViewController: UIViewController {
    var viewModel = CartViewControllerViewModel()
    var model = [FoodsCart]()
     var tableView: UITableView = {
        let table = UITableView()
         table.register(CartTableViewCell.self, forCellReuseIdentifier: CartTableViewCell.identifier)
        return table
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}
extension CartViewController: UITableViewDelegate,
                              UITableViewDataSource
    {
    func tableView(_ tableView: UITableView,
          numberOfRowsInSection section: Int
    ) -> Int {
         return viewModel.model.count
    }
    
    func tableView(_ tableView: UITableView,
         cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell
    {
    guard  let cell = tableView.dequeueReusableCell(
        withIdentifier: CartTableViewCell.identifier,
        for: indexPath) as? CartTableViewCell else
        {
        return UITableViewCell()
        }
        cell.configure(with: viewModel.model[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView,
         commit editingStyle: UITableViewCell.EditingStyle,
         forRowAt indexPath: IndexPath)
    {
      if editingStyle == .delete {
          viewModel.deleteRows(at: indexPath, with: .fade)
    }
        
    }
    func tableView(_ tableView: UITableView,
         heightForRowAt indexPath: IndexPath
    ) -> CGFloat
    {
        return view.frame.size.height/5
    }
}

extension CartViewController: CartViewControllerInterface {
    func setTitle() {
        title = "Cart"
        view.backgroundColor = .systemBackground
    }
    
    func prepareTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func beginUpdates() {
        tableView.beginUpdates()
    }
    
    func deleteRows(
        at indexpath: [IndexPath],
        with: UITableView.RowAnimation)
    {
        tableView.deleteRows(at: indexpath, with: .fade)
    }
    
    func endUpdates() {
        tableView.endUpdates()
    }
}
