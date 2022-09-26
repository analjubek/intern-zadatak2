//
//  OtherAppsViewController.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 15.09.2022..
//

import UIKit

public class OtherAppsViewController: UIViewController {
    @IBOutlet var tvOtherApps: UITableView!
    @IBOutlet var nbOtherApps: UINavigationBar!
    
    
    let apps = ["HRTi", "HRT Radio", "HRT Meteo", "HRT Teletekst"]
    let appsURL = ["https://apps.apple.com/hr/app/hrti-ott/id1412033720", "https://apps.apple.com/hr/app/hrt-radio/id1358478574", "https://apps.apple.com/hr/app/hrtmeteo/id1153570358", "https://apps.apple.com/hr/app/hrt-teletekst/id1220011567"]
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Ostale HRT aplikacije"

        tvOtherApps.delegate = self
        tvOtherApps.dataSource = self
        tvOtherApps.register(UINib(nibName: OtherAppsCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: OtherAppsCell.identifier)
    }
}

extension OtherAppsViewController: UITableViewDelegate{
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIApplication.shared.open(URL(string: appsURL[indexPath.row])!)
    }
}

extension OtherAppsViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OtherAppsCell.identifier, for: indexPath) as! OtherAppsCell
        
        cell.lblOtherApps.text = apps[indexPath.row]
        
        return cell
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
}
