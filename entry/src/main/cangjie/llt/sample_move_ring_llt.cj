/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleMoveRingLLT {
    @State
    var model: MoveRingModel = MoveRingModel()
    var model2: MoveRingModel = MoveRingModel()
    var model3: MoveRingModel = MoveRingModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(50.0).setDuration(600).setColor(Color.RED).setStrokeWidth(2.0)
        this.model2.setSize(100.0).setDuration(1000).setColor(Color.GREEN).setStrokeWidth(4.0)
        this.model3.setSize(30.0).setDuration(400).setColor(Color.BLACK)
    }

    func build() {
        Column {
                            Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                MoveRing(model: this.model)
            }.width(100.0).height(100.0).backgroundColor(Color.GRAY)
            Stack(Alignment.Center) {
                MoveRing(model: this.model2)
            }.width(100.0).height(100.0).backgroundColor(Color.BLACK)
            Stack(Alignment.Center) {
                MoveRing(model: this.model3)
            }.width(100.0).height(100.0).backgroundColor(Color.WHITE)
        }
    }
}
