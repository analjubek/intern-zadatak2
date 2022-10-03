//
//  SettingsViewController.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject{
    func viewController(didRequestOtherApps vc: UIViewController)
}

public class SettingsViewController: UIViewController {
    
    weak var delegate: SettingsViewControllerDelegate?
    @IBOutlet var tvSettings: UITableView!
    
    private var viewModel = SettingsViewModel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        tvSettings.delegate = self
        tvSettings.dataSource = self
        tvSettings.register(UINib(nibName: SettingsCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: SettingsCell.identifier)
    }
}

extension SettingsViewController: UITableViewDelegate{
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel.settings[indexPath.row].settingType{
        case .rules:
            UIApplication.shared.open(URL(string: viewModel.terms)!)
        case .others:
            navigationController?.pushViewController(OtherAppsViewController(), animated: true)
        case .version:
            return
        }
    }
}

extension SettingsViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.settings.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
        cell.configure(viewModel: viewModel.settings[indexPath.row])
        return cell
    }
}
