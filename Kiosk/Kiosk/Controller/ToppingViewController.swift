//
//  ToppingViewController.swift
//  Kiosk
//
//  Created by woong on 1/17/24.
//

import UIKit

class ToppingViewController: CommonViewController {

    let cheeseStore = CheeseStore()
    var cheeseCollectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    let cheeseButton = SandwichButton()
    
    var screenWidth = 0.0
    var screenHeight = 0.0
    
    override func setupView() {
        super.setupView()
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        
        cheeseCollectionView = {
            let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.itemSize = CGSize(width: screenWidth / 5.0, height: screenHeight / 3.0)
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = 80
            collectionViewLayout.minimumInteritemSpacing = 10
            let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.register(SandwichButton.self, forCellWithReuseIdentifier: cheeseButton.sandwichButtonID)
            return collectionView
        }()
        
        customNavigationBar.delegate = self
        customNavigationBar.title = "타이틀 테스트"
        cheeseCollectionView.backgroundColor = .systemGray6
        self.view.addSubview(cheeseCollectionView)
        
        cheeseCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cheeseCollectionView.topAnchor.constraint(equalTo: customNavigationBar.bottomAnchor, constant: 40),
            cheeseCollectionView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            cheeseCollectionView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 40),
            cheeseCollectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -40)
        ])
        
        cheeseCollectionView.delegate = self
        cheeseCollectionView.dataSource = self
        cheeseCollectionView.register(SandwichButton.self, forCellWithReuseIdentifier: cheeseButton.sandwichButtonID)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ToppingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cheeseStore.cheese.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = cheeseCollectionView.dequeueReusableCell(withReuseIdentifier: "SandwichButton", for: indexPath) as! SandwichButton
        
        cell.sandwichImageView.image = UIImage(named: "card")
        cell.sandwichTitle = cheeseStore.cheese[indexPath.row].korName
        cell.sandwichEngTitle = cheeseStore.cheese[indexPath.row].engName
        if let cal = cheeseStore.cheese[indexPath.row].cal {
            cell.sandwichCalTitle = String(cal) + "kcal"
        }
        
        
        return cell
    }
    
}

extension ToppingViewController: ChoiceButtonProtocol {
    func didTapButton() {
        
        print("버튼 눌림")
    }
    
    
}

extension ToppingViewController: CustomNavigationBarProtocol {
    func didTapHomeButton() {
        print("홈")
    }
    
    func didTapRightButton() {
        print("장바구니")
    }
    
    func didTapBackButton() {
        print("이전으로")
    }
    
}
