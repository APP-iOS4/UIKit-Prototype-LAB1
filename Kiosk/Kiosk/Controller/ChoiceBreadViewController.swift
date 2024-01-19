//
//  ChoiceBreadViewController.swift
//  Kiosk
//
//  Created by 기 표 on 1/17/24.
//

import UIKit

class ChoiceBreadViewController: CommonOrderViewController {
    
    let scrollView = UIScrollView()
    let contantView = UIView()
    
    let breadStore = BreadStore()
    var choiceBreadCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    var screenWidth = 0.0
    var screenHeight = 0.0
    
    let choice15cmButton = ChoiceButton()
    let choice30cmButton = ChoiceButton()
    let choiceSelectedButton = ChoiceButton()
    let choiceNotSelectedButton = ChoiceButton()
    let breadButton = BreadButton()
    
    let choiceCmLabel = UILabel()
    let choiceToastingLabel = UILabel()
    let choiceBreadLabel = UILabel()
    
    
    override func setupView() {
        super.setupView()
        
        // 사이드바 버튼 생성
        sideBar.sideBarButton.setTitle("다음", color: .init(named: "mainOrange"))
        
        currentStep = .choiceBread
        
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        
        choiceBreadCollectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = 40
            collectionViewLayout.minimumInteritemSpacing = 40
            choiceBreadCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(BreadButton.self, forCellWithReuseIdentifier: BreadButton.breadButtonID)
            collectionView.register(BreadCell.self, forCellWithReuseIdentifier: BreadCell.identifier)
            return collectionView
        }()
        
        
        choiceBreadCollectionView.backgroundColor = .systemGray6
        
        choiceCmLabel.text = "사이즈 선택"
        choiceCmLabel.textColor = .black
        choiceCmLabel.font = .systemFont(ofSize: 35, weight: .regular)

        
        
        choice15cmButton.buttonTitle = "15cm"
        choice15cmButton.isSelected = true
        choice15cmButton.delegate = self
        
        
        choice30cmButton.buttonTitle = "30cm"
        choice30cmButton.isSelected = false
        choice30cmButton.delegate = self
        
        choiceToastingLabel.text = "빵 토스팅"
        choiceToastingLabel.textColor = .black
        choiceToastingLabel.font = .systemFont(ofSize: 35, weight: .regular)
        
        choiceSelectedButton.buttonTitle = "선택"
        choiceSelectedButton.isSelected = true
        choiceSelectedButton.delegate = self

        choiceNotSelectedButton.buttonTitle = "미선택"
        choiceNotSelectedButton.isSelected = false
        choiceNotSelectedButton.delegate = self

        choiceBreadLabel.text = "빵 선택"
        choiceBreadLabel.textColor = .black
        choiceBreadLabel.font = .systemFont(ofSize: 35, weight: .regular)
        
        
        view.customAddSubView(scrollView)
        scrollView.customAddSubView(contantView)
        contantView.customAddSubView(choiceCmLabel)
        contantView.customAddSubView(choiceToastingLabel)
        contantView.customAddSubView(choiceBreadLabel)
        contantView.customAddSubView(choiceSelectedButton)
        contantView.customAddSubView(choiceNotSelectedButton)
        contantView.customAddSubView(choice15cmButton)
        contantView.customAddSubView(choice30cmButton)
        contantView.customAddSubView(choiceBreadCollectionView)
        
        
        choiceBreadCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            
            // 스크롤뷰
            scrollView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: sideBar.leadingAnchor),
            
            contantView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contantView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contantView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contantView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contantView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            // 사이즈 선택
            choiceCmLabel.centerYAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50),
            choiceCmLabel.centerXAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 110),
            
            // 15cm
            choice15cmButton.centerYAnchor.constraint(equalTo: scrollView.topAnchor, constant: 130),
            choice15cmButton.centerXAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 200),
            choice15cmButton.widthAnchor.constraint(equalToConstant: 343),
            choice15cmButton.heightAnchor.constraint(equalToConstant: 83),
            
            // 30cm
            choice30cmButton.centerYAnchor.constraint(equalTo: scrollView.topAnchor, constant: 130),
            choice30cmButton.leadingAnchor.constraint(equalTo: choice15cmButton.trailingAnchor, constant: 25),
            choice30cmButton.widthAnchor.constraint(equalToConstant: 343),
            choice30cmButton.heightAnchor.constraint(equalToConstant: 83),
            
            // 빵 토스팅
            choiceToastingLabel.topAnchor.constraint(equalTo: choice15cmButton.bottomAnchor, constant: 33),
            choiceToastingLabel.centerXAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 98),
            
            // 선택
            choiceSelectedButton.topAnchor.constraint(equalTo: choice15cmButton.bottomAnchor, constant: 90),
            choiceSelectedButton.centerXAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 200),
            choiceSelectedButton.widthAnchor.constraint(equalToConstant: 343),
            choiceSelectedButton.heightAnchor.constraint(equalToConstant: 83),
            
            // 미선택
            choiceNotSelectedButton.topAnchor.constraint(equalTo: choice30cmButton.bottomAnchor, constant: 90),
            choiceNotSelectedButton.leadingAnchor.constraint(equalTo: choiceSelectedButton.trailingAnchor, constant: 25),
            choiceNotSelectedButton.widthAnchor.constraint(equalToConstant: 343),
            choiceNotSelectedButton.heightAnchor.constraint(equalToConstant: 83),
            
            // 빵 토스팅
            choiceBreadLabel.topAnchor.constraint(equalTo: choiceSelectedButton.bottomAnchor, constant: 33),
            choiceBreadLabel.centerXAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 81),
            
            // 빵
            choiceBreadCollectionView.topAnchor.constraint(equalTo: choiceSelectedButton.bottomAnchor, constant: 90),
            choiceBreadCollectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            choiceBreadCollectionView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            choiceBreadCollectionView.trailingAnchor.constraint(equalTo: sideBar.leadingAnchor),
            
        ])
        
        choiceBreadCollectionView.delegate = self
        choiceBreadCollectionView.dataSource = self
        choiceBreadCollectionView.register(BreadButton.self, forCellWithReuseIdentifier: BreadButton.breadButtonID)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 사이드바 버튼 실행 함수
    override func didTapSideBarButtonOverride() {
        navigationController?.pushViewController(ToppingViewController(), animated: true)
    }
    
}
extension ChoiceBreadViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return breadStore.bread.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = choiceBreadCollectionView.dequeueReusableCell(withReuseIdentifier: BreadCell.identifier, for: indexPath) as? BreadCell else { return UICollectionViewCell() }
        
        
        cell.thumbnailView.thumbnailImageView.image = UIImage(named: "b0" + String(indexPath.row + 1))
        cell.breadTitle = breadStore.bread[indexPath.row].breadTitle
        cell.breadEngTitle = breadStore.bread[indexPath.row].breadEngTitle
        cell.breadCalTitle = String(breadStore.bread[indexPath.row].breadKcalTitle)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? BreadCell else { return }
        cell.isSelect.toggle()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let collectionViewWidth = collectionView.frame.width
        let cellWidth = (collectionViewWidth - 160) / 3
        
        let cellHeight = ThumbnailView.getDummyHeight(cellWidth, isHighlightTitle: true)
        
        
        choiceBreadCollectionView.heightAnchor.constraint(equalToConstant: (cellHeight * 2) + 80).isActive = true
        
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40)
    }
    
}
/*
 let choice15cmButton = ChoiceButton()
 let choice30cmButton = ChoiceButton()
 let choiceSelectedButton = ChoiceButton()
 let choiceNotSelectedButton = ChoiceButton()
 */
extension ChoiceBreadViewController: ChoiceButtonProtocol {
    func didTapButton(_ sender: ChoiceButton) {
        switch sender {
        case choice15cmButton:
            choice15cmButton.isSelected = true
            choice30cmButton.isSelected = false
        case choice30cmButton:
            choice30cmButton.isSelected = true
            choice15cmButton.isSelected = false
        case choiceSelectedButton:
            choiceSelectedButton.isSelected = true
            choiceNotSelectedButton.isSelected = false
        case choiceNotSelectedButton:
            choiceNotSelectedButton.isSelected = true
            choiceSelectedButton.isSelected = false
        default: break
        }
    }
}
