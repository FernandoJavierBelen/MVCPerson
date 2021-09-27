//
//  HomeVC.swift
//  MVCPerson
//
//  Created by Fernado Belen on 25/09/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    var list = [Person]()
    let httpClient = HTTPClient()
    
    lazy var indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView()
        indicatorView.backgroundColor = .white
        indicatorView.hidesWhenStopped = true
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        tableView.separatorColor = .orange
        self.title = "Team NX"
        super.viewDidLoad()
        setupView()
        // Aque debo mostrar el UIActivity indicator view
        self.indicatorView.startAnimating()
        httpClient.request(urlString: "https://run.mocky.io/v3/50e8ad78-a104-41ff-a392-596b86b0f2cf", method: "GET", completion: {(list: GroupOfPeron?, success: Bool) in
            if success, let list = list?.persons {
                self.list = list
                self.tableView.reloadData()
            }
            // Aqui debo parar y ocultar la animacion
            self.indicatorView.stopAnimating()
        })
    }
    
    func setupView(){
        addViewHerarchy()
        addConstraints()
        addProperties()
    }
    
    func addViewHerarchy(){
        view.addSubview(tableView)
        view.addSubview(indicatorView)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([tableView.topAnchor.constraint(equalTo: view.topAnchor),
                                     tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                                     tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                                     tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                                     
                                     indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    }
    
    func addProperties(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PersonCell.self, forCellReuseIdentifier: "PersonCell")
    }
}

extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonCell") as! PersonCell
        cell.person = list[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailVC(with: list[indexPath.row])
        navigationController?.pushViewController(detailVC, animated: true)
    }
}

extension HomeVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
}
