//
//  ChoiceVegitableViewController.swift
//  Kiosk
//
//  Created by 박상현 on 1/17/24.
//

import UIKit

class ChoiceVegitableViewController: CommonOrderViewController {
    
    let vegitableStore = VegitableStore()
    
    var scrollView: UIScrollView = UIScrollView()
    var contentView: UIView = UIView()
    var titleLabel: UILabel = UILabel()
    var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupView() {
        super.setupView()
        
        currentStep = .choiceVegitable
        
        titleLabel = {
            let titleLabel = UILabel()
            titleLabel.text = "야채 선택"
            titleLabel.textColor = .black
            titleLabel.font = .systemFont(ofSize: 30, weight: .regular)
            titleLabel.sizeToFit()
            return titleLabel
        }()
        
        collectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = 40
            collectionViewLayout.minimumInteritemSpacing = 40
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.register(VegitableCell.self, forCellWithReuseIdentifier: VegitableCell.identifier)
            collectionView.backgroundColor = .clear
            collectionView.delegate = self
            collectionView.dataSource = self
            return collectionView
        }()
        
        view.customAddSubView(scrollView)
        scrollView.customAddSubView(contentView)
        contentView.customAddSubView(titleLabel)
        contentView.customAddSubView(collectionView)
        contentView.constraintEdge(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: sideBar.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 23),
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 34),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 34),
            collectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        
        // 사이드바 버튼 설정
        sideBar.sideBarButton.setTitle("다음", color: .init(named: "mainOrange"))
    }
    
    // 사이드바 버튼 클릭
    override func didTapSideBarButtonOverride() {
        navigationController?.pushViewController(SauceViewController(), animated: true)
    }
    
}

extension ChoiceVegitableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vegitableStore.vegitableArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VegitableCell.identifier, for: indexPath) as? VegitableCell else { return UICollectionViewCell() }
        let targetVegitable = vegitableStore.vegitableArray[indexPath.row]
        cell.vegitableTitle = "\(targetVegitable.name)"
        cell.vegitableEngTitle = "\(targetVegitable.engName)"
        cell.vegitableCalTitle = "\(targetVegitable.cal)"
        cell.vegitableImage = "\(targetVegitable.image)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 한줄에 표시할 데이터 셀 개수
        let columns: Int = 3
        // 셀의 여백
        let cellMargin: Int = 40
        // 셀의 행 개수
        let cellRows: Int = vegitableStore.vegitableArray.count / columns
        // 햔재 컬렉션뷰의 사이즈
        let collectionViewSize: CGSize = collectionView.frame.size
        // 셀의 가로 사이즈 설정 (컬렉션뷰의 사이즈에서 셀의 여백값을 뺀 후, 한 줄에 표시 될 셀의 개수를 나눔)
        let cellWidth: CGFloat = (collectionViewSize.width - CGFloat(cellMargin * (columns + 1))) / CGFloat(columns)
        // 셀의 높이 사이즈 설정 (가로 사이즈를 넘긴 더미 뷰로부터 높이값을 가져옴)
        let cellHeight: CGFloat = ThumbnailView.getDummyHeight(cellWidth, isHighlightTitle: true)
        // 컬렉션뷰의 높이 설정 (셀의 행의 개수와 셀의 높이, 각 여백 값을 더해줌)
        let collectionViewHeight: CGFloat = (cellHeight * CGFloat(cellRows)) + CGFloat(cellMargin * cellRows)
        // 컬렉션뷰의 높이 제약 설정
        collectionView.heightAnchor.constraint(equalToConstant: collectionViewHeight).isActive = true
 
        return CGSize(width: cellWidth, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 40, bottom: 40, right: 40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? VegitableCell else { return }
        
        cell.isSelect.toggle()
    }
    
}
