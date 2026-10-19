/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleSpinChasingDots {
    @State
    var model: SpinChasingDotsModel = SpinChasingDotsModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(120.0).setDuration(2000).setShapeStyle(ShapeStyle.CIRCLE)
    }

    func build() {
        Column {
                Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                SpinChasingDots(model: this.model)
            }.width(300.0).height(300.0).padding(top: 20.0).backgroundColor(Color.GRAY)
        }
    }
}
