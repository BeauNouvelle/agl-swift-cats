//
//  ViewController.swift
//  SwiftCats
//
//  Created by Yilei He on 3/4/20.
//  Copyright © 2020 Yilei He. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    let tableView = UITableView()
    var genders = [Gender]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSubviews()
        loadCats()
    }
    
    private func setupSubviews() {
        view.addSubview(tableView)
        
        tableView.dataSource = self

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    private func loadCats() {
        NetworkService().getOwners { [weak self] (owners) in
            self?.genders = owners.catsOnlyGroupedByGender()
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

