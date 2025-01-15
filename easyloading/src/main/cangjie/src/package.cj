/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 */
package easyloading

internal import ohos.base.*
internal import ohos.component.*
internal import ohos.state_manage.*
internal import ohos.concurrency.*
internal import ohos.animator.*
internal import ohos.hilog.Hilog
internal import ohos.display.getDefaultDisplaySync
internal import ohos.display.Display

internal import std.math.*
internal import std.collection.ArrayList
internal import std.sync.{Timer, sleep}
internal import std.time.*
internal import std.format.Formatter
internal import std.convert.Parsable

extend<T> Option<T> {
    operator func ()(): T {
        this.getOrThrow()
    }
}