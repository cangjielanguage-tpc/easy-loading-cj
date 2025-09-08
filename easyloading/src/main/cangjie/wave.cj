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
        this.colors = colors
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
    protected override func aboutToDisappear() {
        if (let Some(animator) <- animatorResult) {
            animator.finish()
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
