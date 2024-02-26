//
//  ViewController.swift
//  UIKitChartSample
//
//  Created by Jiwon Yoon on 2/26/24.
//

import UIKit
import SnapKit
import DGCharts
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Chart"
        label.textColor = .purple
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .center

        return label
    }()

    private lazy var candleChart: CandleStickChartView = {
        let chartView = CandleStickChartView()

        return chartView
    }()

    private lazy var containerView: UIView = {
        let view = UIView()

        [
            titleLabel,
            candleChart
        ]
            .forEach {
                view.addSubview($0)
            }

        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16.0)
            $0.leading.equalToSuperview().offset(16.0)
            $0.trailing.equalToSuperview().offset(-16.0)
        }

        candleChart.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16.0)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalTo(titleLabel)
            $0.height.equalTo(300)
        }

        return view
    }()

    private var disposeBag = DisposeBag()

    private var viewModel: ViewModelType

    init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        bindViewModel()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.input.requestChartData()
    }

}

private extension ViewController {

    func setupViews() {
        view.backgroundColor = .systemBackground

        [
            containerView
        ]
            .forEach {
                view.addSubview($0)
            }

        containerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

    }

    func bindViewModel() {
        viewModel.output.chartDataPublishSubject
            .subscribe(onNext: { [weak self] chartData in
                self?.setChartData(data: chartData)
            })
            .disposed(by: disposeBag)
    }


    func setChartData(data: [CandleModel]) {
        let candleData = data.enumerated().map {
            CandleChartDataEntry(x: Double($0), shadowH: $1.high, shadowL: $1.low, open: $1.open, close: $1.close)
        }

        let dataSet = CandleChartDataSet(entries: candleData, label: "")
        
        dataSet.shadowColorSameAsCandle = true
        dataSet.increasingFilled = true
        dataSet.decreasingFilled = true
        dataSet.increasingColor = .red
        dataSet.decreasingColor = .blue
        dataSet.label = nil
        dataSet.form = .none
        dataSet.drawValuesEnabled = true

        let dateSet = data.map {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yy.MM.dd"
            return dateFormatter.string(from: $0.date)
        }

        candleChart.data = CandleChartData(dataSet: dataSet)

        candleChart.setVisibleXRangeMaximum(20.0)
        candleChart.drawMarkers = false
        candleChart.xAxis.labelPosition = .bottom
        candleChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: dateSet)
        candleChart.xAxis.setLabelCount(5, force: false)

    }

}


#Preview {
    ViewController(viewModel: ViewModel())
}

