//
//  SideBar.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class SideBar: UIView {
    var tableView: UITableView = UITableView()
    let sideBarButton: SideBarButton = SideBarButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let containerView: UIView = {
            let containerView = UIView()
            containerView.backgroundColor = .init(named: "mainGreen")?.withAlphaComponent(0.65)
            return containerView
        }()
        
        // 사이드바 테이블뷰
        tableView = {
            let tableView = UITableView()
            tableView.register(OrderListCell.self, forCellReuseIdentifier: OrderListCell.identifier)
            tableView.rowHeight = UITableView.automaticDimension
            tableView.separatorStyle = .none
            tableView.backgroundColor = .clear
            tableView.sectionHeaderTopPadding = .zero
            tableView.delegate = self
            tableView.dataSource = self
            return tableView
        }()
        
        customAddSubView(containerView)
        containerView.customAddSubView(tableView)
        containerView.customAddSubView(sideBarButton)
        
        containerView.constraintEdge(self)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: containerView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: sideBarButton.topAnchor),
            
            sideBarButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            sideBarButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            sideBarButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            sideBarButton.heightAnchor.constraint(equalToConstant: 65)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SideBar: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: OrderListCell.identifier, for: indexPath) as? OrderListCell else { return UITableViewCell() }
        // 셀 선택 효과 제거
        cell.selectionStyle = .none
        
        switch indexPath.row {
        case 0:
            cell.orderTitle = "사이즈"
            cell.orderList = "15cm"
        case 1:
            cell.orderTitle = "빵종류"
            cell.orderList = "플랫브레드(토스팅)"
        case 2:
            cell.orderTitle = "치즈"
            cell.orderList = "슈레드 치즈"
        case 3:
            cell.orderTitle = "추가 토핑"
            cell.orderList = "미트추가, 아보카도, 페퍼로니, 에그마요"
        case 4:
            cell.orderTitle = "야채"
            cell.orderList = "양상추, 할라피뇨, 토마토, 올리브"
        case 5:
            cell.orderTitle = "소스"
            cell.orderList = "스위트 어니언, 핫 칠리"
        case 6:
            cell.orderTitle = "세트 선택"
            cell.orderList = "쿠키세트 (음료포함), 라즈베리 치즈케익"
        default:
            break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: UIView = {
            let headerView = UIView()
            headerView.backgroundColor = .init(named: "mainOrange")
            return headerView
        }()
        
        let productLabel: UILabel = {
            let productLabel = UILabel()
            productLabel.textColor = .black
            productLabel.font = .systemFont(ofSize: 27, weight: .bold)
            productLabel.text = "하프 랍스터 & 하프 쉬림프"
            productLabel.textAlignment = .center
            return productLabel
        }()
        
        headerView.customAddSubView(productLabel)
        
        NSLayoutConstraint.activate([
            productLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            productLabel.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            productLabel.topAnchor.constraint(equalTo: headerView.topAnchor),
            productLabel.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 65
    }
    
}
