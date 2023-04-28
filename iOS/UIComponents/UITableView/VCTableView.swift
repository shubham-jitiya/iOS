//
//  VCTableView.swift
//  iOS
//
//  Created by Shubham Jitiya on 27/04/23.
//

import UIKit

class VCTableView: UIViewController {
    // MARK: Variables
    var records = CompanyModel.getCompanyDetails()
    
    // MARK: IB outlets
    @IBOutlet weak private var tblContents: UITableView!
    @IBOutlet weak var viewTblHeader: UIView!
    @IBOutlet weak var lblTblHeader: UILabel!
    @IBOutlet var viewTblFooter: UIView!
    @IBOutlet weak var lblTblFooter: UILabel!
    
    // MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
    }
}


// MARK: Functions
extension VCTableView {
    private func initialise() {
        tblContents.delegate = self
        tblContents.dataSource = self
        initialiseTableHeader()
        initialiseTableFooter()
        registerCells()
    }
    private func initialiseTableHeader() {
        viewTblHeader.frame =  CGRect(
            x: 0,
            y: 0,
            width: tblContents.frame.size.width,
            height: 50)
        tblContents.tableHeaderView = viewTblHeader
    }
    private func initialiseTableFooter() {
        viewTblFooter.frame =  CGRect(
            x: 0,
            y: 0,
            width: tblContents.frame.size.width,
            height: 50)
        tblContents.tableFooterView = viewTblFooter
    }
    private func registerCells() {
        registerCell(table: tblContents, id: "IndexTableViewCell")
        registerCell(table: tblContents, id: "EvenTableViewCell")
        registerCell(table: tblContents, id: "CompanyTableViewCell")
    }
    private func registerCell(table: UITableView, id: String) {
        table.register(UINib(nibName: id, bundle: nil), forCellReuseIdentifier: id)
    }
}

// MARK: Data source
extension VCTableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return records.count
            //            if section == 0 {
            //                return 10
            //            } else if section == 2 {
            //                return records.count
            //            } else {
            //                return 4
            //            }
        }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let oddCell = tableView.dequeueReusableCell(
                withIdentifier: "IndexTableViewCell")
                    as? IndexTableViewCell else {
                return UITableViewCell()
            }
            guard let evenCell = tableView.dequeueReusableCell(
                withIdentifier: "EvenTableViewCell")
                    as? EvenTableViewCell else {
                return UITableViewCell()
            }
            guard let companyCell = tableView.dequeueReusableCell(
                withIdentifier: "CompanyTableViewCell")
                    as? CompanyTableViewCell else {
                return UITableViewCell()
            }
            let indexData = records[indexPath.row]
            companyCell.configCell(data: indexData)
            return companyCell
            //            if indexPath.row % 2 == 0 {
            //                evenCell.lblContent.text = "\(indexPath.row)"
            //                evenCell.backgroundColor = UIColor.orange
            //                return companyCell
            //            } else {
            //                let dummyText = NSAttributedString(
            //                    string: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
            //                    attributes: [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)])
            //                oddCell.lblIndex.attributedText = dummyText
            //                oddCell.backgroundColor = UIColor.red
            //                oddCell.lblIndex.textColor = UIColor.white
            //                return oddCell
            //            }
            //oddCell.lblIndex.text = "\(indexPath.row)"
        }
}

// MARK: Delegate methods
extension VCTableView: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
            print(indexPath.section)
            print(indexPath.row)
            print(indexPath)
            var selection = records[indexPath.row]
            selection.isSelected = !selection.isSelected
            records[indexPath.row] = selection
            tblContents.reloadData()
            // tableView.reload
            
        }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    
    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int) -> String? {
            print("Section title \(section)")
            return "Section: \(section)"
        }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int) -> UIView? {
            //        let sectionHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tblContents.frame.size.width, height: 40))
            //        sectionHeaderView.backgroundColor = UIColor(red: 0, green: 0, blue: 0.5, alpha: 0.8)
            return nil // sectionHeaderView
        }
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        "Footer section"
    }
}
