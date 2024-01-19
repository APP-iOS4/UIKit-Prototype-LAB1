//
//  LandingPageViewController.swift
//  Kiosk
//
//  Created by woong on 1/19/24.
//

import UIKit

class LandingPageViewController: UIViewController {

    var landingImageView = UIImageView()
    var label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buildInterface()
        setupGestureRecognizers()
    }
   
    func buildInterface() {
        let safeArea = self.view.safeAreaLayoutGuide
        
        landingImageView.image = UIImage(named: "LandingPage")
        landingImageView.contentMode = .scaleAspectFill
        landingImageView.translatesAutoresizingMaskIntoConstraints = false
        label = {
            let label = UILabel()
            label.text = "주문을 시작하려면 화면을 터치하세요."
            label.textAlignment = .center
            label.font = .systemFont(ofSize: 35, weight: .heavy)
            label.textColor = .white
            return label
        }()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(landingImageView)
        landingImageView.addSubview(label)
        
        NSLayoutConstraint.activate([
            landingImageView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            landingImageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
            landingImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            landingImageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            
            label.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor, constant: -20),
            label.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -20)
        ])
    }
    
    func setupGestureRecognizers() {
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
            self.view.addGestureRecognizer(tapGestureRecognizer)
        }
        
        @objc func handleTap() {
            let nextViewController = SandwichViewController()
//            nextViewController.modalPresentationStyle = .fullScreen
//            nextViewController.modalTransitionStyle = .flipHorizontal
//            self.present(nextViewController, animated: true, completion: nil)
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
}
