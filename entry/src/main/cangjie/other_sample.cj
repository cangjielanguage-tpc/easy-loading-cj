/**
 * Created on 2025/3/18
 */
package ohos_app_cangjie_entry

import ohos.state_macro_manage.*
import ohos.component.*

@Entry
@Component
class other_sample {
    let scroller = Scroller()
    private var cases: Array<String> = [
            "SampleStaticCircle",
            "SampleRotateCircles",
            "SampleRotateFourCircles",
            "SampleRotateEightCircles",
            "CubeGridTest",
            "SampleFadingCircle",
            "SampleRotateCircle",
            "SampleFoldingCube",
            "PumpHeartTest",
            "SampleHourGlass",
            "SamplePouringHourGlass",
            "SpinKitFadingGridTest",
            "SampleRing",
            "SampleMoveRing",
            "SampleSpinningCircle",
            "SquareCircleSample",
            "DualRingTest"
        ]
    func build() {
         Column {
           Text("-- other_back --").id("other_back").height(20)
                .onClick ({ evt =>
                    Router.back()
                })
            Scroll() {
                Column(20) {
                    ForEach(
                        this.cases,
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