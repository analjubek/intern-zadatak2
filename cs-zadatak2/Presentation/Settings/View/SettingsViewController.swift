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
        if (indexPath.row == 0){
            UIApplication.shared.open(URL(string: viewModel.terms)!)
        }
        if (indexPath.row == 1){
            navigationController?.pushViewController(OtherAppsViewController(), animated: true)
        }
    }
}

extension SettingsViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
//        TODO: više vrsta ćelija, enum
        cell.lblSetting.text = viewModel.settings[indexPath.row].setting
        cell.setupCellArrow(isArrowVisible: viewModel.settings[indexPath.row].isArrowVisible)
        return cell
    }
}
