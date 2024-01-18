//
//  SauceViewController.swift
//  Kiosk
//
//  Created by Woo Sung jong on 1/17/24.
//

import UIKit

class SauceViewController: CommonViewController {

    let sauceStore = SauceStore()
    let cookieStore = CookieStore()
    
    var sauceCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    var cookieCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    let sauceButton = SandwichButton()
    let cookieButton = SandwichButton()
    
    var sauceLabel = UILabel()
    var setLabel = UILabel()
    var cookieLabel = UILabel()
    
    var setSingle = ChoiceButton()
    var setCookie = ChoiceButton()
    
    var screenWidth = 0.0
    var screenHeight = 0.0
    
    override func setupView() {
        super.setupView()
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        sauceLabel = {
            let label = UILabel()
            label.text = "소스 선택"
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 30, weight: .regular)
            return label
        }()
        
        sauceCollectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.itemSize = CGSize(width: screenWidth / 5.0, height: screenHeight / 3.0)
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = 80
            collectionViewLayout.minimumInteritemSpacing = 10
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(SandwichButton.self, forCellWithReuseIdentifier: sauceButton.sandwichButtonID)
            return collectionView
        }()
        
        customNavigationBar.title = "소스 테스트"
        sauceCollectionView.backgroundColor = .systemGray6
        self.view.addSubview(sauceCollectionView)
        self.view.addSubview(sauceLabel)
        
        sauceLabel.translatesAutoresizingMaskIntoConstraints = false
        sauceCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        setLabel = {
            let label = UILabel()
            label.text = "세트 선택"
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 30, weight: .regular)
            return label
        }()
        
        setSingle = {
            let label = ChoiceButton()
            label.buttonLabel.text = "단품"
            return label
        }()
        
        setCookie = {
            let label = ChoiceButton()
            label.buttonLabel.text = "쿠키세트(음료포함)"
            return label
        }()
        
        self.view.addSubview(setLabel)
        self.view.addSubview(setSingle)
        self.view.addSubview(setCookie)
//        setLabel.translatesAutoresizingMaskIntoConstraints = false
//        setSingle.translatesAutoresizingMaskIntoConstraints = false
//        setCookie.translatesAutoresizingMaskIntoConstraints = false
        
        cookieLabel = {
            let label = UILabel()
            label.text = "쿠키 선택"
            label.textAlignment = .left
            label.font = .systemFont(ofSize: 30, weight: .regular)
            return label
        }()
        
        cookieCollectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.itemSize = CGSize(width: screenWidth / 5.0, height: screenHeight / 3.0)
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = 80
            collectionViewLayout.minimumInteritemSpacing = 10
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(SandwichButton.self, forCellWithReuseIdentifier: cookieButton.sandwichButtonID)
            return collectionView
        }()
        
        cookieCollectionView.backgroundColor = .systemGray6
        self.view.addSubview(cookieCollectionView)
        self.view.addSubview(cookieLabel)
//        cookieLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sauceLabel.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 34),
            sauceLabel.bottomAnchor.constraint(equalTo: sauceCollectionView.topAnchor, constant: -10),
            sauceLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 23),
            sauceLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40),
            
            sauceCollectionView.topAnchor.constraint(equalTo: sauceLabel.bottomAnchor, constant: 25),
            sauceCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            sauceCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40),
            sauceCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40),
            
//            setLabel.topAnchor.constraint(equalTo: sauceCollectionView.bottomAnchor, constant: 34),
//            setLabel.bottomAnchor.constraint(equalTo: cookieLabel.topAnchor, constant: -11),
//            setLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 23),
//            setLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40),
            
//            setSingle.topAnchor.constraint(equalTo: setLabel.bottomAnchor, constant: 11),
//            setSingle.bottomAnchor.constraint(equalTo: cookieLabel.topAnchor, constant: -11),
//            setSingle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 23),
            
//            setCookie.topAnchor.constraint(equalTo: setLabel.bottomAnchor, constant: 11),
//            setCookie.bottomAnchor.constraint(equalTo: cookieLabel.topAnchor, constant: -11),
//            setCookie.leadingAnchor.constraint(equalTo: setSingle.leadingAnchor, constant: 23),
//            setCookie.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40),
           
//            cookieLabel.topAnchor.constraint(equalTo: setLabel.bottomAnchor, constant: 51),
//            cookieLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
//            cookieLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 23),
//            cookieLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40),
//            
        ])
        
        
        sauceCollectionView.delegate = self
        sauceCollectionView.dataSource = self
        sauceCollectionView.register(SandwichButton.self, forCellWithReuseIdentifier: sauceButton.sandwichButtonID)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}

extension SauceViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return sauceStore.sauces.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = sauceCollectionView.dequeueReusableCell(withReuseIdentifier: "SandwichButton", for: indexPath) as! SandwichButton
        
        cell.sandwichImageView.image = UIImage(named: "card")
        cell.sandwichTitle = sauceStore.sauces[indexPath.row].korName
        cell.sandwichEngTitle = sauceStore.sauces[indexPath.row].engName
        if let cal = sauceStore.sauces[indexPath.row].cal {
            cell.sandwichCalTitle = String(cal) + "kcal"
        }
        
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        navigationController?.pushViewController(OrderCompleteViewController(), animated: true)
    }
    
}

extension SauceViewController: ChoiceButtonProtocol {
    func didTapButton() {
        
        print("버튼 눌림")
    }
    
    
}
