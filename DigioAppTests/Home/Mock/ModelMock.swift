//
//  ModelMock.swift
//  DigioAppTests
//
//  Created by Marco Marques on 23/08/24.
//

import Foundation
@testable import DigioApp

struct ModelMock {
    
    static let spotlight = SpotlightModel(name: "Spotlight 1", bannerUrl: "https://www.digio.com.br/", description: "desc1")
    static let products = ProductModel(name: "Product 1", imageURL: "https://www.digio.com.br/", description: "desc1")
    static let cash = CashModel(title: "Cash 1", bannerUrl: "https://www.digio.com.br/", description: "desc1")
    
    static let listHome = ListHomeModel(spotlight: [spotlight], products: [products], cash: cash)
    
    
    static let spotlightResponse = SpotlightResponse(name: "Spotlight 1", bannerUrl: "https://www.digio.com.br/", description: "desc1")
    static let productResponse = ProductResponse(name: "Product 1", imageURL: "https://www.digio.com.br/", description: "desc1")
    static let cashResponse = CashResponse(title: "Cash 1", bannerUrl: "https://www.digio.com.br/", description: "desc1")
    
    static let homeResponse = HomeResponse(spotlight: [spotlightResponse], products: [productResponse], cash: cashResponse)
    
}

struct ModelMockScreenshoot {
    static let spotlight1 = SpotlightResponse(name: "Recarga",
                                              bannerUrl: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png",
                                              description: "Agora ficou mais fácil colocar créditos no seu celular! A digio Store traz a facilidade de fazer recargas... direto pelo seu aplicativo, com toda segurança e praticidade que você procura.")
    
    static let spotlight2 = SpotlightResponse(name: "Uber",
                                              bannerUrl: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png",
                                              description: "Dê um vale presente Uber para amigos e familiares, ou use os vales para adicionar créditos à sua conta. O app Uber conecta você a uma viagem confiável em apenas alguns minutos. Você pode escolher entre as opções econômicas ou Premium para viajar do seu jeito. O pagamento é fácil e sem complicações!")
    
    static let productResponse1 = ProductResponse(name: "XBOX",
                                                 imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/xbox_icon.png",
                                                 description: "Com o e-Gift Card Xbox você adquire créditos para comprar games, música, filmes, programas de TV e muito mais!")
    
    static let productResponse2 = ProductResponse(name: "Google Play",
                                                 imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/google_play_icon.png",
                                                 description: "O e-gift Google Play dá acesso a um mundo de entretenimento. É muito fácil encontrar algo que você goste, seja você um fã de música ou de filmes, livros, revistas, apps ou jogos. Com o e-gift Google Play, você não precisa de cartão de crédito e pode aproveitar o melhor do cinema, suas músicas favoritas e muito mais em smartphones e tablets Android, iOS e também no computador.")
    
    static let productResponse3 = ProductResponse(name: "Level up",
                                                 imageURL: "https://s3-sa-east-1.amazonaws.com/digio-exame/level_up_icon.png",
                                                 description: "Com o e-Gift Card Level Up você adquire créditos para jogar diversas opções de games, de MMORPGs a jogos de Tiro e Mobas! Para ver a lista de jogos e a quantia de créditos que pode resgatar em cada um deles, acesse: http://levelupgames.uol.com.br/levelup/seuegiftcard.lhtml")
    
    static let cashResponse = CashResponse(title: "digio Cash",
                                           bannerUrl: "https://s3-sa-east-1.amazonaws.com/digio-exame/cash_banner.png",
                                           description: "Dinheiro na conta sem complicação. Transfira parte do limite do seu cartão para sua conta.")
    
    static let homeResponse = HomeResponse(spotlight: [spotlight1, spotlight2], products: [productResponse1, productResponse2, productResponse3], cash: cashResponse)
}
