/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SquareCircleSampleLLT {
    @State
    var model: SquareCircleModel = SquareCircleModel()
    var model2: SquareCircleModel = SquareCircleModel()
    var model3: SquareCircleModel = SquareCircleModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(120.0).setDuration(600).setColor(Color.RED)
        this.model2.setSize(60.0).setDuration(300).setColor(Color.BLACK)
        this.model3.setSize(200.0).setDuration(1000).setColor(Color.BLUE)
    }

    func build() {
        Column {
                            Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                SquareCircle(model: this.model)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.GRAY)
            Stack(Alignment.Center) {
                SquareCircle(model: this.model2)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.WHITE)
            Stack(Alignment.Center) {
                SquareCircle(model: this.model3)
            }.width(100.0).height(100.0).padding(top: 20.0).backgroundColor(Color.RED)
        }
    }
}
