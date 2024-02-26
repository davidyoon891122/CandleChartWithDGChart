//
//  CandleModel.swift
//  SwiftUICandleChart
//
//  Created by Davidyoon on 2/22/24.
//

import Foundation

struct CandleModel: Identifiable {

    let id = UUID()
    let date: Date
    let open: Double
    let close: Double
    let low: Double
    let high: Double
    let volume: Int

}

extension CandleModel {

    static var items: [Self] {
        let today = Date()

        let calendar = Calendar.current

        var candleModels: [CandleModel] = []

        for index in 0...100 {
            let date = calendar.date(byAdding: .day, value: -index, to: today)
            let candleModel =  CandleModel(date: date ?? Date(), open: Double(Int.random(in: 3...8)), close: Double(Int.random(in: 3...8)), low: Double(Int.random(in: 0...3)), high: Double(Int.random(in: 8...10)), volume: Int.random(in: 1000...10000))

            candleModels.append(candleModel)
        }

        return candleModels.sorted(by: { $0.date > $1.date })
    }

    static var nextItems: [Self] {
        let today = Date()

        let calendar = Calendar.current

        var candleModels: [CandleModel] = []

        for index in 100...200 {
            let date = calendar.date(byAdding: .day, value: -index, to: today)
            let candleModel =  CandleModel(date: date ?? Date(), open: Double(Int.random(in: 3...8)), close: Double(Int.random(in: 3...8)), low: Double(Int.random(in: 0...3)), high: Double(Int.random(in: 8...10)), volume: Int.random(in: 1000...10000))

            candleModels.append(candleModel)
        }

        return candleModels.sorted(by: { $0.date > $1.date })
    }

}


