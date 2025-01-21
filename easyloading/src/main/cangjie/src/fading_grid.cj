/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class FadingGridModel {
    @Publish
    var size: Float64 = 120.0
    @Publish
    var rowsGap: Float64 = 10.0
    @Publish
    var columnsGap: Float64 = 10.0
    @Publish
    var colorArray: Array<Color> = [Color.RED, Color(0x008000),Color.RED, Color(0x008000),Color.RED, Color(0x008000),Color.RED, Color(0x008000),Color.RED]
    @Publish
    var duration: Int32 = 600
    @Publish
    var startOpcity: Float64 = 0.4
    @Publish
    var endOpcity: Float64 = 0.9
    @Publish
    var shapeStyle: ShapeStyle = ShapeStyle.RECT

    public func setSize(size: Float64): FadingGridModel {
        this.size = size
        return this
    }
    public func setRowsGap(rowsGap: Float64): FadingGridModel {
        this.rowsGap = rowsGap
        return this
    }
    public func setColumnsGap(columnsGap: Float64): FadingGridModel {
        this.columnsGap = columnsGap
        return this
    }
    public func setColorArray(colorArray: Array<Color>): FadingGridModel {
        this.colorArray = colorArray
        return this
    }
    public func setDuration(duration: Int32): FadingGridModel {
        this.duration = duration
        return this
    }
    public func setStartOpcity(startOpcity: Float64): FadingGridModel {
        this.startOpcity = startOpcity
        return this
    }
    public func setEndOpcity(endOpcity: Float64): FadingGridModel {
        this.endOpcity = endOpcity
        return this
    }
    public func setShapeStyle(shapeStyle: ShapeStyle): FadingGridModel {
        this.shapeStyle = shapeStyle
        return this
    }
}


@Component
public class FadingGrid {
    @State
    var opcityArr: ObservedArray<Float64> = ObservedArray<Float64>(1.0, 1.0, 1.0, 1.0, 1.0, 1.0,1.0, 1.0, 1.0 )
    @State
    var model: FadingGridModel = FadingGridModel()

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
            duration: this.model.duration,
            easing: "fast-out-linear-in",
            delay: 300 * (idx - 1),
            fill: AnimatorFill.Both,
            direction: AnimatorDirection.AlternateReverse,
            iterations: -1,
            begin: this.model.startOpcity,
            end: this.model.endOpcity
        )
        return option
    }

    @Builder
    func rectItem(idx: Int64, opcityNum: Float64){
        Rect()
        .width(this.model.size/4.0)
        .height(this.model.size/4.0)
        .fill(
           match (this.model.colorArray.size) {
                case 0 => Color.RED
                case 1 => this.model.colorArray[0]
                case 2 =>
                    if(idx % 2 == 0 ) {
                        this.model.colorArray[0]
                    } else {
                        this.model.colorArray[1]
                    }
                case 9 => this.model.colorArray[idx]
                case _ => Color.RED
           })
        .opacity(opcityNum)
    }
    @Builder
    func circleItem(idx: Int64, opcityNum: Float64){
        Circle()
        .width(this.model.size/4.0)
        .height(this.model.size/4.0)
        .fill(
           match (this.model.colorArray.size) {
                case 0 => Color.RED
                case 1 => this.model.colorArray[0]
                case 2 =>
                    if(idx % 2 == 0 ) {
                        this.model.colorArray[0]
                    } else {
                        this.model.colorArray[1]
                    }
                case 9 => this.model.colorArray[idx]
                case _ => Color.RED
           })
        .opacity(opcityNum)
    }

    func build() {
        Column() {
            Grid{
                 ForEach(this.opcityArr, itemGeneratorFunc: {item: Float64, idx: Int64 =>
                    GridItem {
                        if(this.model.shapeStyle == ShapeStyle.RECT) {
                            rectItem(idx, item)
                        } else {
                            circleItem(idx, item)
                        }
                    }
                 })
            }
            .columnsTemplate("1fr 1fr 1fr")
            .rowsTemplate("1fr 1fr 1fr")
            .columnsGap(this.model.columnsGap)
            .rowsGap(this.model.rowsGap)
            .width(this.model.size)
            .height(this.model.size)
        }.width(100.percent).height(100.percent)

    }
}
