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

class SettingsViewController: UIViewController {
    
    weak var delegate: SettingsViewControllerDelegate?
    @IBOutlet var tvSettings: UITableView!
    
    let settings = ["Pravila korištenja i privatnosti", "Ostale HRT aplikacije", "Verzija: 1.5.1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvSettings.delegate = self
        tvSettings.dataSource = self
        tvSettings.register(UINib(nibName: SettingsCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: SettingsCell.identifier)
    }
}

extension SettingsViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.row == 0){
            UIApplication.shared.open(URL(string: "https://o-nama.hrt.hr/zastita-privatnosti-i-pravo-na-pristup-informacijama/uvjeti-koristenja-sadrzaja-objavljenog-na-hrt-ovim-digitalnim-platformama-4423")!)
        }
        if (indexPath.row == 1){
            self.delegate?.viewController(didRequestOtherApps: self)
        }
    }
}

extension SettingsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
        
        cell.lblSetting.text = settings[indexPath.row]
        
        if(indexPath.row == 2){
            cell.ivArrow.isHidden = true
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
    
}
