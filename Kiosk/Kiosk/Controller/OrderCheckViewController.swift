//
//  OrderCheckViewController.swift
//  Kiosk
//
//  Created by 박상현 on 1/18/24.
//

import UIKit

class OrderCheckViewController: CommonOrderViewController {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(CartListCell.self, forCellReuseIdentifier: CartListCell.identifier)
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func setupView() {
        super.setupView()
        
        print("ordercheck")
        
        customNavigationBar.title = "장바구니"
        sideBar.sideBarButton.setTitle("결제수단 선택", color: .init(named: "mainOrange"))

        view.customAddSubView(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: sideBar.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }
    
    override func didTapSideBarButtonOverride() {
//        super.didTapSideBarButtonOverride()
        print("결제수단 터치")
    }
}

extension OrderCheckViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CartListCell.identifier, for: indexPath) as? CartListCell else { return UITableViewCell() }
        cell.title = "하프 랍스터 & 하프 쉬림프"
        cell.subTitle = "Half Lobster & Half Shrimp"
        cell.highlightTitle = "284 kcal"
        cell.assetImage = "m01"
        return cell
    }
    
    
}
