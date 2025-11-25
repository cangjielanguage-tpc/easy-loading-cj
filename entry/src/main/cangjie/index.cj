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
import ohos.component.Scroller
import ohos.component.Scroll
import ohos.router.Router

@Entry
@Component
class EntryView {
    @State
    var message: String = "Hello Cangjie"
    let scroller = Scroller()
    func build() {
        Row {
            Scroll(this.scroller) {
                Column {
                    Button("SampleRotatePlain").fontSize(14).id("SampleRotatePlain").onClick {
                        => Router.push(url: "SampleRotatePlain")
                    }
                    Button("SampleDoubleBounce").fontSize(14).id("SampleDoubleBounce").onClick {
                        => Router.push(url: "SampleDoubleBounce")
                    }
                    Button("SampleWave").fontSize(14).id("SampleWave").onClick {
                        => Router.push(url: "ShowWaveSample")
                    }
                    Button("SampleWanderingCubes").fontSize(14).id("SampleWanderingCubes").onClick {
                        => Router.push(url: "WanderingCubesTest")
                    }
                    Button("SampleFadingFour").fontSize(14).id("SampleFadingFour").onClick {
                        => Router.push(url: "SampleFadingFour")
                    }
                    Button("SampleFadingCube").fontSize(14).id("SampleFadingCube").onClick {
                        => Router.push(url: "SampleFadingCube")
                    }
                    Button("SamplePulse").fontSize(14).id("SamplePulse").onClick {
                        => Router.push(url: "SamplePulse")
                    }
                    Button("SampleSpinChasingDots").fontSize(14).id("SampleSpinChasingDots").onClick {
                        => Router.push(url: "SampleSpinChasingDots")
                    }
                    Button("SampleThreeBounce").fontSize(14).id("SampleThreeBounce").onClick {
                        => Router.push(url: "SampleThreeBounce")
                    }
                    Button("SampleCircle").fontSize(14).id("SampleCircle").onClick {
                        => Router.push(url: "SampleCircle")
                    }
                    Button("other sample").width(100.percent).height(50).fontSize(18).margin(top: 10).id("other_sample").onClick({evt =>Router.push(url:"other_sample")})

                    Text("All----------------------")

                    Button("all").fontSize(14).id("all").onClick {
                        => Router.push(url: "AllTest")
                    }
                    Button("allIndicator").fontSize(14).onClick {
                        => Router.push(url: "AllIndicatorTest")
                    }
                    Button("SampleReadmeT").fontSize(14).onClick {
                        => Router.push(url: "ShowReadme")
                    }
                    Button("SampleTT").fontSize(14).id("SampleTT").onClick {
                        => Router.push(url: "SampleTT")
                    }
                    Text("add LLT----------------------")
                    Button("llt sample").width(100.percent).height(50).fontSize(18).margin(top: 10).id("other_sample_llt").onClick({evt =>Router.push(url:"other_sample_llt")})

                }.width(100.percent)
            }
        }.height(100.percent)
    }
}
