//
//  Setupable.swift
//  Navigation
//
//  Created by  Юлия Григорьева on 20.03.2022.
//

import Foundation

protocol ViewModelProtocol {}

protocol Setupable {
    func setup(with viewModel: ViewModelProtocol)
}
