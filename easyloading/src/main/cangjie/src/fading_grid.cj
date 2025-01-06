/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading


import ohos.state_macro_manage.*

@Component
public class SpinKitFadingGrid {
    @State
    var opcityArr: ObservedArray<Float64> = ObservedArray<Float64>(0.4, 0.4, 0.4, 0.4, 0.4, 0.4,0.4, 0.4, 0.4)
    var width: Float64 = 120.0
    var height: Float64 = 120.0
    var rowsGap: Float64 = 10.0
    var columnsGap: Float64 = 10.0
    var colorArray: Array<Color> = [Color.RED, Color(0x008000),Color.RED, Color(0x008000),Color.RED, Color(0x008000),Color.RED, Color(0x008000),Color.RED]
    var duration: Int32 = 600

    protected override func aboutToAppear(): Unit {
        let animatorResult1 = AnimatorResult(setAnimatorOption(1))
        animatorResult1.onframe = { value: Float64  =>
            this.opcityArr[0] = value
        }
        animatorResult1.play()

        let animatorResult2 = AnimatorResult(setAnimatorOption(1))
        animatorResult2.onframe = { value: Float64  =>
            this.opcityArr[1] = value
        }
        animatorResult2.play()


        let animatorResult3 = AnimatorResult(setAnimatorOption(2))
        animatorResult3.onframe = { value: Float64  =>
            this.opcityArr[2] = value
        }
        animatorResult3.play()

        //-----2------
        let animatorResult4 = AnimatorResult(setAnimatorOption(4))
        animatorResult4.onframe = { value: Float64  =>
            this.opcityArr[3] = value
        }
        animatorResult4.play()


        let animatorResult5 = AnimatorResult(setAnimatorOption(1))
        animatorResult5.onframe = { value: Float64  =>
            this.opcityArr[4] = value
        }
        animatorResult5.play()


        let animatorResult6 = AnimatorResult(setAnimatorOption(2))
        animatorResult6.onframe = { value: Float64  =>
            this.opcityArr[5] = value
        }
        animatorResult6.play()

        //------3-----
        let animatorResult7 = AnimatorResult(setAnimatorOption(4))
        animatorResult7.onframe = { value: Float64  =>
            this.opcityArr[6] = value
        }
        animatorResult7.play()


        let animatorResult8 = AnimatorResult(setAnimatorOption(3))
        animatorResult8.onframe = { value: Float64  =>
            this.opcityArr[7] = value
        }
        animatorResult8.play()


        let animatorResult9 = AnimatorResult(setAnimatorOption(3))
        animatorResult9.onframe = { value: Float64  =>
            this.opcityArr[8] = value
        }
        animatorResult9.play()
    }

    func setAnimatorOption(idx: Int32): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.duration,
            easing: "fast-out-linear-in",
            delay: 300 * (idx - 1),
            fill: AnimatorFill.Both,
            direction: AnimatorDirection.AlternateReverse,
            iterations: -1,
            begin: 0.4,
            end: 0.7
        )
        return option
    }

    @Builder
    func rectItem(idx: Int64, opcityNum: Float64){
        Rect()
        .width(this.width/4.0)
        .height(this.height/4.0)
        .fill(
           match (this.colorArray.size) {
                case 0 => Color.RED
                case 1 => this.colorArray[0]
                case 2 =>
                    if(idx % 2 == 0 ) {
                        this.colorArray[0]
                    } else {
                        this.colorArray[1]
                    }
                case 9 => this.colorArray[idx]
                case _ => Color.RED
           })
        .opacity(opcityNum)
    }

    func build() {
        Column() {
            Grid{
                 ForEach(this.opcityArr, itemGeneratorFunc: {item: Float64, idx: Int64 =>
                    GridItem {
                        rectItem(idx, item)
                    }
                 })
            }
            .columnsTemplate("1fr 1fr 1fr")
            .rowsTemplate("1fr 1fr 1fr")
            .columnsGap(this.columnsGap)
            .rowsGap(this.rowsGap)
            .width(this.width)
            .height(this.height)
        }.width(100.percent).height(100.percent)

    }
}
