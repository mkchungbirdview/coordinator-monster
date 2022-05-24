import Foundation
import Common

protocol MasterRouting: Flowable {

    var detailDependenciesFactory: DetailDependenciesFactory { get }

    // 띄워줄 화면 정의
    func pushDetail(id: String)

    // 종료할 화면 정의
    func popDetail(passingValue: String)
}
