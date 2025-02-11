/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleThreeBounceLLT {
    @State
    var model: ThreeBounceModel = ThreeBounceModel()
    var model2: ThreeBounceModel = ThreeBounceModel()
    var model3: ThreeBounceModel = ThreeBounceModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(80.0).setDuration(700).setColors([Color.RED]).setShapeStyle(ShapeStyle.CIRCLE)
        this.model2.setSize(100.0).setDuration(1000).setColors([Color.RED, Color.GREEN, Color.BLACK]).setShapeStyle(
            ShapeStyle.RECT)
        this.model3.setSize(50.0).setDuration(300).setColors([Color.RED, Color.GREEN]).setShapeStyle(ShapeStyle.CIRCLE)
    }

    func build() {
        Column {
            Stack(Alignment.Center) {
                ThreeBounce(model: this.model)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.GRAY)
            Stack(Alignment.Center) {
                ThreeBounce(model: this.model2)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.WHITE)
            Stack(Alignment.Center) {
                ThreeBounce(model: this.model3)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.BLACK)
        }
    }
}
