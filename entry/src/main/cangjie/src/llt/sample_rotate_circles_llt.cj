/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleRotateCirclesLLT {
    @State
    var model: RotateCirclesModel = RotateCirclesModel()
    var model2: RotateCirclesModel = RotateCirclesModel()
    var model3: RotateCirclesModel = RotateCirclesModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(50.0).setDuration(1200).setColors([Color.RED])
        this.model2.setSize(80.0).setDuration(2000).setColors([Color.GREEN])
        this.model3.setSize(30.0).setDuration(600).setColors([Color.BLUE])
    }

    func build() {
        Column {
            Stack(Alignment.Center) {
                RotateCirclesComponent(model: this.model)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.RED)
            Stack(Alignment.Center) {
                RotateCirclesComponent(model: this.model2)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.GRAY)
            Stack(Alignment.Center) {
                RotateCirclesComponent(model: this.model3)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.GREEN)
        }
    }
}
