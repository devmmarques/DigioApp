//
//  AlertViewModel.swift
//  DigioApp
//
//  Created by Marco Marques on 23/08/24.
//

import Foundation

enum AlertStatus {
    case success
    case warning
    case error
}
struct AlertViewModel {
    let status: AlertStatus
    let title: String
    let description: String
    let titlePrimaryButton: String
    let titleSecondaryButton: String?
    let actionPrimaryButton: (() -> Void)
    let actionSecondaryButton: (() -> Void)?
}
