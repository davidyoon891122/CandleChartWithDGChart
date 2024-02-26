//
//  ViewModel.swift
//  UIKitChartSample
//
//  Created by Jiwon Yoon on 2/26/24.
//

import Foundation
import RxSwift

protocol ViewModelInput {

    func requestChartData()

}

protocol ViewModelOutput {

    var chartDataPublishSubject: PublishSubject<[CandleModel]> { get }

}

protocol ViewModelType {

    var input: ViewModelInput { get }
    var output: ViewModelOutput { get }

}

final class ViewModel {

    var input: ViewModelInput { self }
    var output: ViewModelOutput { self }

    var chartDataPublishSubject: PublishSubject<[CandleModel]> = .init()

    private var currentIndex: Int = 0
    private var number: Int = 50

    private var chartModels: [CandleModel] = []



}


extension ViewModel: ViewModelType, ViewModelInput, ViewModelOutput {

    func requestChartData() {
        let chartModel = getChartModel(startIndex: currentIndex, number: number)
        
        self.chartModels.append(contentsOf: chartModel)

        self.chartModels.sort(by: { $0.date > $1.date })

        self.chartDataPublishSubject.onNext(self.chartModels)
        self.currentIndex += number

    }

}

private extension ViewModel {

    func getChartModel(startIndex: Int, number: Int) -> [CandleModel] {
        let today = Date()

        let calendar = Calendar.current

        var candleModels: [CandleModel] = []

        for index in startIndex...startIndex + number {
            let date = calendar.date(byAdding: .day, value: -index, to: today)
            let candleModel =  CandleModel(date: date ?? Date(), open: Double(Int.random(in: 3...8)), close: Double(Int.random(in: 3...8)), low: Double(Int.random(in: 0...3)), high: Double(Int.random(in: 8...10)), volume: Int.random(in: 1000...10000))

            candleModels.append(candleModel)
        }

        return candleModels.sorted(by: { $0.date > $1.date })
    }

}
