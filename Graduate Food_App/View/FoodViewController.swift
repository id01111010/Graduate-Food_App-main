//
//  FoodViewController.swift
//  Graduate Food_App
//
//  Created by Zohrab on 19.12.22.
//

import UIKit
import SDWebImage

protocol FoodViewControllerInterface: AnyObject {
    func prepareCollectionView()
    func setTitle()
    func addsubViews()
    func reloadData()
    func goToDetail(
    to ViewController: UIViewController,
    animated: Bool)
}

final class FoodViewController: UIViewController {
    private lazy var viewModel = FoodViewViewModel()
    private lazy var collecTionView = MyCollectionView()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}
    //MARK: - FoodViewController, UICollectionViewDelegate
extension FoodViewController:
    UICollectionViewDelegate,
  UICollectionViewDataSource,
  UICollectionViewDelegateFlowLayout
   {
    func collectionView(
    _ collectionView: UICollectionView,
     numberOfItemsInSection section: Int)
    -> Int {
        return viewModel.model.count
    }
    
    func collectionView(
    _ collectionView: UICollectionView,
     cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell
    {
    guard let cell = collectionView.dequeueReusableCell(
     withReuseIdentifier:
     FoodListCollectionViewCell.identifier,
     for: indexPath) as?
     FoodListCollectionViewCell else
    {
        return UICollectionViewCell()
    }
     cell.configure(with: viewModel.model[indexPath.row])
    return cell
}

    func collectionView(
    _ collectionView: UICollectionView,
     didSelectItemAt indexPath: IndexPath)
{
     collectionView.deselectItem(at: indexPath, animated: true)
     viewModel.didSelectItemAt(at: indexPath)
    }
    
    func collectionView(
    _ collectionView: UICollectionView,
     layout collectionViewLayout: UICollectionViewLayout,
     sizeForItemAt indexPath: IndexPath)
    -> CGSize
    {
        return CGSize(width: (
          view.frame.size.width/2)-4,
          height: (view.frame.size.width/1.5)-4)
    }
}
    //MARK: - FoodViewController: FoodViewControllerInterface
extension FoodViewController: FoodViewControllerInterface {
    func prepareCollectionView() {
        collecTionView.frame = view.bounds
        collecTionView.register(
        FoodListCollectionViewCell.self,
        forCellWithReuseIdentifier: FoodListCollectionViewCell.identifier)
        collecTionView.delegate = self
        collecTionView.dataSource = self
    }
    func setTitle() {
        title = "Foods"
    }
    func addsubViews() {
        view.addSubview(collecTionView)
    }

    func reloadData() {
        collecTionView.reloadData()
    }
    
    func goToDetail(
    to viewController: UIViewController,
    animated: Bool) {
    navigationController?.pushViewController(
    viewController,
    animated: true)
     }
    
    
}


