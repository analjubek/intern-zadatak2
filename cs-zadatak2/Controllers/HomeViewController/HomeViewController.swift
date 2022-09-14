//
//  HomeViewController.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

// TODO: Filip - pokazati kako napraviti 2 CollectionViewa na istom screenu

import UIKit
import CoreData

protocol HomeViewControllerDelegate: AnyObject{
    func viewController(didRequestProceed vc: UIViewController)
}

class HomeViewController: UIViewController {
    
    private var newsCoreData: [NSManagedObject]?
    
    weak var delegate: HomeViewControllerDelegate?
    
    @IBOutlet var nbNews: UINavigationBar!
    @IBOutlet var cvCategories: UICollectionView!
    @IBOutlet var cvHome: UICollectionView!
    
    var cellCategory: UICollectionViewCell?
    var categories = [CategoryModel(categoryName: "Naslovnica", isSelected: true), CategoryModel(categoryName: "Sport", isSelected: false), CategoryModel(categoryName: "Magazin", isSelected: false), CategoryModel(categoryName: "Video", isSelected: false)]
    
    var height: Float?
    var width: Float?
    
    let newsLayout = UICollectionViewFlowLayout()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.delegate?.viewController(didRequestProceed: self)
        controllNavBar()
        makeCategoryCollection(){
            DispatchQueue.main.async {
                self.makeNewsCollection()
            }
        }
//        print("News with id = 0")
//        print(SingletonData.shared.fetchNewsByIdFromCoreData(newsId: 0))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit{
        print("Deinited:", self)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { [self] _ in
            controllNavBar()
            setupNewsSize()
            makeCategoryCollection(){
                DispatchQueue.main.async {
                    self.makeNewsCollection()
                }
            }
        }
    }
    
    func setupNewsSize(){
        if (UIApplication.shared.statusBarOrientation.isPortrait){
            newsLayout.itemSize = CGSize(width: cvHome.bounds.width, height: cvHome.bounds.height/2+20)
        }
        else{
            newsLayout.itemSize = CGSize(width: cvHome.frame.width/2, height: 330)
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
    
    func makeCategoryCollection(completion: @escaping () -> ()){
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: cvCategories.bounds.width/4, height: cvCategories.bounds.height)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        self.cvCategories.collectionViewLayout = flowLayout
        
        self.cvCategories.register(UINib(nibName: CategoryCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: CategoryCell.identifier)
        self.cvCategories.dataSource = self
        self.cvCategories.delegate = self
        
        completion()
    }
    
    func makeNewsCollection(){
        setupNewsSize()
        newsLayout.minimumLineSpacing = 0
        newsLayout.minimumInteritemSpacing = 0
        self.cvHome.collectionViewLayout = newsLayout
        
        self.cvHome.register(UINib(nibName: HomeCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: HomeCell.identifier)
        self.cvHome.dataSource = self
        self.cvHome.delegate = self
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == cvCategories){
            return 4
        }
        if (collectionView == cvHome){
            return 10
        }
        return Int()
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == cvCategories){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
            
            let categoryModel = CategoryModel(categoryName: categories[indexPath.row].categoryName, isSelected: categories[indexPath.row].isSelected)
            
            cell.setupCategoryCell(categoryData: categoryModel)
            
            return cell
        }
        if (collectionView == cvHome){
            let homeCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
            let newsModel = DataFunctions().fetchNewsByIdFromCoreData(newsId: indexPath.row)
            
            homeCell.setupHomeCell(newsData: newsModel)
            
            return homeCell
        }
        else{
            return UICollectionViewCell()
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if(collectionView == cvCategories){
            for i in 0...3{
                categories[i].isSelected = false
            }
            categories[indexPath.row].isSelected = true
            let cell = collectionView.cellForItem(at: indexPath) as! CategoryCell
            cell.setupCategoryCell(categoryData: CategoryModel(categoryName: categories[indexPath.row].categoryName, isSelected: categories[indexPath.row].isSelected))
            cvCategories.reloadData()
        }
        if(collectionView == cvHome){
            let newsLink = DataFunctions().fetchNewsByIdFromCoreData(newsId: indexPath.row).link
            print(newsLink)
            
            self.delegate?.viewController(didRequestProceed: self)
        }
    }
}
