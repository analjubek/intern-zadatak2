//
//  NewsDIContainer.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 06.10.2022..
//

import Foundation
import UIKit
import SwiftUI

final class NewsDIContainer {
    // MARK: - Use Cases
    func getNewsUseCase() -> GetNewsUseCase {
        return DefaultGetNewsUseCase(newsRepository: makeNewsRepository())
    }

    // MARK: - Repositories
    func makeNewsRepository() -> NewsRepository {
        return DefaultNewsRepository()
    }
    
    // MARK: - Home
    func makeHomeViewController() -> HomeViewController {
        return HomeViewController.create(with: makeHomeViewModel())
    }
    
    func makeHomeViewModel() -> HomeViewModel {
        return HomeViewModel(getNewsUseCase: getNewsUseCase())
    }
}
