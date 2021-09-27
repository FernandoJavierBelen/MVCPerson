//
//  DataProfileCell.swift
//  MVCPerson
//
//  Created by Fernado Belen on 27/09/2021.
//

import UIKit

class DataProfileCell: UITableViewCell {
    
    var person: Person! {
        didSet{
            lblAge.text = "\(person.age)"
            lblPhone.text = "\(person.phone)"
            lblRole.text = person.role
        }
    }
    
    private lazy var lblAge: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblPhone: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblRole: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lblAgeTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.lblAgeTitle
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    private lazy var lblPhoneTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.lblPhoneTitle
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    private lazy var lblRoleTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.lblRoleTitle
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(){
        addViewHerarchy()
        addConstraints()
    }
    
    func addViewHerarchy(){
        addSubview(lblAge)
        addSubview(lblPhone)
        addSubview(lblRole)
        addSubview(lblAgeTitle)
        addSubview(lblPhoneTitle)
        addSubview(lblRoleTitle)
    }
    
    func addConstraints(){
        NSLayoutConstraint.activate([lblAge.topAnchor.constraint(equalTo: topAnchor, constant: 30),
                                     lblAge.leadingAnchor.constraint(equalTo: lblAgeTitle.trailingAnchor,constant: 25),
                                     lblAge.heightAnchor.constraint(equalToConstant: 16),
                                     
                                     lblPhone.topAnchor.constraint(equalTo: lblAge.bottomAnchor, constant: 15),
                                     lblPhone.leadingAnchor.constraint(equalTo: lblPhoneTitle.trailingAnchor, constant: 10),
                                     lblPhone.heightAnchor.constraint(equalToConstant: 16),
                                     
                                     lblRole.topAnchor.constraint(equalTo: lblPhone.bottomAnchor, constant: 15),
                                     lblRole.leadingAnchor.constraint(equalTo: lblRoleTitle.trailingAnchor, constant: 20),
                                     lblRole.heightAnchor.constraint(equalToConstant: 16),
                                     
                                     // lbl etiquetas
                                     lblAgeTitle.topAnchor.constraint(equalTo: topAnchor, constant: 30),
                                     lblAgeTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
                                     lblAgeTitle.heightAnchor.constraint(equalToConstant: 16),
                                     
                                     lblPhoneTitle.topAnchor.constraint(equalTo: lblAgeTitle.bottomAnchor, constant: 15),
                                     lblPhoneTitle.leadingAnchor.constraint(equalTo: lblAgeTitle.leadingAnchor, constant: 0),
                                     lblPhoneTitle.heightAnchor.constraint(equalToConstant: 16),
                                     
                                     lblRoleTitle.topAnchor.constraint(equalTo: lblPhoneTitle.bottomAnchor, constant: 15),
                                     lblRoleTitle.leadingAnchor.constraint(equalTo: lblPhoneTitle.leadingAnchor, constant: 0),
                                     lblRoleTitle.heightAnchor.constraint(equalToConstant: 20),
                                     lblRoleTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)])
    }
}

fileprivate extension String {
    static var lblAgeTitle = "Age"
    static var lblPhoneTitle = "Phone"
    static var lblRoleTitle = "Role"
}
