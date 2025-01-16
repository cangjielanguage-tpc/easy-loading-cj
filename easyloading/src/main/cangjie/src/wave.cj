/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

import ohos.state_macro_manage.*

@Component
public class WaveComponent {
    var size: Float64 = 50.0

    var spinKitWaveType: SpinKitWaveType = SpinKitWaveType.START

    var duration: Int32 = 1200

    var itemCount: Int64 = 5

    @State
    var scaleValueArr: ObservedArrayList<Float64> = ObservedArrayList<Float64>(1.0, 1.0, 1.0, 1.0, 1.0)

    var colors: Array<Color> = [Color.BLACK]
    var backColor: Color = Color.GRAY
    var width: Float64 = 300.0

    var height: Float64 = 300.0
    var animatorResult: ?AnimatorResult = None

    protected override func aboutToAppear() {
        for (index in 0..itemCount) {
            animatorResult = AnimatorResult(setAnimatorOption(Int32(index)))
            animatorResult().onframe = {
                value: Float64 => this.scaleValueArr[index] = value
            }
            animatorResult().play()
        }
    }
    protected override func aboutToDisappear() {
        if (let Some(animator) <- animatorResult) {
            animator.finish()
        }
    }
    func setAnimatorOption(idx: Int32): AnimatorOptions {
        let option = AnimatorOptions(
            duration: this.duration,
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
    func getAnimationDelay(itemCount: Int64): Array<Float64> {
        match (this.spinKitWaveType) {
            case SpinKitWaveType.START => return startAnimationDelay(itemCount)
            case SpinKitWaveType.END => return endAnimationDelay(itemCount)
            case SpinKitWaveType.CENTER => return centerAnimationDelay(itemCount)
        }
    }

    func startAnimationDelay(count: Int64): Array<Float64> {
        var topArray: Array<Float64> = Array<Float64>(count / 2, item: 0.0)
        var endArray: Array<Float64> = Array<Float64>(count / 2, item: 0.0)
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
        var topArray: Array<Float64> = Array<Float64>(count / 2, item: 0.0)
        var endArray: Array<Float64> = Array<Float64>(count / 2, item: 0.0)
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
        var topArray: Array<Float64> = Array<Float64>(count / 2, item: 0.0)
        var endArray: Array<Float64> = Array<Float64>(count / 2, item: 0.0)
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
        RelativeContainer() {
            Row() {
                ForEach(
                    Array<Int64>(this.itemCount, {i => i + 1}),
                    itemGeneratorFunc: {
                        _: Int64, idx: Int64 => Column {
                            Rect(width: this.size / Float64(this.itemCount), height: this.size)
                                .fill(this.colors[idx % this.colors.size])
                                .scaleY(Float32(this.scaleValueArr[idx]))
                        }
                    }
                )
            }
                .width(this.size * 1.25)
                .height(this.size)
                .align(Alignment.Center)
                .justifyContent(FlexAlign.SpaceBetween)
                .alignRules(
                    AlignRuleOption(
                        top: VerticalAnchor("__container__", VerticalAlign.Top),
                        bottom: VerticalAnchor("__container__", VerticalAlign.Bottom),
                        left: HorizontalAnchor("__container__", HorizontalAlign.Start),
                        right: HorizontalAnchor("__container__", HorizontalAlign.End),
                    )
                )
        }
            .width(this.width)
            .height(this.height)
            .backgroundColor(this.backColor)
            .border(width: 2.vp, color: Color(0x6699ff))
    }
}
