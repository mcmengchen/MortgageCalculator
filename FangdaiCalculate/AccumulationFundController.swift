//
//  AccumulationFundController.swift
//  FangdaiCalculate
//
//  Created by william on 16/5/11.
//  Copyright © 2016年 Roobo. All rights reserved.
//

import UIKit

class AccumulationFundController: UIViewController,UITableViewDataSource,UITableViewDelegate  {
    var table :UITableView?
    var dataSource:NSMutableArray?
    var sectionOneData = ["贷款金额(万元)","贷款期限(年)","还款日期(年月)","贷款利率","还款方式"]
    var sectionTwoData = ["累计支付利息(元)","累计还款总额(元)"]
    var totalInterest = 0
    var totalMoney = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.table = UITableView(frame: self.view.frame,style: UITableViewStyle.Plain)
        self.table?.backgroundColor = UIColor.redColor()
        self.table?.delegate = self
        self.table?.dataSource = self
        self.view.addSubview(self.table!)
        self.table?.registerNib(UINib.init(nibName: "FundCell", bundle: nil), forCellReuseIdentifier: "a")
        // Do any additional setup after loading the view.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0{
            return 5
        }else if section == 1{
            return 2
        }
        else{
            //            return (self.dataSource?.count)!
            return 0
        }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier="a";
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier) as! FundCell!
        if(cell == nil){
            cell=FundCell(style: UITableViewCellStyle.Value1, reuseIdentifier: identifier);
        }
        if(indexPath.section == 0 ){
            cell?.textLab.text = self.sectionOneData[indexPath.row]
            if indexPath.row<4 {
                cell.type = .cellTypeInput
            }else{
                cell.type = .cellTypeSwich

            }
        }else if(indexPath.section == 1){
            cell.textLab.text = self.sectionTwoData[indexPath.row]
            cell.type = .cellTypeInfo
            if indexPath.row==0 {
                cell.detailLab.text = NSString.localizedStringWithFormat("%d", self.totalInterest) as String
            }else{
                cell.detailLab.text = NSString.localizedStringWithFormat("%d", self.totalMoney) as String
            }
        }

        
        
        
        return cell!;
        
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
