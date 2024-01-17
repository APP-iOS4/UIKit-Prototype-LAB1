//
//  ChoiceVegitableViewController.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class ChoiceVegitableViewController: CommonViewController {
    
    let sideBar = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func setupView() {
        super.setupView()
        
        // 네비게이션바 설정
        customNavigationBar.delegate = self
        customNavigationBar.title = "빵선택 > 토핑선택 > 야채선택 > 소스"
        
        // 사이드바 설정
        sideBar.backgroundColor = .init(named: "mainGreen")?.withAlphaComponent(0.65)
        
        // 야채선택 레이블
        let titleLabel: UILabel = {
            let titleLabel = UILabel()
            titleLabel.text = "야채 선택"
            titleLabel.font = .systemFont(ofSize: 30, weight: .regular)
            titleLabel.sizeToFit()
            return titleLabel
        }()
        
        // 컬렉션뷰 설정
        let collectionViewLayout: UICollectionViewLayout = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.scrollDirection = .vertical
            return collectionViewLayout
        }()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // 사이드바 테이블뷰
        let tableView: UITableView = {
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
        
        
        // MARK: AddSubView
        view.customAddSubView(sideBar)
        sideBar.customAddSubView(tableView)
        view.customAddSubView(titleLabel)
        view.customAddSubView(collectionView)
        
        
        // MARK: AutoLayout
        NSLayoutConstraint.activate([
            sideBar.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            sideBar.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            sideBar.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            sideBar.widthAnchor.constraint(equalToConstant: 326),
            
            tableView.topAnchor.constraint(equalTo: sideBar.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: sideBar.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: sideBar.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: sideBar.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 23),
            titleLabel.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 34),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            collectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: sideBar.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
        ])
    }

}

// MARK: - UICollectionView Delegate & DataSource
extension ChoiceVegitableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 0
    }
}

// MARK: - UITableView Delegate & DataSource
extension ChoiceVegitableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        7
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

// MARK: - CustomNavigationBar Delegate
extension ChoiceVegitableViewController: CustomNavigationBarProtocol {
    func didTapHomeButton() {
        print("didTap HomeButton")
    }
    
    func didTapRightButton() {
        print("didTap RightButton")
    }
    
    func didTapBackButton() {
        print("didTap BackButton")
    }
    
    
}
