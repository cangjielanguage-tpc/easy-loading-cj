/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class CubeGridModel {
    @Publish
    var width: Float64 = 120.0
    @Publish
    var height: Float64 = 120.0
    @Publish
    var colorArray: Array<Color> = [Color(0xf44236), Color(0x4cb050)]
    @Publish
    var duration: Int32 = 600
    @Publish
    var shapeStyle: ShapeStyle = ShapeStyle.RECT

    public func setWidth(width: Float64): CubeGridModel {
        this.width = width
        return this
    }
    public func setHeight(height: Float64): CubeGridModel {
        this.height = height
        return this
    }
    public func setColorArray(colorArray: Array<Color>): CubeGridModel {
        this.colorArray = colorArray
        return this
    }
    public func setDuration(duration: Int32): CubeGridModel {
        this.duration = duration
        return this
    }
    public func setShapeStyle(shapeStyle: ShapeStyle): CubeGridModel {
        this.shapeStyle = shapeStyle
        return this
    }
}
@Component
public class CubeGrid {
    @State
    var model: CubeGridModel = CubeGridModel()

    @State
    var scale: ObservedArray<Float32> = ObservedArray<Float32>(0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0)

    @State
    var flag: Bool = false

    protected override func aboutToAppear(): Unit {

            let option1 = AnimatorOptions(
                        duration: 10,
                        easing: "ease",
                        delay: 0,
                        fill: AnimatorFill.Both,
                        direction: AnimatorDirection.AlternateReverse,
                        iterations: 1,
                        begin: 0.0,
                        end: 1.0
                    )
            let option2 = AnimatorOptions(
                    duration: this.model.duration,
                    easing: "ease",
                    delay: this.model.duration,
                    fill: AnimatorFill.Both,
                    direction: AnimatorDirection.AlternateReverse,
                    iterations: 1,
                    begin: 0.0,
                    end: 1.0
                )
                let animator = AnimatorResult(option1)
                animator.play()
                animator.onfinish = { =>
                    if(!this.flag) {
                        showPlay()
                    } else {
                        this.scale = ObservedArray<Float32>(1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0)
                        hiddenPlay()
                    }
                    this.flag = !this.flag
                    animator.reset(option2)
                    animator.play()
                }

    }


    func showPlay() {
        let animatorResult1 = AnimatorResult(setAnimatorOption(3))
        animatorResult1.onframe = { value: Float64  =>
            this.scale[0] = Float32(value)
        }
        animatorResult1.play()

        let animatorResult2 = AnimatorResult(setAnimatorOption(4))
        animatorResult2.onframe = { value: Float64  =>
            this.scale[1] = Float32(value)
        }
        animatorResult2.play()


        let animatorResult3 = AnimatorResult(setAnimatorOption(5))
        animatorResult3.onframe = { value: Float64  =>
            this.scale[2] = Float32(value)
        }
        animatorResult3.play()

        //-----2------
        let animatorResult4 = AnimatorResult(setAnimatorOption(2))
        animatorResult4.onframe = { value: Float64  =>
            this.scale[3] = Float32(value)
        }
        animatorResult4.play()


        let animatorResult5 = AnimatorResult(setAnimatorOption(3))
        animatorResult5.onframe = { value: Float64  =>
            this.scale[4] = Float32(value)
        }
        animatorResult5.play()


        let animatorResult6 = AnimatorResult(setAnimatorOption(4))
        animatorResult6.onframe = { value: Float64  =>
            this.scale[5] = Float32(value)
        }
        animatorResult6.play()

        //------3-----
        let animatorResult7 = AnimatorResult(setAnimatorOption(1))
        animatorResult7.onframe = { value: Float64  =>
            this.scale[6] = Float32(value)
        }
        animatorResult7.play()


        let animatorResult8 = AnimatorResult(setAnimatorOption(2))
        animatorResult8.onframe = { value: Float64  =>
            this.scale[7] = Float32(value)
        }
        animatorResult8.play()


        let animatorResult9 = AnimatorResult(setAnimatorOption(3))
        animatorResult9.onframe = { value: Float64  =>
            this.scale[8] = Float32(value)
        }
        animatorResult9.play()
    }

    func hiddenPlay() {
        let animatorResult1 = AnimatorResult(setAnimatorOption2(3))
        animatorResult1.onframe = { value: Float64  =>
            this.scale[0] = Float32(value)
        }
        animatorResult1.play()

        let animatorResult2 = AnimatorResult(setAnimatorOption2(4))
        animatorResult2.onframe = { value: Float64  =>
            this.scale[1] = Float32(value)
        }
        animatorResult2.play()


        let animatorResult3 = AnimatorResult(setAnimatorOption2(5))
        animatorResult3.onframe = { value: Float64  =>
            this.scale[2] = Float32(value)
        }
        animatorResult3.play()

        //-----2------
        let animatorResult4 = AnimatorResult(setAnimatorOption2(2))
        animatorResult4.onframe = { value: Float64  =>
            this.scale[3] = Float32(value)
        }
        animatorResult4.play()


        let animatorResult5 = AnimatorResult(setAnimatorOption2(3))
        animatorResult5.onframe = { value: Float64  =>
            this.scale[4] = Float32(value)
        }
        animatorResult5.play()


        let animatorResult6 = AnimatorResult(setAnimatorOption2(4))
        animatorResult6.onframe = { value: Float64  =>
            this.scale[5] = Float32(value)
        }
        animatorResult6.play()

        //------3-----
        let animatorResult7 = AnimatorResult(setAnimatorOption2(1))
        animatorResult7.onframe = { value: Float64  =>
            this.scale[6] = Float32(value)
        }
        animatorResult7.play()


        let animatorResult8 = AnimatorResult(setAnimatorOption2(2))
        animatorResult8.onframe = { value: Float64  =>
            this.scale[7] = Float32(value)
        }
        animatorResult8.play()


        let animatorResult9 = AnimatorResult(setAnimatorOption2(3))
        animatorResult9.onframe = { value: Float64  =>
            this.scale[8] = Float32(value)
        }
        animatorResult9.play()
    }

    func setAnimatorOption(idx: Int32): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in",
            delay: (this.model.duration/4) * (idx - 1),
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.AlternateReverse,
            iterations: 1,
            begin: 1.0,
            end: 0.0
        )
        return option
    }
    func setAnimatorOption2(idx: Int32): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-out",
            delay: (this.model.duration/4) * (idx - 1),
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.AlternateReverse,
            iterations: 1,
            begin: 0.0,
            end: 1.0
        )
        return option
    }


    @Builder
    func rectItem(idx: Int64){
        Rect()
        .width(this.model.width/3.0)
        .height(this.model.height/3.0)
        .scale(this.scale[idx])
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
           }
        )
    }
    @Builder
    func circleItem(idx: Int64){
        Circle()
        .width(this.model.width/3.0)
        .height(this.model.height/3.0)
        .scale(this.scale[idx])
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
           }
        )
    }

    func build() {
        Column() {
            Grid{
                 ForEach(Array<Int64>(9, { i => i+1}), itemGeneratorFunc: {_: Int64, idx: Int64 =>
                    GridItem {
                        if(this.model.shapeStyle == ShapeStyle.RECT) {
                            rectItem(idx)
                        } else {
                            circleItem(idx)
                        }
                    }
                 })
            }
            .columnsTemplate("1fr 1fr 1fr")
            .rowsTemplate("1fr 1fr 1fr")
            .columnsGap(0)
            .rowsGap(0)
            .width(this.model.width)
            .height(this.model.height)
        }.width(100.percent).height(100.percent)

    }
}
