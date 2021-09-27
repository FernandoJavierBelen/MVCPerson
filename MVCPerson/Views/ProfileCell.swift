//
//  ProfileCell.swift
//  MVCPerson
//
//  Created by Fernado Belen on 27/09/2021.
//

import UIKit

class ProfileCell: UITableViewCell {
    
    var person: Person! {
        didSet{
            lblFullName.text = person.fullName()
            imgPhoto.sd_imageTransition = .fade
            imgPhoto.sd_setImage(with: URL(string: person.img), placeholderImage: UIImage(named: "PersonPlaceHolder"))
        }
    }
    
    private lazy var lblFullName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 40)
        return label
    }()
    
    private lazy var imgPhoto: UIImageView = {
        let imgPhoto = UIImageView()
        imgPhoto.translatesAutoresizingMaskIntoConstraints = false
        imgPhoto.layer.cornerRadius = imgWidth/2
        imgPhoto.layer.borderColor = UIColor.black.cgColor
        imgPhoto.layer.borderWidth = 3
        imgPhoto.layer.masksToBounds = true
        return imgPhoto
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:   reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addViewHerarchy()
        addConstraints()
    }
    
    private func addViewHerarchy(){
        addSubview(lblFullName)
        addSubview(imgPhoto)
    }
    
    private func addConstraints(){
        NSLayoutConstraint.activate([imgPhoto.topAnchor.constraint(equalTo: imgPhoto.topAnchor, constant: 20),
                                     imgPhoto.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     imgPhoto.centerYAnchor.constraint(equalTo: centerYAnchor),
                                     imgPhoto.heightAnchor.constraint(equalToConstant: imgHeigth),
                                     imgPhoto.widthAnchor.constraint(equalToConstant: imgWidth),
                                     
                                     lblFullName.topAnchor.constraint(equalTo: imgPhoto.bottomAnchor,constant: 10),
                                     lblFullName.leadingAnchor.constraint(equalTo: imgPhoto.leadingAnchor, constant: 60),
                                     lblFullName.heightAnchor.constraint(equalToConstant: 40),
                                     lblFullName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)])
    }
}

