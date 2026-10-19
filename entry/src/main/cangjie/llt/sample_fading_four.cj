/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleFadingFour {
    @State
    var model: FadingFourModel = FadingFourModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(50.0).setDuration(600).setColors([Color.RED]).setShapeStyle(ShapeStyle.CIRCLE)
    }

    func build() {
        Column {
                Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                FadingFour(model: this.model)
            }.width(300.0).height(300.0).backgroundColor(Color.GRAY)
        }
    }
}
