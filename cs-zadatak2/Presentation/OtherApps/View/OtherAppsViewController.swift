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
    
    private var viewModel = OtherAppsViewModel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = viewModel.title
        
        tvOtherApps.delegate = self
        tvOtherApps.dataSource = self
        tvOtherApps.register(UINib(nibName: OtherAppsCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: OtherAppsCell.identifier)
    }
}

extension OtherAppsViewController: UITableViewDelegate{
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UIApplication.shared.open(URL(string: viewModel.appsURL[indexPath.row])!)
    }
}

extension OtherAppsViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OtherAppsCell.identifier, for: indexPath) as! OtherAppsCell
        
        cell.lblOtherApps.text = viewModel.apps[indexPath.row]
        
        return cell
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
}
