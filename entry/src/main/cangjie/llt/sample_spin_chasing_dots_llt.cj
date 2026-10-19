/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleSpinChasingDotsLLT {
    @State
    var model: SpinChasingDotsModel = SpinChasingDotsModel()
    var model2: SpinChasingDotsModel = SpinChasingDotsModel()
    var model3: SpinChasingDotsModel = SpinChasingDotsModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(120.0).setDuration(2000).setShapeStyle(ShapeStyle.CIRCLE)
        this.model2.setSize(80.0).setDuration(1000).setShapeStyle(ShapeStyle.RECT).setColors(
            [Color.RED, Color.BLACK, Color.GREEN, Color.WHITE])
        this.model3.setSize(200.0).setDuration(3000).setShapeStyle(ShapeStyle.CIRCLE).setColors(
            [Color.RED, Color.BLACK, Color.GREEN])
    }

    func build() {
        Column {
                            Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                SpinChasingDots(model: this.model)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.BLUE)
            Stack(Alignment.Center) {
                SpinChasingDots(model: this.model2)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.GRAY)
            Stack(Alignment.Center) {
                SpinChasingDots(model: this.model3)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.WHITE)
        }
    }
}
