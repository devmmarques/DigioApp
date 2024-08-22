//
//  UIImageView+Extensions.swift
//  DigioApp
//
//  Created by Marco Marques on 21/08/24.
//

import UIKit

extension UIImageView {
    
    private static var networkService: DigioBaseService = {
        return DigioBaseService()
    }()
    
    func setImageDownload(url: String) {
        print(url)
        guard let baseUrl = URL(string: url) else { return }
        
        let request = ImageRequest(baseURL: baseUrl)
        UIImageView.networkService.fetchData(request: request) { result in
            switch result {
            case .success(let data):
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                } else {
                    // Lidar com erro de imagem inválida
                    NSLog("Erro: Não foi possível criar uma imagem a partir dos dados.")
                }
            case .failure(let error):
                NSLog("Erro ao realizar download da image: ", error.localizedDescription)
            }
        }

    }
    
    static func configureNetworkService(_ service: DigioBaseService) {
        networkService = service
    }
    
    func load(url: String) {
        guard let baseUrl = URL(string: url) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: baseUrl) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}



struct ImageRequest: RequestProtocol {
    var baseURL: URL
    var path: String { return ""}
    var method: HTTPMethod { return .get }
    var headers: [String: String]? { return nil }
    var body: Data? { return nil }
}
