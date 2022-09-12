//
//  HomeViewController.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import UIKit

protocol HomeViewControllerDelegate: AnyObject{
    func viewController(didRequestProceed vc: UIViewController)
}

class HomeViewController: UIViewController {
    
    private var newsItems: [NewsModel]?
    
    weak var delegate: HomeViewControllerDelegate?
    
    @IBOutlet var nbNews: UINavigationBar!
    @IBOutlet var cvCategories: UICollectionView!
    
    var cellCategory: UICollectionViewCell?
    var categories = [CategoryModel(categoryName: "Naslovnica", isSelected: true), CategoryModel(categoryName: "Sport", isSelected: false), CategoryModel(categoryName: "Magazin", isSelected: false), CategoryModel(categoryName: "Video", isSelected: false)]
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        controllNavBar()
        makeCategoryCollection()
        
        //print("Data from CoreData")
        //print(SingletonData.shared.fetchNewsFromCoreData())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { [self] _ in
            controllNavBar()
            makeCategoryCollection()
        }
    }
    
    func controllNavBar(){
        if (UIApplication.shared.statusBarOrientation.isPortrait){
            self.nbNews.isHidden = false
        }
        else{
            self.nbNews.isHidden = true
        }
    }
    
    func makeCategoryCollection(){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: cvCategories.bounds.width/4, height: cvCategories.bounds.height)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        self.cvCategories.collectionViewLayout = flowLayout
        
        self.cvCategories.register(UINib(nibName: CategoryCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: CategoryCell.identifier)
        self.cvCategories.dataSource = self
        self.cvCategories.delegate = self
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
        
        let categoryModel = CategoryModel(categoryName: categories[indexPath.row].categoryName, isSelected: categories[indexPath.row].isSelected)
        
        cell.setupCell(categoryData: categoryModel)
        
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for i in 0...3{
            categories[i].isSelected = false
        }
        categories[indexPath.row].isSelected = true
        let cell = collectionView.cellForItem(at: indexPath) as! CategoryCell
        cell.setupCell(categoryData: CategoryModel(categoryName: categories[indexPath.row].categoryName, isSelected: categories[indexPath.row].isSelected))
        cvCategories.reloadData()
    }
}

