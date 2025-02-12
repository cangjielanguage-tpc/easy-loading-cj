/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*

@Entry
@Component
class SpinKitFadingGridTestLLT {
    @State
    var model: FadingGridModel = FadingGridModel()
    var model2: FadingGridModel = FadingGridModel()
    var model3: FadingGridModel = FadingGridModel()
    protected override func aboutToAppear(): Unit {
        this.model.setSize(80.0).setRowsGap(2.0).setColumnsGap(2.0).setColorArray([Color.RED]).setDuration(600)
        this.model2.setSize(40.0).setRowsGap(2.0).setColumnsGap(2.0).setColorArray([Color.RED, Color.BLACK, Color.GREEN]
        ).setDuration(300)
        this.model3.setSize(100.0).setRowsGap(2.0).setColumnsGap(2.0).setColorArray(
            [Color.RED, Color.BLACK, Color.BLUE, Color.GREEN]).setDuration(1000)
    }
    func build() {
        Column() {
            Stack(Alignment.Center) {
                FadingGrid(model: this.model)
            }.width(100.0).height(100.0).padding(top: 70.0).backgroundColor(Color.BLUE)
            Stack(Alignment.Center) {
                FadingGrid(model: this.model2)
            }.width(100.0).height(100.0).padding(top: 70.0).backgroundColor(Color.WHITE)
            Stack(Alignment.Center) {
                FadingGrid(model: this.model3)
            }.width(100.0).height(100.0).padding(top: 70.0).backgroundColor(Color.GRAY)
        }.width(100.percent).height(100.percent).backgroundColor(Color.BLACK)
    }
}
