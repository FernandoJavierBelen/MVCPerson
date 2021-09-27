//
//  PersonCell.swift
//  Prueba
//
//  Created by Fernado Belen on 16/09/2021.
//

import UIKit
import SDWebImage

class PersonCell: UITableViewCell {
    
    var person: Person! {
        didSet{
            lblFullName.text = person.fullName()
            lblAge.text = "\(person.age)"
            lblPhone.text = "\(person.phone)"
            //imgPhoto.image = UIImage(named: person.img)
            imgPhoto.sd_setImage(with: URL(string: person.img)!, placeholderImage: UIImage(named:"PersonPlaceHolder"))
            lblRole.text = person.role
        }
    }
    
    private lazy var lblFullName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
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
    
    private lazy var imgPhoto: UIImageView = {
        let imgPhoto = UIImageView()
        imgPhoto.translatesAutoresizingMaskIntoConstraints = false
        imgPhoto.layer.cornerRadius = imageWidth/2
        imgPhoto.layer.masksToBounds = true
        return imgPhoto
    }()
    
    private lazy var lblRole: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // lbl tipo etiquetas
    private lazy var lblName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.lblName
        label.textAlignment = .left
        label.font = .boldSystemFont(ofSize: 15)
        label.textColor = .gray
        return label
    }()
    
    private lazy var lblAgeTtitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = String.lblAgeTtitle
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
        label.translatesAutoresizingMaskIntoConstraints =  false
        label.text = String.lblRoleTitle
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
    
    private func setupView(){
        addViewHerarchy()
        addConstraints()
        //addProperties()
    }
    
    private func addViewHerarchy(){
        [lblFullName, lblAge, lblPhone, imgPhoto, lblName, lblAgeTtitle, lblPhoneTitle, lblRoleTitle, lblRole].forEach({addSubview($0)})
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([lblFullName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
                                     lblFullName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 220),
                                     lblFullName.heightAnchor.constraint(equalToConstant: 16),
                                     lblAge.topAnchor.constraint(equalTo: topAnchor, constant: 50),
                                     lblAge.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 220),
                                     lblAge.heightAnchor.constraint(equalToConstant: 16),
                                     lblPhone.topAnchor.constraint(equalTo: topAnchor, constant: 80),
                                     lblPhone.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 220),
                                     lblPhone.heightAnchor.constraint(equalToConstant: 16),
                                     imgPhoto.topAnchor.constraint(equalTo: topAnchor,constant: 20),
                                     imgPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
                                     imgPhoto.heightAnchor.constraint(equalToConstant: imageHeigth),
                                     imgPhoto.widthAnchor.constraint(equalToConstant: imageWidth),
                                     lblRole.topAnchor.constraint(equalTo: topAnchor, constant: 110),
                                     lblRole.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 220),
                                     lblRole.heightAnchor.constraint(equalToConstant: 20),
                                     
                                     //lbl name, age, phone
                                     lblName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
                                     lblName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
                                     lblName.heightAnchor.constraint(equalToConstant: 16),
                                     lblAgeTtitle.topAnchor.constraint(equalTo: topAnchor, constant: 50),
                                     lblAgeTtitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
                                     lblAgeTtitle.heightAnchor.constraint(equalToConstant: 16),
                                     lblPhoneTitle.topAnchor.constraint(equalTo: topAnchor, constant: 80),
                                     lblPhoneTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
                                     lblPhoneTitle.heightAnchor.constraint(equalToConstant: 16),
                                     lblRoleTitle.topAnchor.constraint(equalTo: topAnchor, constant: 110),
                                     lblRoleTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 150),
                                     lblRoleTitle.heightAnchor.constraint(equalToConstant: 16)])
    }
}

fileprivate extension String {
    static var lblName = "Name: "
    static var lblAgeTtitle = "Age: "
    static var lblPhoneTitle = "Phone: "
    static var lblRoleTitle = "Role: "
}
