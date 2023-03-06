//
//  AlertFactoryService.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-03-06.
//

import Foundation
import UIKit

protocol AlertFactoryService {
    var delegate: AlertActionDelegate? { get set }
    func build(alertData: AlertViewModel) -> UIViewController
}
