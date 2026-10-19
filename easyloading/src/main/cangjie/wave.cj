/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Observed
public class WaveModel {
    @Publish
    var size: Float64 = 50.0

    @Publish
    var itemCount: Int64 = 5

    @Publish
    var colors: Array<Color> = [Color.BLACK]

    @Publish
    var duration: Int32 = 600
    public func setSize(size: Float64): WaveModel {
        this.size = size
        return this
    }
    public func setColors(colors: Array<Color>): WaveModel {
        if (colors.size > 0) {
            this.colors = colors
        }
        return this
    }
    public func setDuration(duration: Int32): WaveModel {
        this.duration = duration
        return this
    }
    public func setItemCount(itemCount: Int64): WaveModel {
        this.itemCount = itemCount
        return this
    }
}

@Component
public class Wave {
    @State
    var model: WaveModel = WaveModel()
    var spinKitWaveType: SpinKitWaveType = SpinKitWaveType.START

    var itemCount: Int64 = 5

    @State
    var scaleValueArr: ObservedArrayList<Float64> = ObservedArrayList<Float64>()

    var colors: Array<Color> = [Color.BLACK]
    var backColor: Color = Color.GRAY
    var width: Float64 = 300.0

    var height: Float64 = 300.0
    var animatorResult: ?AnimatorResult = None

    protected override func aboutToAppear() {
        this.itemCount = this.model.itemCount
        for (index in 0..itemCount) {
            scaleValueArr.append(1.0)
            animatorResult = AnimatorResult(setAnimatorOption(Int32(index)))
            animatorResult().onframe = {
                value: Float64 => this.scaleValueArr[index] = value
            }
            animatorResult().play()
        }
    }

    func setAnimatorOption(idx: Int32): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.model.duration,
            easing: "ease-in-out",
            delay: idx * 100,
            fill: AnimatorFill.Forwards,
            direction: AnimatorDirection.Alternate,
            iterations: -1,
            begin: 1.0,
            end: 0.4
        )
        return option
    }
    protected override func aboutToDisappear() {
        if (let Some(animator) <- animatorResult) {
            animator.finish()
        }
    }
    func getAnimationDelay(itemCount: Int64): Array<Float64> {
        match (this.spinKitWaveType) {
            case SpinKitWaveType.START => return startAnimationDelay(itemCount)
            case SpinKitWaveType.END => return endAnimationDelay(itemCount)
            case SpinKitWaveType.CENTER => return centerAnimationDelay(itemCount)
        }
    }

    func startAnimationDelay(count: Int64): Array<Float64> {
        var topArray: Array<Float64> = Array<Float64>(count / 2, repeat: 0.0)
        var endArray: Array<Float64> = Array<Float64>(count / 2, repeat: 0.0)
        var isOdd: Bool = count % 2 == 1

        for (index in 0..count / 2) {
            topArray[index] = -1.0 - (Float64(index) * 0.1) - 0.1
        }
        topArray.reverse()

        for (index in 0..count / 2) {
            var endNum: Float64 = 0.0
            if (isOdd) {
                endNum = 0.1
            }
            endArray[index] = -1.0 + (Float64(index) * 0.1) + endNum
        }

        if (isOdd) {
            return topArray.concat([-1.0]).concat(endArray)
        } else {
            return topArray.concat(endArray)
        }
    }

    func endAnimationDelay(count: Int64): Array<Float64> {
        var topArray: Array<Float64> = Array<Float64>(count / 2, repeat: 0.0)
        var endArray: Array<Float64> = Array<Float64>(count / 2, repeat: 0.0)
        var isOdd: Bool = count % 2 == 1

        for (index in 0..count / 2) {
            topArray[index] = -1.0 + (Float64(index) * 0.1) + 0.1
        }
        topArray.reverse()

        for (index in 0..count / 2) {
            var endNum: Float64 = 0.0
            if (isOdd) {
                endNum = 0.1
            }
            endArray[index] = -1.0 - (Float64(index) * 0.1) - endNum
        }

        if (isOdd) {
            return topArray.concat([-1.0]).concat(endArray)
        } else {
            return topArray.concat(endArray)
        }
    }

    func centerAnimationDelay(count: Int64): Array<Float64> {
        var topArray: Array<Float64> = Array<Float64>(count / 2, repeat: 0.0)
        var endArray: Array<Float64> = Array<Float64>(count / 2, repeat: 0.0)
        var isOdd: Bool = count % 2 == 1

        for (index in 0..count / 2) {
            topArray[index] = -1.0 + (Float64(index) * 0.2) + 0.2
        }
        topArray.reverse()

        for (index in 0..count / 2) {
            endArray[index] = -1.0 + (Float64(index) * 0.2) + 0.2
        }

        if (isOdd) {
            return topArray.concat([-1.0]).concat(endArray)
        } else {
            return topArray.concat(endArray)
        }
    }

    func build() {
        Row() {
            ForEach(
                Array<Int64>(this.itemCount, {i => i}),
                itemGeneratorFunc: {
                    _: Int64, idx: Int64 => Column {
                        Rect(width: this.model.size / Float64(this.itemCount), height: this.model.size).fill(
                            this.model.colors[idx % this.model.colors.size]).scaleY(Float32(this.scaleValueArr[idx]))
                    }
                }
            )
        }.width(this.model.size * 1.25).height(this.model.size).align(Alignment.Center).justifyContent(
            FlexAlign.SpaceBetween)
    }
}
