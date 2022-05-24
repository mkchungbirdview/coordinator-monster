//
//  SomeView.swift
//  CoordinatorExample
//
//  Created by Minki Chung on 2022/05/23.
//  Copyright © 2022 William Pompei. All rights reserved.
//

import UIKit


import RxCocoa
import RxSwift

class SomeView: UIView {
    lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("This is Detail", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    let disposeBag = DisposeBag()

    override init(frame: CGRect) {
        super.init(frame: frame)
        print("init some view")
        setup()
        setupRx()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var viewModel: SomeViewModel?

    func configure(viewModel: SomeViewModel) {
        self.viewModel = viewModel
    }

    func setup() {

        backgroundColor = .red
        addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: button.topAnchor),
            bottomAnchor.constraint(equalTo: button.bottomAnchor),
            leadingAnchor.constraint(equalTo: button.leadingAnchor),
            trailingAnchor.constraint(equalTo: button.trailingAnchor),
        ])
        button.setTitle("BUT", for: .normal)
    }
    private func setupRx() {
        button.rx.tapGesture()
            .when(.recognized)
            .compactMap { [weak self] _ in
                self?.viewModel?.someData
            }
            .subscribe(onNext: { data in
                print("data: \(data)")
            })
            .disposed(by: disposeBag)
    }
}
