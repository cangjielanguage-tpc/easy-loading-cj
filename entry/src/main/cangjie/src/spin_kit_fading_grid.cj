/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry
import ohos.state_macro_manage.*
@Entry
@Component
class SpinKitFadingGridTest {

    func build() {
        Column() {
            Stack(Alignment.Center) {
                SpinKitFadingGrid()
//                SpinKitFadingGrid(
//                    width: 200.0,
//                    height: 200.0,
//                    rowsGap: 5.0,
//                    columnsGap: 5.0,
//                    colorArray: [Color.BLUE, Color.GRAY],
//                    duration: 1000
//                )
            }
            .width(300.0)
            .height(300.0)
            .padding(top: 70.0)
            .backgroundColor(Color.WHITE)
        }.width(100.percent).height(100.percent).backgroundColor(Color.BLACK)

    }
}