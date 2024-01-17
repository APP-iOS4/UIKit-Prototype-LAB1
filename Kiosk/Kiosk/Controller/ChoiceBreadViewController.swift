//
//  ChoiceBreadViewController.swift
//  Kiosk
//
//  Created by 기 표 on 1/17/24.
//

import UIKit

class ChoiceBreadViewController: CommonViewController {
    
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
        
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        choiceBreadCollectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.itemSize = CGSize(width: screenWidth / 5.0, height: screenHeight / 3.0)
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = 80
            collectionViewLayout.minimumInteritemSpacing = 10
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
                collectionView.translatesAutoresizingMaskIntoConstraints = false
                collectionView.register(BreadButton.self, forCellWithReuseIdentifier: breadButton.breadButtonID)
                return collectionView
            }()

        
        customNavigationBar.delegate = self
        customNavigationBar.title = "빵 선택"
        
        choiceBreadCollectionView.backgroundColor = .systemGray6
        
        choiceCmLabel.text = "사이즈 선택"
        choiceCmLabel.textColor = .black
        choiceCmLabel.font = .systemFont(ofSize: 35, weight: .regular)
        
        choice15cmButton.buttonTitle = "15cm"
        choice15cmButton.isSelected = true
        
        choice30cmButton.buttonTitle = "30cm"
        choice30cmButton.isSelected = false
        
        choiceToastingLabel.text = "빵 토스팅"
        choiceToastingLabel.textColor = .black
        choiceToastingLabel.font = .systemFont(ofSize: 35, weight: .regular)
        
        choiceSelectedButton.buttonTitle = "선택"
        choiceSelectedButton.isSelected = true
        
        choiceNotSelectedButton.buttonTitle = "미선택"
        choiceNotSelectedButton.isSelected = false
        
        choiceBreadLabel.text = "빵 선택"
        choiceBreadLabel.textColor = .black
        choiceBreadLabel.font = .systemFont(ofSize: 35, weight: .regular)
        
        view.customAddSubView(choiceCmLabel)
        view.customAddSubView(choiceToastingLabel)
        view.customAddSubView(choiceBreadLabel)
        view.customAddSubView(choiceSelectedButton)
        view.customAddSubView(choiceNotSelectedButton)
        view.customAddSubView(choice15cmButton)
        view.customAddSubView(choice30cmButton)
        view.customAddSubView(choiceBreadCollectionView)
        
        choiceBreadCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            // 사이즈 선택
            choiceCmLabel.centerYAnchor.constraint(equalTo: safeArea.topAnchor, constant: 141),
            choiceCmLabel.centerXAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 110),
            
            // 15cm
            choice15cmButton.centerYAnchor.constraint(equalTo: safeArea.topAnchor, constant: 220),
            choice15cmButton.centerXAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 200),
            choice15cmButton.widthAnchor.constraint(equalToConstant: 343),
            choice15cmButton.heightAnchor.constraint(equalToConstant: 83),
            
            // 30cm
            choice30cmButton.centerYAnchor.constraint(equalTo: safeArea.topAnchor, constant: 220),
            choice30cmButton.leadingAnchor.constraint(equalTo: choice15cmButton.trailingAnchor, constant: 25),
            choice30cmButton.widthAnchor.constraint(equalToConstant: 343),
            choice30cmButton.heightAnchor.constraint(equalToConstant: 83),
            
            // 빵 토스팅
            choiceToastingLabel.topAnchor.constraint(equalTo: choice15cmButton.bottomAnchor, constant: 33),
            choiceToastingLabel.centerXAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 98),
            
            // 선택
            choiceSelectedButton.topAnchor.constraint(equalTo: choice15cmButton.bottomAnchor, constant: 90),
            choiceSelectedButton.centerXAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 200),
            choiceSelectedButton.widthAnchor.constraint(equalToConstant: 343),
            choiceSelectedButton.heightAnchor.constraint(equalToConstant: 83),
            
            // 미선택
            choiceNotSelectedButton.topAnchor.constraint(equalTo: choice30cmButton.bottomAnchor, constant: 90),
            choiceNotSelectedButton.leadingAnchor.constraint(equalTo: choiceSelectedButton.trailingAnchor, constant: 25),
            choiceNotSelectedButton.widthAnchor.constraint(equalToConstant: 343),
            choiceNotSelectedButton.heightAnchor.constraint(equalToConstant: 83),
            
            // 빵 토스팅
            choiceBreadLabel.topAnchor.constraint(equalTo: choiceSelectedButton.bottomAnchor, constant: 33),
            choiceBreadLabel.centerXAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 81),
            
            // 빵
            choiceBreadCollectionView.topAnchor.constraint(equalTo: choiceSelectedButton.bottomAnchor, constant: 90),
            choiceBreadCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            choiceBreadCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            choiceBreadCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
        ])
        
        choiceBreadCollectionView.delegate = self
        choiceBreadCollectionView.dataSource = self
        choiceBreadCollectionView.register(BreadButton.self, forCellWithReuseIdentifier: breadButton.breadButtonID)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
extension ChoiceBreadViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return breadStore.bread.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell =             choiceBreadCollectionView.dequeueReusableCell(withReuseIdentifier: "BreadButton", for: indexPath) as! BreadButton
        
        cell.breadImageView.image = UIImage(named: "\(breadStore.bread[indexPath.row].breadEngTitle)")
        cell.breadTitle = breadStore.bread[indexPath.row].breadTitle
        cell.breadEngTitle = breadStore.bread[indexPath.row].breadEngTitle
        cell.breadKcalTitle = String(breadStore.bread[indexPath.row].breadKcalTitle)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = choiceBreadCollectionView.cellForItem(at: indexPath) as! BreadButton
        cell.isSelect.toggle()
    }
}

extension ChoiceBreadViewController: CustomNavigationBarProtocol {
    func didTapHomeButton() {
        print("홈")
    }
    
    func didTapRightButton() {
        print("장바구니")
    }
    
    func didTapBackButton() {
        print("이전")
    }
}
