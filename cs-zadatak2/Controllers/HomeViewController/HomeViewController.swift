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
    func viewController(didRequestProceed vc: UIViewController, url: String, title: String)
}

public class HomeViewController: UIViewController {
    
    private var newsCoreData: [NSManagedObject]?
    
    weak var delegate: HomeViewControllerDelegate?
    
    @IBOutlet var cvCategories: UICollectionView!
    @IBOutlet var cvHome: UICollectionView!
    
    var cellCategory: UICollectionViewCell?
    var categories = [CategoryModel(categoryName: "Naslovnica", isSelected: true, rssUrl: "https://feed.hrt.hr/vijesti/page.xml"), CategoryModel(categoryName: "Sport", isSelected: false, rssUrl: "https://feed.hrt.hr/sport/page.xml"), CategoryModel(categoryName: "Magazin", isSelected: false, rssUrl: "https://feed.hrt.hr/magazin/page.xml"), CategoryModel(categoryName: "Program", isSelected: false, rssUrl: "https://feed.hrt.hr/hrtprikazuje/page.xml")]
    
    var height: Float?
    var width: Float?
    
    let newsLayout = UICollectionViewFlowLayout()
    
    @IBOutlet var aiIndicator: UIActivityIndicatorView!
    
    var currentCategoryTitle = "Naslovnica"
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.becomeFirstResponder()
//        controllNavBar(){
        DispatchQueue.main.async {
            self.makeCategoryCollection(){
                DispatchQueue.main.async {
                    self.makeNewsCollection()
                }
            }
        }
//        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit{
        print("Deinited:", self)
    }
    
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { [self] _ in
//            controllNavBar(){
            DispatchQueue.main.async {
                setupNewsSize()
                makeCategoryCollection(){
                    DispatchQueue.main.async {
                        self.makeNewsCollection()
                    }
                }
            }
//            }
        }
    }
    
    func setupNewsSize(){
        if (UIApplication.shared.statusBarOrientation.isPortrait){
            newsLayout.itemSize = CGSize(width: cvHome.frame.width, height: 370)
        }
        else{
            newsLayout.itemSize = CGSize(width: cvHome.frame.width/2, height: 370)
        }
    }
    // TODO
    // invalidate collection do dok se ne postavi navbar
//    func controllNavBar(_ completion: () -> ()){
//        if (UIApplication.shared.statusBarOrientation.isPortrait){
//            self.navigationController?.navigationBar.isHidden = false
//        }
//        else{
//            self.navigationController?.navigationBar.isHidden = true
//            cvCategories.reloadData()
//        }
//        completion()
//    }
    
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
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == cvCategories){
            return 4
        }
        if (collectionView == cvHome){
            if (currentCategoryTitle == "Naslovnica"){
                return 12
            }
            if (currentCategoryTitle == "Sport" || currentCategoryTitle == "Magazin"){
                return 24
            }
            if (currentCategoryTitle == "Program"){
                return 14
            }
        }
        return Int()
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if (collectionView == cvCategories){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell
            
            let categoryModel = CategoryModel(categoryName: categories[indexPath.row].categoryName, isSelected: categories[indexPath.row].isSelected, rssUrl: categories[indexPath.row].rssUrl)
            
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


    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        if(collectionView == cvCategories){
            for i in 0...3{
                categories[i].isSelected = false
            }
            categories[indexPath.row].isSelected = true
            
            self.currentCategoryTitle = categories[indexPath.row].categoryName
            
            let cell = collectionView.cellForItem(at: indexPath) as! CategoryCell
            cell.setupCategoryCell(categoryData: CategoryModel(categoryName: categories[indexPath.row].categoryName, isSelected: categories[indexPath.row].isSelected, rssUrl: categories[indexPath.row].rssUrl))
            cvCategories.reloadData()
            
            DataFunctions().getNews(url: categories[indexPath.row].rssUrl){
                DispatchQueue.main.async {
                    self.cvHome.reloadData()
                }
            }
        }
        if(collectionView == cvHome){
            let newsLink = DataFunctions().fetchNewsByIdFromCoreData(newsId: indexPath.row).link
            
            self.delegate?.viewController(didRequestProceed: self, url: newsLink, title: currentCategoryTitle)
            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "Naslovnica", style: .plain, target: nil, action: nil)
            
        }
    }
}

