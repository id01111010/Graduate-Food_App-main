//
//  DetailViewController.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

import UIKit
protocol DetailViewControllerInterface: AnyObject {
    func setTitle()
    func prepareTableView()
    func setNavigationItem()
    func reloadData()
    func goToDetail(
    to ViewController: UIViewController,
    animated: Bool)
}

class DetailViewController: UIViewController {
  var viewModel = DetailViewControllerViewModel()
     var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
    
    @objc private func didTapCartButton() {
        viewModel.didTapCartButton()
    }
}
    //MARK: - DetailViewController: UITableViewDelegate, UITableViewDataSource
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView,
         numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.count
    }
    func tableView(_ tableView: UITableView,
         cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
        withIdentifier: DetailTableViewCell.identifier,
        for: indexPath) as? DetailTableViewCell else {
        return UITableViewCell()
        }
        cell.configure(with: viewModel.model[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView,
         heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height/1.5
    }
}
    //MARK: - extension DetailViewController: DetailViewControllerInterface
extension DetailViewController: DetailViewControllerInterface {
    func setTitle() {
        title = "Detail"
        view.backgroundColor = .secondarySystemBackground
        navigationItem.largeTitleDisplayMode = .never
    }
  
    func prepareTableView() {
        view.addSubview(tableView)
        tableView.register(DetailTableViewCell.self,
        forCellReuseIdentifier: DetailTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
    }
    func setNavigationItem() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.up.bin")?
        .withRenderingMode(.alwaysTemplate),
        style: .done,
        target: self,
        action: #selector(didTapCartButton))
        navigationItem.rightBarButtonItem?.tintColor = .darkText
    }
    
    func reloadData() {
        tableView.reloadData()
    }
    
    func goToDetail(
        to ViewController: UIViewController,
        animated: Bool)
    {
        navigationController?.pushViewController(
        ViewController,
        animated: true)
    }
}
    //MARK: - viewDidLayoutSubviews
extension DetailViewController {
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: view.frame.size.height/1.1)
        ])
    }
}


