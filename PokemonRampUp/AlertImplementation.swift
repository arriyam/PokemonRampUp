//
//  AlertImplementation.swift
//  PokemonRampUp
//
//  Created by Thushen Mohanarajah on 2023-03-06.
//

import Foundation
import UIKit

protocol AlertActionDelegate: AnyObject {
    func actionOne()
    func actionTwo()
}

class AlertImplementation: AlertFactoryService {
    weak var delegate: AlertActionDelegate?
    
    func build(alertData: AlertView) -> UIViewController {
        let vc = UIAlertController(title: alertData.title,
                                   message: alertData.message,
                                   preferredStyle: alertData.style)
        
        if alertData.enableOkAction {
            let actionOne = UIAlertAction(
                           title: alertData.okActionTitle,
                           style: alertData.okActionStyle)
            self.delegate?.actionOne()
            vc.addAction(actionOne)
        }
        
        if alertData.enableCancelAction {
            let actionTwo = UIAlertAction(
                               title: alertData.cancelActionTitle,
                               style: alertData.cancelActionStyle)
           self.delegate?.actionTwo()
            vc.addAction(actionTwo)
        }
        return vc
    }
}
