//
//  ContactViewController.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import UIKit

protocol ContactViewControllerDelegate: AnyObject{
    func viewController(didRequestProceed vc: UIViewController)
}

class ContactViewController: UIViewController {
    weak var delegate: ContactViewControllerDelegate?
    @IBOutlet var tvContacts: UITableView!
    
    let contacts = ["Email", "Facbook", "Twitter", "Instagram", "YouTube"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tvContacts.delegate = self
        tvContacts.dataSource = self
        tvContacts.register(UINib(nibName: ContactCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ContactCell.identifier)
    }
}

extension ContactViewController: UITableViewDelegate{
    
}

extension ContactViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath) as! ContactCell
        
        cell.lblContact.text = contacts[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
    
}
