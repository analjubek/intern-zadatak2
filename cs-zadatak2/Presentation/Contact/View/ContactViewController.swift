//
//  ContactViewController.swift
//  cs-zadatak2
//
//  Created by Ana Ljubek on 07.09.2022..
//

import UIKit

public protocol ContactViewControllerDelegate: AnyObject{
    func viewController(didRequestProceed vc: UIViewController)
}

public class ContactViewController: UIViewController {
    
    weak var delegate: ContactViewControllerDelegate?
    @IBOutlet var tvContacts: UITableView!
    
    private var viewModel = ContactViewModel()
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        tvContacts.delegate = self
        tvContacts.dataSource = self
        tvContacts.register(UINib(nibName: ContactCell.identifier, bundle: Bundle.main), forCellReuseIdentifier: ContactCell.identifier)
    }
}

extension ContactViewController: UITableViewDelegate{
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row != 0){
            UIApplication.shared.open(URL(string: viewModel.contactsUrl[indexPath.row])!)
        }
        else{
            guard let email = URL(string: viewModel.contactsUrl[indexPath.row]) else { return }
                    if UIApplication.shared.canOpenURL(email) {
                        UIApplication.shared.open(email)
                    } else {
                        print("Can't open url on this device")
                    }
        }
    }
}

extension ContactViewController: UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactCell.identifier, for: indexPath) as! ContactCell
        
        cell.lblContact.text = viewModel.contacts[indexPath.row]
        
        return cell
    }
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
    
}
