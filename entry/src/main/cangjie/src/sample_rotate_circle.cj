/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
internal import ohos.component.*

@Entry
@Component
public class SampleRotateCircle {

    func build() {
        Stack(Alignment.TopStart) {
            Column {
                RotateCircleComponent(
                        width: 300.0,
                        height: 300.0,
                        color: Color.RED,
                        duration: 1200,
                        size: 60.0
                    )
            }
        }
    }
}
