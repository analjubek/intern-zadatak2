//
//  HomeCollectionView.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 28.09.2022..
//

import UIKit

protocol HomeCollectionViewDelegate: AnyObject{
    func viewController(didRequestProceed vc: UICollectionView, url: String, title: String)
}

class HomeCollectionView: UICollectionView {
    
    weak var homeDelegate: HomeCollectionViewDelegate?
    
    var viewModel = HomeViewModel()
    var newsLayout = UICollectionViewFlowLayout()
    
    func makeNewsCollection(size: CGSize){
        newsLayout.itemSize = size
        
        newsLayout.minimumLineSpacing = 0
        newsLayout.minimumInteritemSpacing = 0
        
        self.collectionViewLayout = newsLayout
        
        self.register(UINib(nibName: HomeCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: HomeCell.identifier)
        
        self.dataSource = self
        self.delegate = self
    }
}

extension HomeCollectionView: UICollectionViewDataSource {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (viewModel.currentCategoryTitle == "Naslovnica"){
            return 12
        }
        if (viewModel.currentCategoryTitle == "Sport" || viewModel.currentCategoryTitle == "Magazin"){
            return 24
        }
        if (viewModel.currentCategoryTitle == "Program"){
            return 14
        }
        return Int()
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let homeCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCell.identifier, for: indexPath) as! HomeCell
            let newsModel = NewsStorage().fetchNewsByIdFromCoreData(newsId: indexPath.row)

            homeCell.setupHomeCell(newsData: newsModel)
            
            return homeCell
    }
}

extension HomeCollectionView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newsLink = NewsStorage().fetchNewsByIdFromCoreData(newsId: indexPath.row).link
        self.homeDelegate?.viewController(didRequestProceed: self, url: newsLink, title: viewModel.currentCategoryTitle)
    }
}
