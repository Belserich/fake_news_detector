//
//  ResultsViewController.swift
//  Fake News Detector
//
//  Created by Adedayo Omosanya on 18/05/2019.
//  Copyright © 2019 Adedayo Omosanya. All rights reserved.
//

import UIKit
import Charts

class ResultsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var pieChartView: PieChartView!
    @IBOutlet weak var whyTableView: UITableView!
    @IBOutlet weak var whyLabel: UILabel!
    @IBOutlet weak var dislikeCount: UILabel!
    @IBOutlet weak var likeCount: UILabel!
    var percentage: Double?
    
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Results"
                
        let months = ["Jan", "Feb"]
        let unitsSold = [percentage, 1-percentage!]
        setChart(dataPoints: months, values: unitsSold as! [Double])
        
        whyTableView.tableFooterView = UIView()
        self.whyTableView.delegate = self
        self.whyTableView.dataSource = self
        
        whyLabel.attributedText = NSAttributedString(string: "Why?", attributes:
            [NSUnderlineStyleAttributeName: NSUnderlineStyle.styleSingle.rawValue])
        
        if (self.percentage! < 50.0) {
            self.resultLabel.text = "This article is most NOT likely fake news"
        } else {
            self.resultLabel.text = "This article is most likely fake news"

        }
        
    }
    
    func setChart(dataPoints: [String], values: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry1 = ChartDataEntry(x: Double(i), y: values[i], data: dataPoints[i] as AnyObject)
            
            dataEntries.append(dataEntry1)
        }
        let pieChartDataSet = PieChartDataSet(values: dataEntries, label:"")
        let pieChartData = PieChartData(dataSet: pieChartDataSet)
        self.pieChartView.data = pieChartData
        
        pieChartDataSet.colors = [UIColor.red,
        UIColor.green]
        pieChartView.legend.enabled = false
        let myAttribute = [ NSFontAttributeName: UIFont(name: "AvenirNext-Medium", size: 18.0)! ]
        let myAttrString = NSAttributedString(string: String(format: "%.1f", percentage! * 100
        ) + "%", attributes: myAttribute)
        pieChartView.centerAttributedText = myAttrString
        pieChartDataSet.drawValuesEnabled = false
        pieChartView.animate(yAxisDuration: 1)
        pieChartView.isUserInteractionEnabled = false
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "whyCell")!
        let imageView = cell.viewWithTag(100) as! UIImageView
        let textLabel = cell.viewWithTag(101) as! UILabel
        if indexPath.row == 0 {
            imageView.image = UIImage(named: "www")
            textLabel.text = "The source web address was flagged as a known fake news source"
        } else if indexPath.row == 1 {
            imageView.image = UIImage(named: "media")
            textLabel.text = "The media used in this article has appeared in old news articles"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }

    @IBAction func dislike(_ sender: Any) {
        self.performSegue(withIdentifier: "tags", sender: self)
    }
    
    @IBAction func like(_ sender: Any) {
      
    }
    
}
