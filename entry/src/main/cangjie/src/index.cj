/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package ohos_app_cangjie_entry

internal import ohos.base.LengthProp
internal import ohos.component.Column
internal import ohos.component.Row
internal import ohos.component.Button
internal import ohos.component.Text
internal import ohos.component.CustomView
internal import ohos.component.CJEntry
internal import ohos.component.loadNativeView
internal import ohos.state_manage.SubscriberManager
internal import ohos.state_manage.ObservedProperty
internal import ohos.state_manage.LocalStorage
import ohos.state_macro_manage.Entry
import ohos.state_macro_manage.Component
import ohos.state_macro_manage.State
import ohos.state_macro_manage.r

@Entry
@Component
class EntryView {
    @State
    var message: String = "Hello Cangjie"
    func build() {
        Row {
            Column {
                Button("Sample1").fontSize(14).onClick {
                    => Router.push(url: "Sample1")
                }

                Button("SampleThreeBounce").fontSize(14).onClick {
                    => Router.push(url: "SampleThreeBounce")
                }
                Button("SampleDoubleBounce").fontSize(14).onClick {
                    => Router.push(url: "SampleDoubleBounce")
                }
                Button("SampleSpinChasingDots").fontSize(14).onClick {
                    => Router.push(url: "SampleSpinChasingDots")
                }
                Button("SamplePulse").fontSize(14).onClick {
                    => Router.push(url: "SamplePulse")
                }
                Text("----------------------")
                Button("ShowWaveSample").fontSize(14).onClick {
                    => Router.push(url: "ShowWaveSample")
                }
                Button("FadingGrid").fontSize(14).onClick {
                    => Router.push(url: "SpinKitFadingGridTest")
                }
                Button("CubeGridTest").fontSize(14).onClick {
                    => Router.push(url: "CubeGridTest")
                }
                Button("PumpHeartTest").fontSize(14).onClick {
                    => Router.push(url: "PumpHeartTest")
                }
                Button("all").fontSize(14).onClick {
                    => Router.push(url: "AllTest")
                }
                Button("allIndicator").fontSize(14).onClick {
                    => Router.push(url: "AllIndicatorTest")
                }
            }.width(100.percent)
        }.height(100.percent)
    }
}
