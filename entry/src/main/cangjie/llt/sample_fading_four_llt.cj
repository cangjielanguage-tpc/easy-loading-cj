/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry.llt

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleFadingFourLLT {
    @State
    var model: FadingFourModel = FadingFourModel()
    var model2: FadingFourModel = FadingFourModel()
    var model3: FadingFourModel = FadingFourModel()

    protected override func aboutToAppear(): Unit {
        this.model.setSize(50.0).setDuration(600).setColors([Color.RED]).setShapeStyle(ShapeStyle.CIRCLE)
        this.model2.setSize(80.0).setDuration(1000).setColors([Color.RED, Color.BLACK]).setShapeStyle(ShapeStyle.RECT)
        this.model3.setSize(30.0).setDuration(300).setColors([Color.RED]).setShapeStyle(ShapeStyle.CIRCLE)
    }

    func build() {
        Column {
                            Text("back").id("back").height(80)
                .onClick ({ evt =>
                    Router.back()
                })
            Stack(Alignment.Center) {
                FadingFour(model: this.model)
            }.width(100.0).height(100.0).backgroundColor(Color.GRAY)

            Stack(Alignment.Center) {
                FadingFour(model: this.model2)
            }.width(100.0).height(100.0).backgroundColor(Color.GREEN)

            Stack(Alignment.Center) {
                FadingFour(model: this.model3)
            }.width(100.0).height(100.0).backgroundColor(Color.BLUE)
        }
    }
}
