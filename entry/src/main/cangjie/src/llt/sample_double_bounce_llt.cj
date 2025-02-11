/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleDoubleBounceLLT {
    @State
    var model: DoubleBounceModel = DoubleBounceModel()
    var model2: DoubleBounceModel = DoubleBounceModel()
    var model3: DoubleBounceModel = DoubleBounceModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(80.0).setDuration(1000).setColors([Color.WHITE, Color.GRAY]).setShapeStyle(ShapeStyle.CIRCLE)
        this.model2.setSize(50.0).setDuration(600).setColors([Color.BLUE, Color.RED]).setShapeStyle(ShapeStyle.RECT)
        this.model3.setSize(100.0).setDuration(2000).setColors([Color.BLUE, Color.GRAY]).setShapeStyle(
            ShapeStyle.CIRCLE)
    }

    func build() {
        Column {
            Stack(Alignment.Center) {
                DoubleBounce(model: this.model)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.BLUE)
            Stack(Alignment.Center) {
                DoubleBounce(model: this.model2)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.WHITE)
            Stack(Alignment.Center) {
                DoubleBounce(model: this.model3)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.RED)
        }
    }
}
