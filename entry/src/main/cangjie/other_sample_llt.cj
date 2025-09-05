/**
 * Created on 2025/3/18
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
import ohos.component.*

@Entry
@Component
class other_sample_llt {
    let scroller = Scroller()
    private var cases_llt: Array<String> = [
            "ShowWaveSampleLLT",
            "SampleRotatePlainLLT",
            "SampleDoubleBounceLLT",
            "WanderingCubesTestLLT",
            "SampleFadingFourLLT",
            "SampleFadingCubeLLT",
            "SamplePulseLLT",
            "SampleSpinChasingDotsLLT",
            "SampleThreeBounceLLT",
            "SampleCircleLLT",
            "CubeGridTestLLT",
            "SampleRotateCircleLLT",
            "SampleRotateCirclesLLT",
            "SampleFoldingCubeLLT",
            "SpinKitFadingGridTestLLT",
            "SampleSpinningCircleLLT",
            "SquareCircleSampleLLT",
            "SampleRingLLT",
            "SampleMoveRingLLT",
            "SamplePourHourGlassLLT"
        ]
    func build() {
         Column {
           Text("-- llt_back --").id("llt_back").height(20)
                .onClick ({ evt =>
                    Router.back()
                })
            Scroll() {
                Column(20) {
                    ForEach(
                        this.cases_llt,
                        itemGeneratorFunc: {
                            item: String, idx: Int64 =>
                                Button(item)
                                 .height(10)
                                 .fontColor(Color.BLACK)
                                 .width(100.percent).id(item)
                                 .onClick{Router.push(url: item)}
                        }
                    )
                }
                .width(100.percent)
            }
            .scrollable(ScrollDirection.Vertical)
        }
    }
}