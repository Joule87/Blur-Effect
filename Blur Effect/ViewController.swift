//
//  ViewController.swift
//  Blur Effect
//
//  Created by Julio Collado on 4/21/20.
//  Copyright © 2020 julio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let animalNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.init(name: "Arial", size: 45)
        label.textAlignment = .center
        label.text = "Mandarin Duck"
        return label
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "mandarin_duck"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let slider: UISlider = {
        let slider = UISlider()
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.addTarget(self, action: #selector(handleSliderChange), for: .valueChanged)
        return slider
    }()
    
    let animator = UIViewPropertyAnimator(duration: 0.5, curve: .linear)
    let effectView: UIVisualEffectView = {
        let effectView = UIVisualEffectView(effect: nil)
        effectView.translatesAutoresizingMaskIntoConstraints = false
        return effectView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupImageView()
        setupBlurEffect()
        setupSlider()
        setupLabelName()
        addAnimation()
    }
    
    private func setupLabelName() {
        view.addSubview(animalNameLabel)
        NSLayoutConstraint.activate([animalNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
                                     animalNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                                     animalNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)])
    }
    
    private func addAnimation() {
        animator.addAnimations {
            self.imageView.transform = CGAffineTransform(scaleX: 4, y: 4)
            self.effectView.transform = self.imageView.transform
            self.effectView.effect = UIBlurEffect(style: .regular)
        }
    }
    
    private func setupBlurEffect() {
        view.addSubview(effectView)
        NSLayoutConstraint.activate([effectView.topAnchor.constraint(equalTo: imageView.topAnchor),
                                     effectView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor),
                                     effectView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
                                     effectView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)])
    }
    
    fileprivate func setupImageView() {
        view.addSubview(imageView)
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    private func setupSlider() {
        view.addSubview(slider)
        NSLayoutConstraint.activate([slider.topAnchor.constraint(equalTo: imageView.bottomAnchor),
                                     slider.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
                                     slider.trailingAnchor.constraint(equalTo: imageView.trailingAnchor)])
        
    }
    
    @objc func handleSliderChange() {
        animator.fractionComplete = CGFloat(slider.value)
    }
    
}

