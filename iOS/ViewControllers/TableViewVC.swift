//
//  VCTableView.swift
//  iOS
//
//  Created by Shubham Jitiya on 27/04/23.
//

import UIKit

class TableViewVC: UIViewController {
    // MARK: Variables
    var recordsSection_1: [Company] = []
    var recordsSection_2: [Company] = []
    var recordsSection_3: [Company] = []
    
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

// MARK: IB actions
extension TableViewVC {
    @IBAction func btnSubmit(_ sender: UIButton) {
        // print(records.filter{ $0.isSelected == true }.count)
    }
}

// MARK: Functions
extension TableViewVC {
    private func initialise() {
        tblContents.delegate = self
        tblContents.dataSource = self
        recordsSection_1 = Company.getCompanyDetails()
        recordsSection_2 = Company.getCompanyDetails()
        recordsSection_3 = Company.getCompanyDetails()
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
        registerCell(table: tblContents, id: "CompanyTableViewCell")
        registerCell(table: tblContents, id: "CustomSectionHeaderView")
        tblContents.register(
            UINib(nibName: "CustomSectionHeaderView", bundle: nil),
            forHeaderFooterViewReuseIdentifier: "CustomSectionHeaderView")
    }
    
    private func registerCell(table: UITableView, id: String) {
        table.register(UINib(nibName: id, bundle: nil), forCellReuseIdentifier: id)
        
    }
}

// MARK: Data source
extension TableViewVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            switch section {
            case 0:
                return recordsSection_1.count
            case 1:
                return recordsSection_2.count
            case 2:
                return recordsSection_3.count
            default:
                return 0
            }
        }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
            switch indexPath.section {
            case 0:
                guard let companyCell = tableView.dequeueReusableCell(
                    withIdentifier: "CompanyTableViewCell")
                        as? CompanyTableViewCell else {
                    return UITableViewCell()
                }
                let indexData = recordsSection_1[indexPath.row]
                companyCell.configCell(data: indexData)
                return companyCell
            case 1:
                guard let companyCell = tableView.dequeueReusableCell(
                    withIdentifier: "CompanyTableViewCell")
                        as? CompanyTableViewCell else {
                    return UITableViewCell()
                }
                let indexData = recordsSection_2[indexPath.row]
                companyCell.configCell(data: indexData)
                return companyCell
            case 2:
                guard let companyCell = tableView.dequeueReusableCell(
                    withIdentifier: "CompanyTableViewCell")
                        as? CompanyTableViewCell else {
                    return UITableViewCell()
                }
                let indexData = recordsSection_3[indexPath.row]
                companyCell.configCell(data: indexData)
                return companyCell
            default:
                return UITableViewCell()
            }
        }
}

// MARK: Delegate methods
extension TableViewVC: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
            print(indexPath.section)
            print(indexPath.row)
            print(indexPath)
            switch indexPath.section {
            case 0:
                var selection = recordsSection_1[indexPath.row]
                selection.isSelected = !selection.isSelected
                recordsSection_1[indexPath.row] = selection
                tableView.reloadRows(at: [indexPath], with: .automatic)
            case 1:
                var selection = recordsSection_2[indexPath.row]
                selection.isSelected = !selection.isSelected
                recordsSection_2[indexPath.row] = selection
                tableView.reloadRows(at: [indexPath], with: .automatic)
            case 2:
                var selection = recordsSection_3[indexPath.row]
                selection.isSelected = !selection.isSelected
                recordsSection_3[indexPath.row] = selection
                tableView.reloadRows(at: [indexPath], with: .automatic)
            default:
                break
            }
        }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int) -> CGFloat {
            return 40
        }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int) -> UIView? {
            guard let customSectionHeader = tblContents.dequeueReusableHeaderFooterView(
                withIdentifier: CustomSectionHeaderView.identifier) as? CustomSectionHeaderView else {
                return nil
            }
            customSectionHeader.config("Section: \(section + 1)")
            return customSectionHeader
        }
    
    func tableView(
        _ tableView: UITableView,
        titleForFooterInSection section: Int) -> String? {
            Constants.StringConstants.footerSection.rawValue
        }
    
    func tableView(
        _ tableView: UITableView,
        willBeginEditingRowAt indexPath: IndexPath) {
        print("Begin editing")
    }
}
