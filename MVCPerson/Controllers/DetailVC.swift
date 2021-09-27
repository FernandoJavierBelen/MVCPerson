//
//  DetailVC.swift
//  MVCPerson
//
//  Created by Fernado Belen on 26/09/2021.
//

import UIKit

class DetailVC: UIViewController {
    
    var person: Person
    
    lazy var tableViewDetail: UITableView = {
        let tableViewDetail = UITableView()
        tableViewDetail.translatesAutoresizingMaskIntoConstraints = false
        tableViewDetail.estimatedRowHeight = UITableView.automaticDimension
        tableViewDetail.separatorStyle = .none
        return tableViewDetail
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewDetail.separatorColor = .black
        self.title = "Team NX"
        setupView()
    }
    
    private func setupView(){
        addViewHerarchy()
        addViewConstraints()
        addProperties()
    }
    
    private func addViewHerarchy(){
        view.addSubview(tableViewDetail)
    }
    
    private func addViewConstraints(){
        NSLayoutConstraint.activate([tableViewDetail.topAnchor.constraint(equalTo: view.topAnchor),
                                     tableViewDetail.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     tableViewDetail.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     tableViewDetail.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
    
    private func addProperties(){
        tableViewDetail.dataSource = self
        tableViewDetail.delegate = self
        tableViewDetail.register(ProfileCell.self, forCellReuseIdentifier: "ProfileCell")
        tableViewDetail.register(DataProfileCell.self, forCellReuseIdentifier: "DataProfileCell")
        tableViewDetail.register(DescriptionProfileCell.self, forCellReuseIdentifier: "DescriptionProfileCell")

    }
    
    init(with person: Person) {
        self.person = person
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension DetailVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
            cell.person = self.person
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DataProfileCell", for: indexPath) as! DataProfileCell
            cell.person = self.person
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionProfileCell", for: indexPath) as! DescriptionProfileCell
            cell.person = self.person
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DetailVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
}
