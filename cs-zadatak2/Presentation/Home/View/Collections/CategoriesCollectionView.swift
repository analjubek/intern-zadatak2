//
//  CategoriesCollectionView.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 28.09.2022..
//

import UIKit

protocol CategoriesCollectionViewDelegate: AnyObject{
    func setupCurrentCategory(categoryTitle: String)
    func reloadNewsData()
}

class CategoriesCollectionView: UICollectionView {
    
    weak var categoryDelegate: CategoriesCollectionViewDelegate?
    
    var viewModel = HomeViewModel(getNewsUseCase: NewsDIContainer().getNewsUseCase())
    
    func makeCategoryCollection() {
///        AL: kako ovako nesto napraviti tu ???
//        viewModel.load(category: .program)
//        print(NewsDIContainer().getNewsUseCase().execute(category: .program))
///        AL: isto to treba napraviti i u HomeCollectionView
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: self.frame.width/4, height: self.frame.height)
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        
        self.collectionViewLayout = flowLayout
        
        self.register(UINib(nibName: CategoryCell.identifier, bundle: Bundle.main), forCellWithReuseIdentifier: CategoryCell.identifier)
        
        self.delegate = self
        self.dataSource = self
    }
}

extension CategoriesCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.identifier, for: indexPath) as! CategoryCell

            let categoryModel = CategoryModel(category: viewModel.categories[indexPath.row].category, categoryName: viewModel.categories[indexPath.row].categoryName, isSelected: viewModel.categories[indexPath.row].isSelected, rssUrl: viewModel.categories[indexPath.row].rssUrl)

            cell.setupCategoryCell(categoryData: categoryModel)

            return cell
        
    }

    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        setupSelectedCategory(indexPath: indexPath)

        let cell = collectionView.cellForItem(at: indexPath) as! CategoryCell
        cell.setupCategoryCell(categoryData: CategoryModel(category: viewModel.categories[indexPath.row].category, categoryName: viewModel.categories[indexPath.row].categoryName, isSelected: viewModel.categories[indexPath.row].isSelected, rssUrl: viewModel.categories[indexPath.row].rssUrl))
        self.reloadData()
        
        getCategoryNews(indexPath: indexPath)
    }
    
    func setupSelectedCategory(indexPath: IndexPath){
        for i in 0...3{
            viewModel.categories[i].isSelected = false
        }
        viewModel.categories[indexPath.row].isSelected = true
        viewModel.currentCategoryTitle = viewModel.categories[indexPath.row].categoryName
        self.categoryDelegate?.setupCurrentCategory(categoryTitle: viewModel.currentCategoryTitle)
    }
    
    func getCategoryNews(indexPath: IndexPath){
//        TODO
        NewsStorage().getNews(url: viewModel.categories[indexPath.row].rssUrl){
            DispatchQueue.main.async {
                self.categoryDelegate?.reloadNewsData()
            }
        }
    }
}
