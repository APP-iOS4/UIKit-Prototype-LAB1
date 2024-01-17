//
//  OrderListCell.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class OrderListCell: UITableViewCell {

    static let identifier: String = "orderListCell"
    
    var orderTitle: String = "" {
        didSet {
            orderTitleLabel.text = orderTitle
        }
    }
    
    var orderList: String = "" {
        didSet {
            orderListLabel.text = orderList
        }
    }
    
    let orderTitleLabel: UILabel = UILabel()
    let orderListLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        
        
        orderTitleLabel.font = .systemFont(ofSize: 27, weight: .bold)
        orderTitleLabel.textColor = .white
        
        orderListLabel.font = .systemFont(ofSize: 25, weight: .regular)
        orderListLabel.textColor = .white
        orderListLabel.numberOfLines = 0
        
        let dividerView = UIView()
        dividerView.backgroundColor = .white
        
        customAddSubView(orderTitleLabel)
        customAddSubView(orderListLabel)
        customAddSubView(dividerView)
        
        NSLayoutConstraint.activate([
            orderTitleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            orderTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            orderTitleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            
            orderListLabel.leadingAnchor.constraint(equalTo: orderTitleLabel.leadingAnchor),
            orderListLabel.trailingAnchor.constraint(equalTo: orderTitleLabel.trailingAnchor),
            orderListLabel.topAnchor.constraint(equalTo: orderTitleLabel.bottomAnchor, constant: 11),
            orderListLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            dividerView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            dividerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            dividerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -25),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        orderTitle = ""
        orderList = ""
    }
}
