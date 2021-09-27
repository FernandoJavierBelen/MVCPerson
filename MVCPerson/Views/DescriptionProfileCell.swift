//
//  DescriptionProfileCell.swift
//  MVCPerson
//
//  Created by Fernado Belen on 27/09/2021.
//

import UIKit

class DescriptionProfileCell: UITableViewCell {
    
    var person: Person! {
        didSet{
            lblDescription.text = person.description
        }
    }
    
    private lazy var lblDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .justified
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var lblDescriptionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.lblDescriptionTitle
        label.textAlignment = .left
        label.textColor = .gray
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addViewHerarchy()
        addConstraints()
    }
    
    func addViewHerarchy(){
        addSubview(lblDescriptionTitle)
        addSubview(lblDescription)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([                                                 lblDescriptionTitle.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            lblDescriptionTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            lblDescriptionTitle.heightAnchor.constraint(equalToConstant: 16),
                                                                                      
            lblDescription.topAnchor.constraint(equalTo: lblDescriptionTitle.bottomAnchor, constant: 20),
            lblDescription.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            lblDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            lblDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25)])
    }
}

fileprivate extension String {
    static var lblDescriptionTitle = "Description: "
}
