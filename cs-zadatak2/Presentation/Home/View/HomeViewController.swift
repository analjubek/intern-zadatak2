//
//  HomeViewController.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import UIKit
import CoreData

protocol HomeViewControllerDelegate: AnyObject{
    func viewController(didRequestProceed vc: UIViewController, url: String, title: String)
}

public class HomeViewController: UIViewController {
        
    weak var delegate: HomeViewControllerDelegate?
    
    @IBOutlet var svHomeStack: UIStackView!
    @IBOutlet var cvCategories: CategoriesCollectionView!
    @IBOutlet var cvHome: HomeCollectionView!
    @IBOutlet var vwCollection: UIView!
    
    private var viewModel = HomeViewModel()
    
    var cellCategory: UICollectionViewCell?
    
    var height: Float?
    var width: Float?
    
    let newsLayout = UICollectionViewFlowLayout()
    
    public override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.becomeFirstResponder()
        DispatchQueue.main.async {
            self.cvCategories.makeCategoryCollection()
            self.cvHome.makeNewsCollection(size: self.setupNewsSize())
            self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "Naslovnica", style: .plain, target: nil, action: nil)
        }
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        cvHome.homeDelegate = self
    }
    
    deinit{
        print("Deinited:", self)
    }
    
    public override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil) { [self] _ in
            DispatchQueue.main.async {
                self.cvCategories.makeCategoryCollection()
                self.cvHome.makeNewsCollection(size: self.setupNewsSize())
                navigationItem.backBarButtonItem = UIBarButtonItem(title: "Naslovnica", style: .plain, target: nil, action: nil)
            }
        }
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        self.cvHome.reloadData()
        print("tapped")
    }
    
    func setupNewsSize() -> CGSize{
        let scenes = UIApplication.shared.connectedScenes
        let windowScene = scenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        let isPortrait = (window?.windowScene?.interfaceOrientation.isPortrait)! as Bool
        
        if(isPortrait){
            return CGSize(width: cvHome.frame.width, height: 370)
        }
        else{
            return CGSize(width: cvHome.frame.width/2, height: 370)
        }
    }
}

extension HomeViewController: HomeCollectionViewDelegate{
    func viewController(didRequestProceed vc: UICollectionView, url: String, title: String) {
        self.delegate?.viewController(didRequestProceed: self, url: url, title: title)
    }
}
