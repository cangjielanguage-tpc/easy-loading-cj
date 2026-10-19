/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleDoubleBounce {
    @State
    var model: DoubleBounceModel = DoubleBounceModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(80.0).setDuration(1000).setColors([Color.WHITE, Color.GRAY]).setShapeStyle(ShapeStyle.CIRCLE)
    }

    func build() {
        Column {
                Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                DoubleBounce(model: this.model)
            }.width(300.0).height(300.0).padding(top: 20.0).backgroundColor(Color.BLUE)
        }
    }
}
