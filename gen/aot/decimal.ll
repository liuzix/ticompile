%MyDecimal = type <{ i8, i8, i8, i1, [9 x i32] }>

@div9 = internal constant [128 x i64] [i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 9, i64 9, i64 9, i64 9, i64 9, i64 9, i64 9, i64 9, i64 9, i64 10, i64 10, i64 10, i64 10, i64 10, i64 10, i64 10, i64 10, i64 10, i64 11, i64 11, i64 11, i64 11, i64 11, i64 11, i64 11, i64 11, i64 11, i64 12, i64 12, i64 12, i64 12, i64 12, i64 12, i64 12, i64 12, i64 12, i64 13, i64 13, i64 13, i64 13, i64 13, i64 13, i64 13, i64 13, i64 13, i64 14, i64 14], align 8
@powers10 = internal constant [10 x i32] [i32 1, i32 10, i32 100, i32 1000, i32 10000, i32 100000, i32 1000000, i32 10000000, i32 100000000, i32 1000000000], align 4
@wordBufLen = internal constant i64 9, align 8
@zeroMyDecimal = internal global %MyDecimal zeroinitializer, align 4
@fracMax = internal global [8 x i32] [i32 900000000, i32 990000000, i32 999000000, i32 999900000, i32 999990000, i32 999999000, i32 999999900, i32 999999990], align 4

define internal %MyDecimal @zeroMyDecimalWithFrac(i8 %frac) unnamed_addr #0  {
entry:
  %zero = alloca %MyDecimal, align 8
  %.fca.0.gep = getelementptr inbounds %MyDecimal, %MyDecimal* %zero, i32 0, i32 0
  store i8 0, i8* %.fca.0.gep, align 4
  %.fca.1.gep = getelementptr inbounds %MyDecimal, %MyDecimal* %zero, i32 0, i32 1
  store i8 0, i8* %.fca.1.gep, align 1
  %.fca.2.gep = getelementptr inbounds %MyDecimal, %MyDecimal* %zero, i32 0, i32 2
  store i8 0, i8* %.fca.2.gep, align 2
  %.fca.3.gep = getelementptr inbounds %MyDecimal, %MyDecimal* %zero, i32 0, i32 3
  store i1 false, i1* %.fca.3.gep, align 1
  %.fca.4.0.gep = getelementptr inbounds %MyDecimal, %MyDecimal* %zero, i32 0, i32 4, i32 0
  store i32 0, i32* %.fca.4.0.gep, align 4
  %.fca.4.1.gep = getelementptr inbounds %MyDecimal, %MyDecimal* %zero, i32 0, i32 4, i32 1
  store i32 0, i32* %.fca.4.1.gep, align 4
  %.fca.4.2.gep = getelementptr inbounds %MyDecimal, %MyDecimal* %zero, i32 0, i32 4, i32 2
  store i32 0, i32* %.fca.4.2.gep, align 4
  %.fca.4.3.gep = getelementptr inbounds %MyDecimal, %MyDecimal* %zero, i32 0, i32 4, i32 3
  store i32 0, i32* %.fca.4.3.gep, align 4
  %.fca.4.4.gep = getelementptr inbounds %MyDecimal, %MyDecimal* %zero, i32 0, i32 4, i32 4
  store i32 0, i32* %.fca.4.4.gep, align 4
  %.fca.4.5.gep = getelementptr inbounds %MyDecimal, %MyDecimal* %zero, i32 0, i32 4, i32 5
  store i32 0, i32* %.fca.4.5.gep, align 4
  %.fca.4.6.gep = getelementptr inbounds %MyDecimal, %MyDecimal* %zero, i32 0, i32 4, i32 6
  store i32 0, i32* %.fca.4.6.gep, align 4
  %.fca.4.7.gep = getelementptr inbounds %MyDecimal, %MyDecimal* %zero, i32 0, i32 4, i32 7
  store i32 0, i32* %.fca.4.7.gep, align 4
  %.fca.4.8.gep = getelementptr inbounds %MyDecimal, %MyDecimal* %zero, i32 0, i32 4, i32 8
  store i32 0, i32* %.fca.4.8.gep, align 4
  br i1 false, label %store.throw, label %store.next

store.throw:                                      ; preds = %entry
  unreachable

store.next:                                       ; preds = %entry
  store i8 %frac, i8* %.fca.1.gep, align 1
  br i1 false, label %store.throw1, label %store.next2

store.throw1:                                     ; preds = %store.next
  unreachable

store.next2:                                      ; preds = %store.next
  store i8 %frac, i8* %.fca.2.gep, align 1
  %.fca.0.load = load i8, i8* %.fca.0.gep, align 4
  %.fca.0.insert = insertvalue %MyDecimal undef, i8 %.fca.0.load, 0
  %.fca.1.load = load i8, i8* %.fca.1.gep, align 1
  %.fca.1.insert = insertvalue %MyDecimal %.fca.0.insert, i8 %.fca.1.load, 1
  %.fca.2.insert = insertvalue %MyDecimal %.fca.1.insert, i8 %frac, 2
  %.fca.3.load = load i1, i1* %.fca.3.gep, align 1
  %.fca.3.insert = insertvalue %MyDecimal %.fca.2.insert, i1 %.fca.3.load, 3
  %.fca.4.0.load = load i32, i32* %.fca.4.0.gep, align 4
  %.fca.4.0.insert = insertvalue %MyDecimal %.fca.3.insert, i32 %.fca.4.0.load, 4, 0
  %.fca.4.1.load = load i32, i32* %.fca.4.1.gep, align 4
  %.fca.4.1.insert = insertvalue %MyDecimal %.fca.4.0.insert, i32 %.fca.4.1.load, 4, 1
  %.fca.4.2.load = load i32, i32* %.fca.4.2.gep, align 4
  %.fca.4.2.insert = insertvalue %MyDecimal %.fca.4.1.insert, i32 %.fca.4.2.load, 4, 2
  %.fca.4.3.load = load i32, i32* %.fca.4.3.gep, align 4
  %.fca.4.3.insert = insertvalue %MyDecimal %.fca.4.2.insert, i32 %.fca.4.3.load, 4, 3
  %.fca.4.4.load = load i32, i32* %.fca.4.4.gep, align 4
  %.fca.4.4.insert = insertvalue %MyDecimal %.fca.4.3.insert, i32 %.fca.4.4.load, 4, 4
  %.fca.4.5.load = load i32, i32* %.fca.4.5.gep, align 4
  %.fca.4.5.insert = insertvalue %MyDecimal %.fca.4.4.insert, i32 %.fca.4.5.load, 4, 5
  %.fca.4.6.load = load i32, i32* %.fca.4.6.gep, align 4
  %.fca.4.6.insert = insertvalue %MyDecimal %.fca.4.5.insert, i32 %.fca.4.6.load, 4, 6
  %.fca.4.7.load = load i32, i32* %.fca.4.7.gep, align 4
  %.fca.4.7.insert = insertvalue %MyDecimal %.fca.4.6.insert, i32 %.fca.4.7.load, 4, 7
  %.fca.4.8.load = load i32, i32* %.fca.4.8.gep, align 4
  %.fca.4.8.insert = insertvalue %MyDecimal %.fca.4.7.insert, i32 %.fca.4.8.load, 4, 8
  ret %MyDecimal %.fca.4.8.insert
}

; Function Attrs: alwaysinline noredzone nounwind
define internal { i32, i32 } @add(i32 %a, i32 %b, i32 %carry) unnamed_addr #0  {
entry:
  %0 = add i32 %a, %b
  %1 = add i32 %0, %carry
  %2 = icmp sge i32 %1, 1000000000
  %3 = sub i32 %1, 1000000000
  %4 = select i1 %2, i32 1, i32 0
  %5 = select i1 %2, i32 %3, i32 %1
  %6 = insertvalue { i32, i32 } zeroinitializer, i32 %5, 0
  %7 = insertvalue { i32, i32 } %6, i32 %4, 1
  ret { i32, i32 } %7
}

; Function Attrs: alwaysinline noredzone nounwind
define internal { i32, i32 } @add2(i32 %a, i32 %b, i32 %carry) unnamed_addr #0  {
entry:
  %0 = sext i32 %a to i64
  %1 = sext i32 %b to i64
  %2 = add i64 %0, %1
  %3 = sext i32 %carry to i64
  %4 = add i64 %2, %3
  %5 = icmp sge i64 %4, 1000000000
  %6 = sub i64 %4, 1000000000
  %7 = select i1 %5, i32 1, i32 0
  %8 = select i1 %5, i64 %6, i64 %4
  %9 = icmp sge i64 %8, 1000000000
  %10 = sub i64 %8, 1000000000
  %11 = add i32 %7, 1
  %12 = select i1 %9, i32 %11, i32 %7
  %13 = select i1 %9, i64 %10, i64 %8
  %14 = trunc i64 %13 to i32
  %15 = insertvalue { i32, i32 } zeroinitializer, i32 %14, 0
  %16 = insertvalue { i32, i32 } %15, i32 %12, 1
  ret { i32, i32 } %16
}

; Function Attrs: alwaysinline noredzone nounwind
define internal i64 @digitsToWords(i64 %digits) unnamed_addr #0  {
entry:
  %0 = add i64 %digits, 9
  %1 = sub i64 %0, 1
  %2 = icmp sge i64 %1, 0
  br i1 %2, label %cond.true, label %if.done

cond.true:                                        ; preds = %entry
  %3 = icmp slt i64 %1, 128
  br i1 %3, label %if.then, label %if.done

if.then:                                          ; preds = %cond.true
  %4 = icmp uge i64 %1, 128
  br i1 %4, label %lookup.throw, label %lookup.next

if.done:                                          ; preds = %cond.true, %entry
  %5 = icmp eq i64 %1, -9223372036854775808
  %6 = sdiv i64 %1, 9
  ret i64 %6

lookup.throw:                                     ; preds = %if.then
  unreachable

lookup.next:                                      ; preds = %if.then
  %7 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i32 0, i64 %1
  %8 = load i64, i64* %7, align 8
  ret i64 %8
}

; Function Attrs: alwaysinline noredzone nounwind
define internal { i64, i64, i32 } @fixWordCntError(i64 %wordsInt, i64 %wordsFrac) unnamed_addr #0  {
entry:
  %0 = add i64 %wordsInt, %wordsFrac
  %1 = load i64, i64* @wordBufLen, align 8
  %2 = icmp sgt i64 %0, %1
  br i1 %2, label %if.then, label %if.done2

if.then:                                          ; preds = %entry
  %3 = icmp sgt i64 %wordsInt, %1
  br i1 %3, label %if.then1, label %if.done

if.then1:                                         ; preds = %if.then
  %4 = insertvalue { i64, i64, i32 } zeroinitializer, i64 %1, 0
  %5 = insertvalue { i64, i64, i32 } %4, i64 0, 1
  %6 = insertvalue { i64, i64, i32 } %5, i32 1, 2
  ret { i64, i64, i32 } %6

if.done:                                          ; preds = %if.then
  %7 = sub i64 %1, %wordsInt
  %8 = insertvalue { i64, i64, i32 } zeroinitializer, i64 %wordsInt, 0
  %9 = insertvalue { i64, i64, i32 } %8, i64 %7, 1
  %10 = insertvalue { i64, i64, i32 } %9, i32 2, 2
  ret { i64, i64, i32 } %10

if.done2:                                         ; preds = %entry
  %11 = insertvalue { i64, i64, i32 } zeroinitializer, i64 %wordsInt, 0
  %12 = insertvalue { i64, i64, i32 } %11, i64 %wordsFrac, 1
  %13 = insertvalue { i64, i64, i32 } %12, i32 0, 2
  ret { i64, i64, i32 } %13
}

; Function Attrs: alwaysinline noredzone nounwind
define internal i64 @countLeadingZeroes(i64 %i, i32 %word) unnamed_addr #0  {
entry:
  br label %for.loop

for.loop:                                         ; preds = %for.body, %entry
  %0 = phi i64 [ %i, %entry ], [ %3, %for.body ]
  %1 = phi i64 [ 0, %entry ], [ %4, %for.body ]
  %2 = icmp uge i64 %0, 10
  br i1 %2, label %lookup.throw, label %lookup.next

for.body:                                         ; preds = %lookup.next
  %3 = sub i64 %0, 1
  %4 = add i64 %1, 1
  br label %for.loop

for.done:                                         ; preds = %lookup.next
  ret i64 %1

lookup.throw:                                     ; preds = %for.loop
  unreachable

lookup.next:                                      ; preds = %for.loop
  %5 = getelementptr inbounds [10 x i32], [10 x i32]* @powers10, i32 0, i64 %0
  %6 = load i32, i32* %5, align 4
  %7 = icmp slt i32 %word, %6
  br i1 %7, label %for.body, label %for.done
}

; Function Attrs: alwaysinline noredzone nounwind
define internal i8 @myMinInt8(i8 %a, i8 %b) unnamed_addr #0  {
entry:
  %0 = icmp slt i8 %a, %b
  %spec.select = select i1 %0, i8 %a, i8 %b
  ret i8 %spec.select
}

; Function Attrs: noredzone nounwind
define i32 @DecimalMul(%MyDecimal* dereferenceable_or_null(40) %from1, %MyDecimal* dereferenceable_or_null(40) %from2, %MyDecimal* dereferenceable_or_null(40) %to) unnamed_addr #0  {
entry:
  %0 = icmp eq %MyDecimal* %from1, null
  br i1 %0, label %gep.throw, label %gep.next

if.then:                                          ; preds = %deref.next93
  br i1 false, label %gep.throw94, label %gep.next95

if.done:                                          ; preds = %store.next97, %deref.next93
  br i1 false, label %gep.throw98, label %gep.next99

if.then1:                                         ; preds = %store.next101, %for.loop33, %for.done31, %for.body19, %if.then14
  %merge = phi i32 [ %86, %store.next101 ], [ 1, %if.then14 ], [ 1, %for.body19 ], [ %86, %for.loop33 ], [ %86, %for.done31 ]
  ret i32 %merge

if.then3:                                         ; preds = %store.next101
  br i1 false, label %gep.throw102, label %gep.next103

if.then4:                                         ; preds = %deref.next105
  br i1 false, label %gep.throw106, label %gep.next107

if.done5:                                         ; preds = %store.next109, %deref.next105
  br i1 false, label %gep.throw110, label %gep.next111

if.then6:                                         ; preds = %deref.next113
  br i1 false, label %gep.throw114, label %gep.next115

if.done7:                                         ; preds = %store.next117, %deref.next113
  %1 = icmp sgt i64 %73, %84
  br i1 %1, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.done7
  %2 = sub i64 %73, %84
  %3 = ashr i64 %2, 1
  %4 = sub i64 %2, %3
  %5 = sub i64 %63, %4
  br label %if.done11

if.else:                                          ; preds = %if.done7
  %6 = sub i64 %74, %85
  %7 = ashr i64 %6, 1
  %8 = icmp sle i64 %58, %67
  br i1 %8, label %if.then9, label %if.else10

if.then9:                                         ; preds = %if.else
  %9 = sub i64 %58, %7
  %10 = sub i64 %6, %7
  %11 = sub i64 %67, %10
  br label %if.done11

if.else10:                                        ; preds = %if.else
  %12 = sub i64 %67, %7
  %13 = sub i64 %6, %7
  %14 = sub i64 %58, %13
  br label %if.done11

if.done11:                                        ; preds = %store.next101, %if.else10, %if.then9, %if.then8
  %15 = phi i64 [ 0, %if.then8 ], [ %9, %if.then9 ], [ %14, %if.else10 ], [ %58, %store.next101 ]
  %16 = phi i64 [ %5, %if.then8 ], [ %63, %if.then9 ], [ %63, %if.else10 ], [ %63, %store.next101 ]
  %17 = phi i64 [ 0, %if.then8 ], [ %11, %if.then9 ], [ %12, %if.else10 ], [ %67, %store.next101 ]
  %18 = add i64 %84, %85
  %19 = sub i64 %18, 1
  %20 = add i64 %63, %17
  %21 = sub i64 %20, 1
  %22 = sub i64 %63, %16
  br i1 false, label %gep.throw118, label %gep.next119

for.loop:                                         ; preds = %store.next121, %for.done22
  %23 = phi i64 [ %111, %store.next121 ], [ %39, %for.done22 ]
  %24 = phi i64 [ %19, %store.next121 ], [ %38, %for.done22 ]
  %25 = icmp sge i64 %23, 0
  br i1 %25, label %for.loop12, label %for.done23

for.loop12:                                       ; preds = %lookup.next143, %for.loop
  %26 = phi i64 [ %137, %lookup.next143 ], [ %21, %for.loop ]
  %27 = phi i64 [ %138, %lookup.next143 ], [ %24, %for.loop ]
  %28 = phi i32 [ %136, %lookup.next143 ], [ 0, %for.loop ]
  %29 = icmp sge i64 %26, %22
  br i1 %29, label %for.body13, label %for.done

for.body13:                                       ; preds = %for.loop12
  br i1 false, label %gep.throw122, label %gep.next123

for.done:                                         ; preds = %for.loop12
  %30 = icmp sgt i32 %28, 0
  br i1 %30, label %if.then14, label %if.done17

if.then14:                                        ; preds = %for.done
  %31 = icmp slt i64 %27, 0
  br i1 %31, label %if.then1, label %if.done16

if.done16:                                        ; preds = %if.then14
  br i1 false, label %gep.throw144, label %gep.next145

if.done17:                                        ; preds = %lookup.next155, %for.done
  %32 = phi i32 [ %28, %for.done ], [ %144, %lookup.next155 ]
  %33 = sub i64 %27, 1
  br label %for.loop18

for.loop18:                                       ; preds = %lookup.next167, %if.done17
  %34 = phi i64 [ %33, %if.done17 ], [ %151, %lookup.next167 ]
  %35 = phi i32 [ %32, %if.done17 ], [ %150, %lookup.next167 ]
  %36 = icmp sgt i32 %35, 0
  br i1 %36, label %for.body19, label %for.done22

for.body19:                                       ; preds = %for.loop18
  %37 = icmp slt i64 %34, 0
  br i1 %37, label %if.then1, label %if.done21

if.done21:                                        ; preds = %for.body19
  br i1 false, label %gep.throw156, label %gep.next157

for.done22:                                       ; preds = %for.loop18
  %38 = sub i64 %24, 1
  %39 = sub i64 %23, 1
  br label %for.loop

for.done23:                                       ; preds = %for.loop
  br i1 false, label %gep.throw168, label %gep.next169

if.then24:                                        ; preds = %deref.next171
  br label %for.body25

for.body25:                                       ; preds = %if.done26, %if.then24
  %40 = phi i64 [ 0, %if.then24 ], [ %41, %if.done26 ]
  br i1 false, label %gep.throw172, label %gep.next173

if.done26:                                        ; preds = %lookup.next177
  %41 = add i64 %40, 1
  %42 = icmp eq i64 %41, %18
  br i1 %42, label %if.then27, label %for.body25

if.then27:                                        ; preds = %if.done26
  br i1 false, label %gep.throw178, label %gep.next179

if.done28:                                        ; preds = %store.next183, %lookup.next177, %deref.next171
  br i1 false, label %gep.throw184, label %gep.next185

for.loop29:                                       ; preds = %deref.next201, %deref.next187
  %43 = phi i64 [ 0, %deref.next187 ], [ %45, %deref.next201 ]
  %44 = phi i64 [ %162, %deref.next187 ], [ %170, %deref.next201 ]
  br i1 false, label %gep.throw188, label %gep.next189

cond.true:                                        ; preds = %lookup.next193
  br i1 false, label %gep.throw194, label %gep.next195

for.body30:                                       ; preds = %deref.next197
  %45 = add i64 %43, 1
  br i1 false, label %gep.throw198, label %gep.next199

for.done31:                                       ; preds = %deref.next197, %lookup.next193
  %46 = icmp sgt i64 %43, 0
  br i1 %46, label %for.loop33, label %if.then1

for.loop33:                                       ; preds = %lookup.next215, %for.done31
  %47 = phi i64 [ %177, %lookup.next215 ], [ %43, %for.done31 ]
  %48 = phi i64 [ %178, %lookup.next215 ], [ %44, %for.done31 ]
  %49 = phi i64 [ %176, %lookup.next215 ], [ 0, %for.done31 ]
  %50 = icmp sgt i64 %48, 0
  br i1 %50, label %for.body34, label %if.then1

for.body34:                                       ; preds = %for.loop33
  br i1 false, label %gep.throw204, label %gep.next205

gep.throw:                                        ; preds = %entry
  unreachable

gep.next:                                         ; preds = %entry
  %51 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 0
  br i1 false, label %deref.throw, label %deref.next

deref.throw:                                      ; preds = %gep.next
  unreachable

deref.next:                                       ; preds = %gep.next
  %52 = load i8, i8* %51, align 1
  %53 = sext i8 %52 to i64
  %54 = call i64 @digitsToWords(i64 %53)
  br i1 false, label %gep.throw36, label %gep.next37

gep.throw36:                                      ; preds = %deref.next
  unreachable

gep.next37:                                       ; preds = %deref.next
  %55 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 1
  br i1 false, label %deref.throw38, label %deref.next39

deref.throw38:                                    ; preds = %gep.next37
  unreachable

deref.next39:                                     ; preds = %gep.next37
  %56 = load i8, i8* %55, align 1
  %57 = sext i8 %56 to i64
  %58 = call i64 @digitsToWords(i64 %57)
  %59 = icmp eq %MyDecimal* %from2, null
  br i1 %59, label %gep.throw40, label %gep.next41

gep.throw40:                                      ; preds = %deref.next39
  unreachable

gep.next41:                                       ; preds = %deref.next39
  %60 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i32 0, i32 0
  br i1 false, label %deref.throw42, label %deref.next43

deref.throw42:                                    ; preds = %gep.next41
  unreachable

deref.next43:                                     ; preds = %gep.next41
  %61 = load i8, i8* %60, align 1
  %62 = sext i8 %61 to i64
  %63 = call i64 @digitsToWords(i64 %62)
  br i1 false, label %gep.throw44, label %gep.next45

gep.throw44:                                      ; preds = %deref.next43
  unreachable

gep.next45:                                       ; preds = %deref.next43
  %64 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i32 0, i32 1
  br i1 false, label %deref.throw46, label %deref.next47

deref.throw46:                                    ; preds = %gep.next45
  unreachable

deref.next47:                                     ; preds = %gep.next45
  %65 = load i8, i8* %64, align 1
  %66 = sext i8 %65 to i64
  %67 = call i64 @digitsToWords(i64 %66)
  br i1 false, label %gep.throw48, label %gep.next49

gep.throw48:                                      ; preds = %deref.next47
  unreachable

gep.next49:                                       ; preds = %deref.next47
  br i1 false, label %deref.throw50, label %deref.next51

deref.throw50:                                    ; preds = %gep.next49
  unreachable

deref.next51:                                     ; preds = %gep.next49
  %68 = load i8, i8* %51, align 1
  %69 = sext i8 %68 to i64
  br i1 false, label %gep.throw52, label %gep.next53

gep.throw52:                                      ; preds = %deref.next51
  unreachable

gep.next53:                                       ; preds = %deref.next51
  br i1 false, label %deref.throw54, label %deref.next55

deref.throw54:                                    ; preds = %gep.next53
  unreachable

deref.next55:                                     ; preds = %gep.next53
  %70 = load i8, i8* %60, align 1
  %71 = sext i8 %70 to i64
  %72 = add i64 %69, %71
  %73 = call i64 @digitsToWords(i64 %72)
  %74 = add i64 %58, %67
  %75 = icmp eq %MyDecimal* %to, null
  br i1 %75, label %gep.throw56, label %gep.next57

gep.throw56:                                      ; preds = %deref.next55
  unreachable

gep.next57:                                       ; preds = %deref.next55
  %76 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 2
  br i1 false, label %gep.throw58, label %gep.next59

gep.throw58:                                      ; preds = %gep.next57
  unreachable

gep.next59:                                       ; preds = %gep.next57
  %77 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 2
  br i1 false, label %deref.throw60, label %deref.next61

deref.throw60:                                    ; preds = %gep.next59
  unreachable

deref.next61:                                     ; preds = %gep.next59
  %78 = load i8, i8* %77, align 1
  br i1 false, label %gep.throw62, label %gep.next63

gep.throw62:                                      ; preds = %deref.next61
  unreachable

gep.next63:                                       ; preds = %deref.next61
  %79 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i32 0, i32 2
  br i1 false, label %deref.throw64, label %deref.next65

deref.throw64:                                    ; preds = %gep.next63
  unreachable

deref.next65:                                     ; preds = %gep.next63
  %80 = load i8, i8* %79, align 1
  %81 = add i8 %78, %80
  %82 = call i8 @myMinInt8(i8 %81, i8 30)
  br i1 false, label %store.throw, label %store.next

store.throw:                                      ; preds = %deref.next65
  unreachable

store.next:                                       ; preds = %deref.next65
  store i8 %82, i8* %76, align 1
  %83 = call { i64, i64, i32 } @fixWordCntError(i64 %73, i64 %74)
  %84 = extractvalue { i64, i64, i32 } %83, 0
  %85 = extractvalue { i64, i64, i32 } %83, 1
  %86 = extractvalue { i64, i64, i32 } %83, 2
  br i1 false, label %gep.throw66, label %gep.next67

gep.throw66:                                      ; preds = %store.next
  unreachable

gep.next67:                                       ; preds = %store.next
  %87 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 3
  br i1 false, label %gep.throw68, label %gep.next69

gep.throw68:                                      ; preds = %gep.next67
  unreachable

gep.next69:                                       ; preds = %gep.next67
  %88 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 3
  br i1 false, label %deref.throw70, label %deref.next71

deref.throw70:                                    ; preds = %gep.next69
  unreachable

deref.next71:                                     ; preds = %gep.next69
  %89 = load i1, i1* %88, align 1
  br i1 false, label %gep.throw72, label %gep.next73

gep.throw72:                                      ; preds = %deref.next71
  unreachable

gep.next73:                                       ; preds = %deref.next71
  %90 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i32 0, i32 3
  br i1 false, label %deref.throw74, label %deref.next75

deref.throw74:                                    ; preds = %gep.next73
  unreachable

deref.next75:                                     ; preds = %gep.next73
  %91 = load i1, i1* %90, align 1
  %92 = icmp ne i1 %89, %91
  br i1 false, label %store.throw76, label %store.next77

store.throw76:                                    ; preds = %deref.next75
  unreachable

store.next77:                                     ; preds = %deref.next75
  store i1 %92, i1* %87, align 1
  br i1 false, label %gep.throw78, label %gep.next79

gep.throw78:                                      ; preds = %store.next77
  unreachable

gep.next79:                                       ; preds = %store.next77
  %93 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 1
  br i1 false, label %gep.throw80, label %gep.next81

gep.throw80:                                      ; preds = %gep.next79
  unreachable

gep.next81:                                       ; preds = %gep.next79
  br i1 false, label %deref.throw82, label %deref.next83

deref.throw82:                                    ; preds = %gep.next81
  unreachable

deref.next83:                                     ; preds = %gep.next81
  %94 = load i8, i8* %55, align 1
  br i1 false, label %gep.throw84, label %gep.next85

gep.throw84:                                      ; preds = %deref.next83
  unreachable

gep.next85:                                       ; preds = %deref.next83
  br i1 false, label %deref.throw86, label %deref.next87

deref.throw86:                                    ; preds = %gep.next85
  unreachable

deref.next87:                                     ; preds = %gep.next85
  %95 = load i8, i8* %64, align 1
  %96 = add i8 %94, %95
  br i1 false, label %store.throw88, label %store.next89

store.throw88:                                    ; preds = %deref.next87
  unreachable

store.next89:                                     ; preds = %deref.next87
  store i8 %96, i8* %93, align 1
  br i1 false, label %gep.throw90, label %gep.next91

gep.throw90:                                      ; preds = %store.next89
  unreachable

gep.next91:                                       ; preds = %store.next89
  br i1 false, label %deref.throw92, label %deref.next93

deref.throw92:                                    ; preds = %gep.next91
  unreachable

deref.next93:                                     ; preds = %gep.next91
  %97 = icmp sgt i8 %96, 31
  br i1 %97, label %if.then, label %if.done

gep.throw94:                                      ; preds = %if.then
  unreachable

gep.next95:                                       ; preds = %if.then
  br i1 false, label %store.throw96, label %store.next97

store.throw96:                                    ; preds = %gep.next95
  unreachable

store.next97:                                     ; preds = %gep.next95
  store i8 31, i8* %93, align 1
  br label %if.done

gep.throw98:                                      ; preds = %if.done
  unreachable

gep.next99:                                       ; preds = %if.done
  %98 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 0
  %99 = mul i64 %84, 9
  %100 = trunc i64 %99 to i8
  %101 = icmp eq i8* %98, null
  br i1 %101, label %store.throw100, label %store.next101

store.throw100:                                   ; preds = %gep.next99
  unreachable

store.next101:                                    ; preds = %gep.next99
  store i8 %100, i8* %98, align 1
  switch i32 %86, label %if.then3 [
    i32 1, label %if.then1
    i32 0, label %if.done11
  ]

gep.throw102:                                     ; preds = %if.then3
  unreachable

gep.next103:                                      ; preds = %if.then3
  br i1 false, label %deref.throw104, label %deref.next105

deref.throw104:                                   ; preds = %gep.next103
  unreachable

deref.next105:                                    ; preds = %gep.next103
  %102 = load i8, i8* %93, align 1
  %103 = mul i64 %85, 9
  %104 = trunc i64 %103 to i8
  %105 = icmp sgt i8 %102, %104
  br i1 %105, label %if.then4, label %if.done5

gep.throw106:                                     ; preds = %if.then4
  unreachable

gep.next107:                                      ; preds = %if.then4
  br i1 false, label %store.throw108, label %store.next109

store.throw108:                                   ; preds = %gep.next107
  unreachable

store.next109:                                    ; preds = %gep.next107
  store i8 %104, i8* %93, align 1
  br label %if.done5

gep.throw110:                                     ; preds = %if.done5
  unreachable

gep.next111:                                      ; preds = %if.done5
  br i1 false, label %deref.throw112, label %deref.next113

deref.throw112:                                   ; preds = %gep.next111
  unreachable

deref.next113:                                    ; preds = %gep.next111
  %106 = load i8, i8* %98, align 1
  %107 = icmp sgt i8 %106, %100
  br i1 %107, label %if.then6, label %if.done7

gep.throw114:                                     ; preds = %if.then6
  unreachable

gep.next115:                                      ; preds = %if.then6
  br i1 false, label %store.throw116, label %store.next117

store.throw116:                                   ; preds = %gep.next115
  unreachable

store.next117:                                    ; preds = %gep.next115
  store i8 %100, i8* %98, align 1
  br label %if.done7

gep.throw118:                                     ; preds = %if.done11
  unreachable

gep.next119:                                      ; preds = %if.done11
  %108 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  %109 = load [9 x i32], [9 x i32]* getelementptr inbounds (%MyDecimal, %MyDecimal* @zeroMyDecimal, i32 0, i32 4), align 4
  br i1 false, label %store.throw120, label %store.next121

store.throw120:                                   ; preds = %gep.next119
  unreachable

store.next121:                                    ; preds = %gep.next119
  store [9 x i32] %109, [9 x i32]* %108, align 4
  %110 = sub i64 %15, 1
  %111 = add i64 %54, %110
  br label %for.loop

gep.throw122:                                     ; preds = %for.body13
  unreachable

gep.next123:                                      ; preds = %for.body13
  %112 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 4
  br i1 false, label %gep.throw124, label %gep.next125

gep.throw124:                                     ; preds = %gep.next123
  unreachable

gep.next125:                                      ; preds = %gep.next123
  %113 = icmp uge i64 %23, 9
  br i1 %113, label %lookup.throw, label %lookup.next

lookup.throw:                                     ; preds = %gep.next125
  unreachable

lookup.next:                                      ; preds = %gep.next125
  %114 = getelementptr inbounds [9 x i32], [9 x i32]* %112, i32 0, i64 %23
  %115 = load i32, i32* %114, align 4
  %116 = sext i32 %115 to i64
  br i1 false, label %gep.throw126, label %gep.next127

gep.throw126:                                     ; preds = %lookup.next
  unreachable

gep.next127:                                      ; preds = %lookup.next
  %117 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i32 0, i32 4
  br i1 false, label %gep.throw128, label %gep.next129

gep.throw128:                                     ; preds = %gep.next127
  unreachable

gep.next129:                                      ; preds = %gep.next127
  %118 = icmp uge i64 %26, 9
  br i1 %118, label %lookup.throw130, label %lookup.next131

lookup.throw130:                                  ; preds = %gep.next129
  unreachable

lookup.next131:                                   ; preds = %gep.next129
  %119 = getelementptr inbounds [9 x i32], [9 x i32]* %117, i32 0, i64 %26
  %120 = load i32, i32* %119, align 4
  %121 = sext i32 %120 to i64
  %122 = mul i64 %116, %121
  %123 = icmp eq i64 %122, -9223372036854775808
  %124 = sdiv i64 %122, 1000000000
  %125 = trunc i64 %124 to i32
  %126 = sext i32 %125 to i64
  %127 = mul i64 %126, 1000000000
  %128 = sub i64 %122, %127
  %129 = trunc i64 %128 to i32
  br i1 false, label %gep.throw132, label %gep.next133

gep.throw132:                                     ; preds = %lookup.next131
  unreachable

gep.next133:                                      ; preds = %lookup.next131
  br i1 false, label %gep.throw134, label %gep.next135

gep.throw134:                                     ; preds = %gep.next133
  unreachable

gep.next135:                                      ; preds = %gep.next133
  %130 = icmp uge i64 %27, 9
  br i1 %130, label %lookup.throw136, label %lookup.next137

lookup.throw136:                                  ; preds = %gep.next135
  unreachable

lookup.next137:                                   ; preds = %gep.next135
  %131 = getelementptr inbounds [9 x i32], [9 x i32]* %108, i32 0, i64 %27
  br i1 false, label %gep.throw138, label %gep.next139

gep.throw138:                                     ; preds = %lookup.next137
  unreachable

gep.next139:                                      ; preds = %lookup.next137
  br i1 false, label %gep.throw140, label %gep.next141

gep.throw140:                                     ; preds = %gep.next139
  unreachable

gep.next141:                                      ; preds = %gep.next139
  br i1 false, label %lookup.throw142, label %lookup.next143

lookup.throw142:                                  ; preds = %gep.next141
  unreachable

lookup.next143:                                   ; preds = %gep.next141
  %132 = load i32, i32* %131, align 4
  %133 = call { i32, i32 } @add2(i32 %132, i32 %129, i32 %28)
  %134 = extractvalue { i32, i32 } %133, 0
  store i32 %134, i32* %131, align 4
  %135 = extractvalue { i32, i32 } %133, 1
  %136 = add i32 %135, %125
  %137 = sub i64 %26, 1
  %138 = sub i64 %27, 1
  br label %for.loop12

gep.throw144:                                     ; preds = %if.done16
  unreachable

gep.next145:                                      ; preds = %if.done16
  br i1 false, label %gep.throw146, label %gep.next147

gep.throw146:                                     ; preds = %gep.next145
  unreachable

gep.next147:                                      ; preds = %gep.next145
  %139 = icmp uge i64 %27, 9
  br i1 %139, label %lookup.throw148, label %lookup.next149

lookup.throw148:                                  ; preds = %gep.next147
  unreachable

lookup.next149:                                   ; preds = %gep.next147
  %140 = getelementptr inbounds [9 x i32], [9 x i32]* %108, i32 0, i64 %27
  br i1 false, label %gep.throw150, label %gep.next151

gep.throw150:                                     ; preds = %lookup.next149
  unreachable

gep.next151:                                      ; preds = %lookup.next149
  br i1 false, label %gep.throw152, label %gep.next153

gep.throw152:                                     ; preds = %gep.next151
  unreachable

gep.next153:                                      ; preds = %gep.next151
  br i1 false, label %lookup.throw154, label %lookup.next155

lookup.throw154:                                  ; preds = %gep.next153
  unreachable

lookup.next155:                                   ; preds = %gep.next153
  %141 = load i32, i32* %140, align 4
  %142 = call { i32, i32 } @add2(i32 %141, i32 0, i32 %28)
  %143 = extractvalue { i32, i32 } %142, 0
  store i32 %143, i32* %140, align 4
  %144 = extractvalue { i32, i32 } %142, 1
  br label %if.done17

gep.throw156:                                     ; preds = %if.done21
  unreachable

gep.next157:                                      ; preds = %if.done21
  br i1 false, label %gep.throw158, label %gep.next159

gep.throw158:                                     ; preds = %gep.next157
  unreachable

gep.next159:                                      ; preds = %gep.next157
  %145 = icmp uge i64 %34, 9
  br i1 %145, label %lookup.throw160, label %lookup.next161

lookup.throw160:                                  ; preds = %gep.next159
  unreachable

lookup.next161:                                   ; preds = %gep.next159
  %146 = getelementptr inbounds [9 x i32], [9 x i32]* %108, i32 0, i64 %34
  br i1 false, label %gep.throw162, label %gep.next163

gep.throw162:                                     ; preds = %lookup.next161
  unreachable

gep.next163:                                      ; preds = %lookup.next161
  br i1 false, label %gep.throw164, label %gep.next165

gep.throw164:                                     ; preds = %gep.next163
  unreachable

gep.next165:                                      ; preds = %gep.next163
  br i1 false, label %lookup.throw166, label %lookup.next167

lookup.throw166:                                  ; preds = %gep.next165
  unreachable

lookup.next167:                                   ; preds = %gep.next165
  %147 = load i32, i32* %146, align 4
  %148 = call { i32, i32 } @add(i32 %147, i32 0, i32 %35)
  %149 = extractvalue { i32, i32 } %148, 0
  store i32 %149, i32* %146, align 4
  %150 = extractvalue { i32, i32 } %148, 1
  %151 = sub i64 %34, 1
  br label %for.loop18

gep.throw168:                                     ; preds = %for.done23
  unreachable

gep.next169:                                      ; preds = %for.done23
  br i1 false, label %deref.throw170, label %deref.next171

deref.throw170:                                   ; preds = %gep.next169
  unreachable

deref.next171:                                    ; preds = %gep.next169
  %152 = load i1, i1* %87, align 1
  br i1 %152, label %if.then24, label %if.done28

gep.throw172:                                     ; preds = %for.body25
  unreachable

gep.next173:                                      ; preds = %for.body25
  br i1 false, label %gep.throw174, label %gep.next175

gep.throw174:                                     ; preds = %gep.next173
  unreachable

gep.next175:                                      ; preds = %gep.next173
  %153 = icmp uge i64 %40, 9
  br i1 %153, label %lookup.throw176, label %lookup.next177

lookup.throw176:                                  ; preds = %gep.next175
  unreachable

lookup.next177:                                   ; preds = %gep.next175
  %154 = getelementptr inbounds [9 x i32], [9 x i32]* %108, i32 0, i64 %40
  %155 = load i32, i32* %154, align 4
  %156 = icmp ne i32 %155, 0
  br i1 %156, label %if.done28, label %if.done26

gep.throw178:                                     ; preds = %if.then27
  unreachable

gep.next179:                                      ; preds = %if.then27
  br i1 false, label %deref.throw180, label %deref.next181

deref.throw180:                                   ; preds = %gep.next179
  unreachable

deref.next181:                                    ; preds = %gep.next179
  %157 = load i8, i8* %76, align 1
  %158 = call %MyDecimal @zeroMyDecimalWithFrac(i8 %157)
  br i1 false, label %store.throw182, label %store.next183

store.throw182:                                   ; preds = %deref.next181
  unreachable

store.next183:                                    ; preds = %deref.next181
  store %MyDecimal %158, %MyDecimal* %to, align 4
  br label %if.done28

gep.throw184:                                     ; preds = %if.done28
  unreachable

gep.next185:                                      ; preds = %if.done28
  br i1 false, label %deref.throw186, label %deref.next187

deref.throw186:                                   ; preds = %gep.next185
  unreachable

deref.next187:                                    ; preds = %gep.next185
  %159 = load i8, i8* %93, align 1
  %160 = sext i8 %159 to i64
  %161 = call i64 @digitsToWords(i64 %160)
  %162 = add i64 %84, %161
  br label %for.loop29

gep.throw188:                                     ; preds = %for.loop29
  unreachable

gep.next189:                                      ; preds = %for.loop29
  br i1 false, label %gep.throw190, label %gep.next191

gep.throw190:                                     ; preds = %gep.next189
  unreachable

gep.next191:                                      ; preds = %gep.next189
  %163 = icmp uge i64 %43, 9
  br i1 %163, label %lookup.throw192, label %lookup.next193

lookup.throw192:                                  ; preds = %gep.next191
  unreachable

lookup.next193:                                   ; preds = %gep.next191
  %164 = getelementptr inbounds [9 x i32], [9 x i32]* %108, i32 0, i64 %43
  %165 = load i32, i32* %164, align 4
  %166 = icmp eq i32 %165, 0
  br i1 %166, label %cond.true, label %for.done31

gep.throw194:                                     ; preds = %cond.true
  unreachable

gep.next195:                                      ; preds = %cond.true
  br i1 false, label %deref.throw196, label %deref.next197

deref.throw196:                                   ; preds = %gep.next195
  unreachable

deref.next197:                                    ; preds = %gep.next195
  %167 = load i8, i8* %98, align 1
  %168 = icmp sgt i8 %167, 9
  br i1 %168, label %for.body30, label %for.done31

gep.throw198:                                     ; preds = %for.body30
  unreachable

gep.next199:                                      ; preds = %for.body30
  br i1 false, label %deref.throw200, label %deref.next201

deref.throw200:                                   ; preds = %gep.next199
  unreachable

deref.next201:                                    ; preds = %gep.next199
  %169 = sub i8 %167, 9
  store i8 %169, i8* %98, align 1
  %170 = sub i64 %44, 1
  br label %for.loop29

gep.throw204:                                     ; preds = %for.body34
  unreachable

gep.next205:                                      ; preds = %for.body34
  br i1 false, label %gep.throw206, label %gep.next207

gep.throw206:                                     ; preds = %gep.next205
  unreachable

gep.next207:                                      ; preds = %gep.next205
  %171 = icmp uge i64 %49, 9
  br i1 %171, label %lookup.throw208, label %lookup.next209

lookup.throw208:                                  ; preds = %gep.next207
  unreachable

lookup.next209:                                   ; preds = %gep.next207
  %172 = getelementptr inbounds [9 x i32], [9 x i32]* %108, i32 0, i64 %49
  br i1 false, label %gep.throw210, label %gep.next211

gep.throw210:                                     ; preds = %lookup.next209
  unreachable

gep.next211:                                      ; preds = %lookup.next209
  br i1 false, label %gep.throw212, label %gep.next213

gep.throw212:                                     ; preds = %gep.next211
  unreachable

gep.next213:                                      ; preds = %gep.next211
  %173 = icmp uge i64 %47, 9
  br i1 %173, label %lookup.throw214, label %lookup.next215

lookup.throw214:                                  ; preds = %gep.next213
  unreachable

lookup.next215:                                   ; preds = %gep.next213
  %174 = getelementptr inbounds [9 x i32], [9 x i32]* %108, i32 0, i64 %47
  %175 = load i32, i32* %174, align 4
  store i32 %175, i32* %172, align 4
  %176 = add i64 %49, 1
  %177 = add i64 %47, 1
  %178 = sub i64 %48, 1
  br label %for.loop33
}

; Function Attrs: alwaysinline noredzone nounwind
define internal { %MyDecimal*, %MyDecimal*, %MyDecimal* } @validateArgs(%MyDecimal* dereferenceable_or_null(40) %f1, %MyDecimal* dereferenceable_or_null(40) %f2, %MyDecimal* dereferenceable_or_null(40) %to) unnamed_addr #0 {
entry:
  %0 = icmp eq %MyDecimal* %to, null
  br i1 %0, label %gep.throw, label %gep.next

rangeindex.loop:                                  ; preds = %lookup.next, %deref.next
  %1 = phi i64 [ -1, %deref.next ], [ %2, %lookup.next ]
  %2 = add i64 %1, 1
  %3 = icmp slt i64 %2, 9
  br i1 %3, label %rangeindex.body, label %rangeindex.done

rangeindex.body:                                  ; preds = %rangeindex.loop
  br i1 false, label %gep.throw15, label %gep.next16

rangeindex.done:                                  ; preds = %rangeindex.loop
  %4 = insertvalue { %MyDecimal*, %MyDecimal*, %MyDecimal* } zeroinitializer, %MyDecimal* %f1, 0
  %5 = insertvalue { %MyDecimal*, %MyDecimal*, %MyDecimal* } %4, %MyDecimal* %f2, 1
  %6 = insertvalue { %MyDecimal*, %MyDecimal*, %MyDecimal* } %5, %MyDecimal* %to, 2
  ret { %MyDecimal*, %MyDecimal*, %MyDecimal* } %6

gep.throw:                                        ; preds = %entry
  unreachable

gep.next:                                         ; preds = %entry
  %7 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 1
  br i1 false, label %store.throw, label %store.next

store.throw:                                      ; preds = %gep.next
  unreachable

store.next:                                       ; preds = %gep.next
  store i8 0, i8* %7, align 1
  br i1 false, label %gep.throw1, label %gep.next2

gep.throw1:                                       ; preds = %store.next
  unreachable

gep.next2:                                        ; preds = %store.next
  %8 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 0
  br i1 false, label %store.throw3, label %store.next4

store.throw3:                                     ; preds = %gep.next2
  unreachable

store.next4:                                      ; preds = %gep.next2
  store i8 0, i8* %8, align 1
  br i1 false, label %gep.throw5, label %gep.next6

gep.throw5:                                       ; preds = %store.next4
  unreachable

gep.next6:                                        ; preds = %store.next4
  %9 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 2
  br i1 false, label %store.throw7, label %store.next8

store.throw7:                                     ; preds = %gep.next6
  unreachable

store.next8:                                      ; preds = %gep.next6
  store i8 0, i8* %9, align 1
  br i1 false, label %gep.throw9, label %gep.next10

gep.throw9:                                       ; preds = %store.next8
  unreachable

gep.next10:                                       ; preds = %store.next8
  %10 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 3
  br i1 false, label %store.throw11, label %store.next12

store.throw11:                                    ; preds = %gep.next10
  unreachable

store.next12:                                     ; preds = %gep.next10
  store i1 false, i1* %10, align 1
  br i1 false, label %gep.throw13, label %gep.next14

gep.throw13:                                      ; preds = %store.next12
  unreachable

gep.next14:                                       ; preds = %store.next12
  %11 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %deref.throw, label %deref.next

deref.throw:                                      ; preds = %gep.next14
  unreachable

deref.next:                                       ; preds = %gep.next14
  br label %rangeindex.loop

gep.throw15:                                      ; preds = %rangeindex.body
  unreachable

gep.next16:                                       ; preds = %rangeindex.body
  br i1 false, label %gep.throw17, label %gep.next18

gep.throw17:                                      ; preds = %gep.next16
  unreachable

gep.next18:                                       ; preds = %gep.next16
  %12 = icmp uge i64 %2, 9
  br i1 %12, label %lookup.throw, label %lookup.next

lookup.throw:                                     ; preds = %gep.next18
  unreachable

lookup.next:                                      ; preds = %gep.next18
  %13 = getelementptr inbounds [9 x i32], [9 x i32]* %11, i32 0, i64 %2
  store i32 0, i32* %13, align 4
  br label %rangeindex.loop
}

; Function Attrs: alwaysinline noredzone nounwind
define internal { i64, i32 } @doSub(%MyDecimal* dereferenceable_or_null(40) %from1, %MyDecimal* dereferenceable_or_null(40) %from2, %MyDecimal* dereferenceable_or_null(40) %to, i8* %context, i8* %parentHandle) unnamed_addr #0  {
entry:
  %0 = icmp eq %MyDecimal* %from1, null
  br i1 %0, label %gep.throw, label %gep.next

for.loop:                                         ; preds = %gep.next81, %for.body
  %1 = phi i64 [ 0, %gep.next81 ], [ %3, %for.body ]
  %2 = icmp slt i64 %1, %118
  br i1 %2, label %cond.true, label %for.done

cond.true:                                        ; preds = %for.loop
  br i1 false, label %gep.throw82, label %gep.next83

for.body:                                         ; preds = %lookup.next
  %3 = add i64 %1, 1
  br label %for.loop

for.done:                                         ; preds = %lookup.next, %for.loop
  %4 = sub i64 %118, %1
  br label %if.done

if.done:                                          ; preds = %gep.next81, %for.done
  %5 = phi i64 [ %118, %gep.next81 ], [ %4, %for.done ]
  %6 = phi i64 [ 0, %gep.next81 ], [ %1, %for.done ]
  br i1 false, label %gep.throw86, label %gep.next87

for.loop1:                                        ; preds = %gep.next89, %for.body3
  %7 = phi i64 [ 0, %gep.next89 ], [ %9, %for.body3 ]
  %8 = icmp slt i64 %7, %127
  br i1 %8, label %cond.true2, label %for.done4

cond.true2:                                       ; preds = %for.loop1
  br i1 false, label %gep.throw90, label %gep.next91

for.body3:                                        ; preds = %lookup.next95
  %9 = add i64 %7, 1
  br label %for.loop1

for.done4:                                        ; preds = %lookup.next95, %for.loop1
  %10 = sub i64 %127, %7
  br label %if.done5

if.done5:                                         ; preds = %gep.next89, %for.done4
  %11 = phi i64 [ %127, %gep.next89 ], [ %10, %for.done4 ]
  %12 = phi i64 [ 0, %gep.next89 ], [ %7, %for.done4 ]
  %13 = icmp sgt i64 %11, %5
  br i1 %13, label %if.done6, label %if.else43

if.done6:                                         ; preds = %lookup.next269, %if.else61, %if.else60, %if.else43, %if.done5
  %14 = phi i64 [ %122, %if.else43 ], [ %105, %if.else60 ], [ %122, %if.done5 ], [ %105, %lookup.next269 ], [ %105, %if.else61 ]
  %15 = phi i64 [ %131, %if.else43 ], [ %107, %if.else60 ], [ %131, %if.done5 ], [ %107, %lookup.next269 ], [ %107, %if.else61 ]
  %16 = phi i32 [ 0, %if.else43 ], [ 0, %if.else60 ], [ 1, %if.done5 ], [ 1, %lookup.next269 ], [ 1, %if.else61 ]
  %17 = icmp eq %MyDecimal* %to, null
  br i1 %17, label %if.then7, label %gep.next101

if.then7:                                         ; preds = %if.done6
  %18 = icmp sgt i32 %16, 0
  br i1 false, label %gep.throw96, label %gep.next97

if.then8:                                         ; preds = %deref.next99, %if.else63
  %merge = phi { i64, i32 } [ zeroinitializer, %if.else63 ], [ %spec.select278, %deref.next99 ]
  ret { i64, i32 } %merge

if.then11:                                        ; preds = %store.next
  br i1 false, label %gep.throw106, label %gep.next107

if.done12:                                        ; preds = %store.next113, %store.next
  %19 = phi %MyDecimal* [ %from1, %store.next ], [ %from2, %store.next113 ]
  %20 = phi %MyDecimal* [ %from2, %store.next ], [ %from1, %store.next113 ]
  %21 = phi i64 [ %5, %store.next ], [ %11, %store.next113 ]
  %22 = phi i64 [ %14, %store.next ], [ %15, %store.next113 ]
  %23 = phi i64 [ %11, %store.next ], [ %5, %store.next113 ]
  %24 = phi i64 [ %15, %store.next ], [ %14, %store.next113 ]
  %25 = phi i64 [ %6, %store.next ], [ %12, %store.next113 ]
  %26 = phi i64 [ %12, %store.next ], [ %6, %store.next113 ]
  %27 = call { i64, i64, i32 } @fixWordCntError(i64 %21, i64 %132)
  %28 = extractvalue { i64, i64, i32 } %27, 0
  %29 = extractvalue { i64, i64, i32 } %27, 1
  %30 = extractvalue { i64, i64, i32 } %27, 2
  %31 = add i64 %28, %29
  br i1 false, label %gep.throw114, label %gep.next115

if.then13:                                        ; preds = %deref.next129
  br i1 false, label %gep.throw130, label %gep.next131

if.done14:                                        ; preds = %store.next137, %deref.next129
  br i1 false, label %gep.throw138, label %gep.next139

if.then15:                                        ; preds = %store.next141
  br i1 false, label %gep.throw142, label %gep.next143

if.then16:                                        ; preds = %deref.next145
  br i1 false, label %gep.throw146, label %gep.next147

if.done17:                                        ; preds = %store.next149, %deref.next145
  %32 = icmp sgt i64 %22, %29
  %spec.select = select i1 %32, i64 %29, i64 %22
  %33 = icmp sgt i64 %24, %29
  %34 = select i1 %33, i64 %29, i64 %24
  %35 = icmp sgt i64 %23, %28
  %spec.select276 = select i1 %35, i64 %28, i64 %23
  br label %if.done23

if.done23:                                        ; preds = %store.next141, %if.done17
  %36 = phi i64 [ %22, %store.next141 ], [ %spec.select, %if.done17 ]
  %37 = phi i64 [ %23, %store.next141 ], [ %spec.select276, %if.done17 ]
  %38 = phi i64 [ %24, %store.next141 ], [ %34, %if.done17 ]
  %39 = icmp sgt i64 %36, %38
  %40 = add i64 %25, %28
  %41 = add i64 %40, %36
  br i1 %39, label %if.then24, label %if.else

if.then24:                                        ; preds = %if.done23
  %42 = add i64 %40, %38
  %43 = add i64 %26, %37
  %44 = add i64 %43, %38
  br label %for.loop25

for.loop25:                                       ; preds = %lookup.next155, %if.then24
  %45 = phi i64 [ %29, %if.then24 ], [ %48, %lookup.next155 ]
  %46 = phi i64 [ %31, %if.then24 ], [ %49, %lookup.next155 ]
  %47 = icmp sgt i64 %45, %36
  br i1 %47, label %for.body26, label %for.loop27

for.body26:                                       ; preds = %for.loop25
  %48 = sub i64 %45, 1
  %49 = sub i64 %46, 1
  br i1 false, label %gep.throw150, label %gep.next151

for.loop27:                                       ; preds = %lookup.next167, %for.loop25
  %50 = phi i64 [ %41, %for.loop25 ], [ %54, %lookup.next167 ]
  %51 = phi i64 [ %46, %for.loop25 ], [ %53, %lookup.next167 ]
  %52 = icmp sgt i64 %50, %42
  br i1 %52, label %for.body28, label %for.loop29

for.body28:                                       ; preds = %for.loop27
  %53 = sub i64 %51, 1
  %54 = sub i64 %50, 1
  br i1 false, label %gep.throw156, label %gep.next157

for.loop29:                                       ; preds = %lookup.next185, %for.loop41, %for.loop27
  %55 = phi i64 [ %50, %for.loop27 ], [ %61, %lookup.next185 ], [ %41, %for.loop41 ]
  %56 = phi i64 [ %44, %for.loop27 ], [ %62, %lookup.next185 ], [ %87, %for.loop41 ]
  %57 = phi i32 [ 0, %for.loop27 ], [ %195, %lookup.next185 ], [ %88, %for.loop41 ]
  %58 = phi i64 [ %51, %for.loop27 ], [ %60, %lookup.next185 ], [ %89, %for.loop41 ]
  %59 = icmp sgt i64 %56, %26
  br i1 %59, label %for.body30, label %for.loop31

for.body30:                                       ; preds = %for.loop29
  %60 = sub i64 %58, 1
  %61 = sub i64 %55, 1
  %62 = sub i64 %56, 1
  br i1 false, label %gep.throw168, label %gep.next169

for.loop31:                                       ; preds = %lookup.next197, %for.loop29
  %63 = phi i64 [ %55, %for.loop29 ], [ %69, %lookup.next197 ]
  %64 = phi i32 [ %57, %for.loop29 ], [ %205, %lookup.next197 ]
  %65 = phi i64 [ %58, %for.loop29 ], [ %68, %lookup.next197 ]
  %66 = icmp sgt i32 %64, 0
  %67 = icmp sgt i64 %63, %25
  %or.cond = and i1 %66, %67
  br i1 %or.cond, label %for.body33, label %for.loop34

for.body33:                                       ; preds = %for.loop31
  %68 = sub i64 %65, 1
  %69 = sub i64 %63, 1
  br i1 false, label %gep.throw186, label %gep.next187

for.loop34:                                       ; preds = %lookup.next209, %for.loop31
  %70 = phi i64 [ %63, %for.loop31 ], [ %74, %lookup.next209 ]
  %71 = phi i64 [ %65, %for.loop31 ], [ %73, %lookup.next209 ]
  %72 = icmp sgt i64 %70, %25
  br i1 %72, label %for.body35, label %for.loop36

for.body35:                                       ; preds = %for.loop34
  %73 = sub i64 %71, 1
  %74 = sub i64 %70, 1
  br i1 false, label %gep.throw198, label %gep.next199

for.loop36:                                       ; preds = %lookup.next215, %for.loop34
  %75 = phi i64 [ %71, %for.loop34 ], [ %77, %lookup.next215 ]
  %76 = icmp sgt i64 %75, 0
  br i1 %76, label %for.body37, label %for.done38

for.body37:                                       ; preds = %for.loop36
  %77 = sub i64 %75, 1
  br i1 false, label %gep.throw210, label %gep.next211

for.done38:                                       ; preds = %for.loop36
  %78 = insertvalue { i64, i32 } zeroinitializer, i32 %30, 1
  ret { i64, i32 } %78

if.else:                                          ; preds = %if.done23
  %79 = add i64 %26, %37
  %80 = add i64 %79, %38
  %81 = add i64 %79, %36
  br label %for.loop39

for.loop39:                                       ; preds = %lookup.next221, %if.else
  %82 = phi i64 [ %29, %if.else ], [ %85, %lookup.next221 ]
  %83 = phi i64 [ %31, %if.else ], [ %86, %lookup.next221 ]
  %84 = icmp sgt i64 %82, %38
  br i1 %84, label %for.body40, label %for.loop41

for.body40:                                       ; preds = %for.loop39
  %85 = sub i64 %82, 1
  %86 = sub i64 %83, 1
  br i1 false, label %gep.throw216, label %gep.next217

for.loop41:                                       ; preds = %lookup.next233, %for.loop39
  %87 = phi i64 [ %80, %for.loop39 ], [ %92, %lookup.next233 ]
  %88 = phi i32 [ 0, %for.loop39 ], [ %228, %lookup.next233 ]
  %89 = phi i64 [ %83, %for.loop39 ], [ %91, %lookup.next233 ]
  %90 = icmp sgt i64 %87, %81
  br i1 %90, label %for.body42, label %for.loop29

for.body42:                                       ; preds = %for.loop41
  %91 = sub i64 %89, 1
  %92 = sub i64 %87, 1
  br i1 false, label %gep.throw222, label %gep.next223

if.else43:                                        ; preds = %if.done5
  %93 = icmp eq i64 %11, %5
  br i1 %93, label %if.then44, label %if.done6

if.then44:                                        ; preds = %if.else43
  %94 = add i64 %118, %122
  %95 = sub i64 %94, 1
  %96 = add i64 %127, %131
  %97 = sub i64 %96, 1
  br label %for.loop45

for.loop45:                                       ; preds = %for.body47, %if.then44
  %98 = phi i64 [ %95, %if.then44 ], [ %100, %for.body47 ]
  %99 = icmp sle i64 %6, %98
  br i1 %99, label %cond.true46, label %for.loop48

cond.true46:                                      ; preds = %for.loop45
  br i1 false, label %gep.throw234, label %gep.next235

for.body47:                                       ; preds = %lookup.next239
  %100 = sub i64 %98, 1
  br label %for.loop45

for.loop48:                                       ; preds = %lookup.next239, %for.body50, %for.loop45
  %101 = phi i64 [ %97, %for.loop45 ], [ %103, %for.body50 ], [ %97, %lookup.next239 ]
  %102 = icmp sle i64 %12, %101
  br i1 %102, label %cond.true49, label %for.done51

cond.true49:                                      ; preds = %for.loop48
  br i1 false, label %gep.throw240, label %gep.next241

for.body50:                                       ; preds = %lookup.next245
  %103 = sub i64 %101, 1
  br label %for.loop48

for.done51:                                       ; preds = %lookup.next245, %for.loop48
  %104 = sub i64 %98, %118
  %105 = add i64 %104, 1
  %106 = sub i64 %101, %127
  %107 = add i64 %106, 1
  br label %for.loop52

for.loop52:                                       ; preds = %for.body55, %for.done51
  %108 = phi i64 [ %6, %for.done51 ], [ %112, %for.body55 ]
  %109 = phi i64 [ %12, %for.done51 ], [ %113, %for.body55 ]
  %110 = icmp sle i64 %108, %98
  %111 = icmp sle i64 %109, %101
  %or.cond277 = and i1 %110, %111
  br i1 %or.cond277, label %cond.true54, label %for.done56

cond.true54:                                      ; preds = %for.loop52
  br i1 false, label %gep.throw246, label %gep.next247

for.body55:                                       ; preds = %lookup.next257
  %112 = add i64 %108, 1
  %113 = add i64 %109, 1
  br label %for.loop52

for.done56:                                       ; preds = %lookup.next257, %for.loop52
  br i1 %110, label %if.then57, label %if.else61

if.then57:                                        ; preds = %for.done56
  br i1 %111, label %cond.true58, label %if.else60

cond.true58:                                      ; preds = %if.then57
  br i1 false, label %gep.throw258, label %gep.next259

if.else60:                                        ; preds = %lookup.next269, %if.then57
  br label %if.done6

if.else61:                                        ; preds = %for.done56
  br i1 %111, label %if.done6, label %if.else63

if.else63:                                        ; preds = %if.else61
  %114 = icmp eq %MyDecimal* %to, null
  br i1 %114, label %if.then8, label %gep.next271

gep.throw:                                        ; preds = %entry
  unreachable

gep.next:                                         ; preds = %entry
  %115 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 0
  br i1 false, label %deref.throw, label %deref.next

deref.throw:                                      ; preds = %gep.next
  unreachable

deref.next:                                       ; preds = %gep.next
  %116 = load i8, i8* %115, align 1
  %117 = sext i8 %116 to i64
  %118 = call i64 @digitsToWords(i64 %117)
  br i1 false, label %gep.throw66, label %gep.next67

gep.throw66:                                      ; preds = %deref.next
  unreachable

gep.next67:                                       ; preds = %deref.next
  %119 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 1
  br i1 false, label %deref.throw68, label %deref.next69

deref.throw68:                                    ; preds = %gep.next67
  unreachable

deref.next69:                                     ; preds = %gep.next67
  %120 = load i8, i8* %119, align 1
  %121 = sext i8 %120 to i64
  %122 = call i64 @digitsToWords(i64 %121)
  %123 = icmp eq %MyDecimal* %from2, null
  br i1 %123, label %gep.throw70, label %gep.next71

gep.throw70:                                      ; preds = %deref.next69
  unreachable

gep.next71:                                       ; preds = %deref.next69
  %124 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i32 0, i32 0
  br i1 false, label %deref.throw72, label %deref.next73

deref.throw72:                                    ; preds = %gep.next71
  unreachable

deref.next73:                                     ; preds = %gep.next71
  %125 = load i8, i8* %124, align 1
  %126 = sext i8 %125 to i64
  %127 = call i64 @digitsToWords(i64 %126)
  br i1 false, label %gep.throw74, label %gep.next75

gep.throw74:                                      ; preds = %deref.next73
  unreachable

gep.next75:                                       ; preds = %deref.next73
  %128 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i32 0, i32 1
  br i1 false, label %deref.throw76, label %deref.next77

deref.throw76:                                    ; preds = %gep.next75
  unreachable

deref.next77:                                     ; preds = %gep.next75
  %129 = load i8, i8* %128, align 1
  %130 = sext i8 %129 to i64
  %131 = call i64 @digitsToWords(i64 %130)
  %132 = call i64 @myMax(i64 %122, i64 %131)
  br i1 false, label %gep.throw78, label %gep.next79

gep.throw78:                                      ; preds = %deref.next77
  unreachable

gep.next79:                                       ; preds = %deref.next77
  %133 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 4
  br i1 false, label %gep.throw80, label %gep.next81

gep.throw80:                                      ; preds = %gep.next79
  unreachable

gep.next81:                                       ; preds = %gep.next79
  %134 = getelementptr inbounds [9 x i32], [9 x i32]* %133, i32 0, i64 0
  %135 = load i32, i32* %134, align 4
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %for.loop, label %if.done

gep.throw82:                                      ; preds = %cond.true
  unreachable

gep.next83:                                       ; preds = %cond.true
  br i1 false, label %gep.throw84, label %gep.next85

gep.throw84:                                      ; preds = %gep.next83
  unreachable

gep.next85:                                       ; preds = %gep.next83
  %137 = icmp uge i64 %1, 9
  br i1 %137, label %lookup.throw, label %lookup.next

lookup.throw:                                     ; preds = %gep.next85
  unreachable

lookup.next:                                      ; preds = %gep.next85
  %138 = getelementptr inbounds [9 x i32], [9 x i32]* %133, i32 0, i64 %1
  %139 = load i32, i32* %138, align 4
  %140 = icmp eq i32 %139, 0
  br i1 %140, label %for.body, label %for.done

gep.throw86:                                      ; preds = %if.done
  unreachable

gep.next87:                                       ; preds = %if.done
  %141 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i32 0, i32 4
  br i1 false, label %gep.throw88, label %gep.next89

gep.throw88:                                      ; preds = %gep.next87
  unreachable

gep.next89:                                       ; preds = %gep.next87
  %142 = getelementptr inbounds [9 x i32], [9 x i32]* %141, i32 0, i64 0
  %143 = load i32, i32* %142, align 4
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %for.loop1, label %if.done5

gep.throw90:                                      ; preds = %cond.true2
  unreachable

gep.next91:                                       ; preds = %cond.true2
  br i1 false, label %gep.throw92, label %gep.next93

gep.throw92:                                      ; preds = %gep.next91
  unreachable

gep.next93:                                       ; preds = %gep.next91
  %145 = icmp uge i64 %7, 9
  br i1 %145, label %lookup.throw94, label %lookup.next95

lookup.throw94:                                   ; preds = %gep.next93
  unreachable

lookup.next95:                                    ; preds = %gep.next93
  %146 = getelementptr inbounds [9 x i32], [9 x i32]* %141, i32 0, i64 %7
  %147 = load i32, i32* %146, align 4
  %148 = icmp eq i32 %147, 0
  br i1 %148, label %for.body3, label %for.done4

gep.throw96:                                      ; preds = %if.then7
  unreachable

gep.next97:                                       ; preds = %if.then7
  %149 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 3
  br i1 false, label %deref.throw98, label %deref.next99

deref.throw98:                                    ; preds = %gep.next97
  unreachable

deref.next99:                                     ; preds = %gep.next97
  %150 = load i1, i1* %149, align 1
  %151 = icmp eq i1 %18, %150
  %spec.select278 = select i1 %151, { i64, i32 } { i64 1, i32 0 }, { i64, i32 } { i64 -1, i32 0 }
  br label %if.then8

gep.next101:                                      ; preds = %if.done6
  %152 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 3
  br i1 false, label %gep.throw102, label %gep.next103

gep.throw102:                                     ; preds = %gep.next101
  unreachable

gep.next103:                                      ; preds = %gep.next101
  %153 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 3
  br i1 false, label %deref.throw104, label %deref.next105

deref.throw104:                                   ; preds = %gep.next103
  unreachable

deref.next105:                                    ; preds = %gep.next103
  %154 = load i1, i1* %153, align 1
  br i1 false, label %store.throw, label %store.next

store.throw:                                      ; preds = %deref.next105
  unreachable

store.next:                                       ; preds = %deref.next105
  store i1 %154, i1* %152, align 1
  %155 = icmp sgt i32 %16, 0
  br i1 %155, label %if.then11, label %if.done12

gep.throw106:                                     ; preds = %if.then11
  unreachable

gep.next107:                                      ; preds = %if.then11
  br i1 false, label %deref.throw110, label %deref.next111

deref.throw110:                                   ; preds = %gep.next107
  unreachable

deref.next111:                                    ; preds = %gep.next107
  %156 = xor i1 %154, true
  br i1 false, label %store.throw112, label %store.next113

store.throw112:                                   ; preds = %deref.next111
  unreachable

store.next113:                                    ; preds = %deref.next111
  store i1 %156, i1* %152, align 1
  br label %if.done12

gep.throw114:                                     ; preds = %if.done12
  unreachable

gep.next115:                                      ; preds = %if.done12
  %157 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 1
  br i1 false, label %gep.throw116, label %gep.next117

gep.throw116:                                     ; preds = %gep.next115
  unreachable

gep.next117:                                      ; preds = %gep.next115
  %158 = getelementptr inbounds %MyDecimal, %MyDecimal* %19, i32 0, i32 1
  br i1 false, label %deref.throw118, label %deref.next119

deref.throw118:                                   ; preds = %gep.next117
  unreachable

deref.next119:                                    ; preds = %gep.next117
  %159 = load i8, i8* %158, align 1
  br i1 false, label %store.throw120, label %store.next121

store.throw120:                                   ; preds = %deref.next119
  unreachable

store.next121:                                    ; preds = %deref.next119
  store i8 %159, i8* %157, align 1
  br i1 false, label %gep.throw122, label %gep.next123

gep.throw122:                                     ; preds = %store.next121
  unreachable

gep.next123:                                      ; preds = %store.next121
  br i1 false, label %deref.throw124, label %deref.next125

deref.throw124:                                   ; preds = %gep.next123
  unreachable

deref.next125:                                    ; preds = %gep.next123
  br i1 false, label %gep.throw126, label %gep.next127

gep.throw126:                                     ; preds = %deref.next125
  unreachable

gep.next127:                                      ; preds = %deref.next125
  %160 = getelementptr inbounds %MyDecimal, %MyDecimal* %20, i32 0, i32 1
  br i1 false, label %deref.throw128, label %deref.next129

deref.throw128:                                   ; preds = %gep.next127
  unreachable

deref.next129:                                    ; preds = %gep.next127
  %161 = load i8, i8* %160, align 1
  %162 = icmp slt i8 %159, %161
  br i1 %162, label %if.then13, label %if.done14

gep.throw130:                                     ; preds = %if.then13
  unreachable

gep.next131:                                      ; preds = %if.then13
  br i1 false, label %gep.throw132, label %gep.next133

gep.throw132:                                     ; preds = %gep.next131
  unreachable

gep.next133:                                      ; preds = %gep.next131
  br i1 false, label %deref.throw134, label %deref.next135

deref.throw134:                                   ; preds = %gep.next133
  unreachable

deref.next135:                                    ; preds = %gep.next133
  br i1 false, label %store.throw136, label %store.next137

store.throw136:                                   ; preds = %deref.next135
  unreachable

store.next137:                                    ; preds = %deref.next135
  store i8 %161, i8* %157, align 1
  br label %if.done14

gep.throw138:                                     ; preds = %if.done14
  unreachable

gep.next139:                                      ; preds = %if.done14
  %163 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 0
  %164 = mul i64 %28, 9
  %165 = trunc i64 %164 to i8
  %166 = icmp eq i8* %163, null
  br i1 %166, label %store.throw140, label %store.next141

store.throw140:                                   ; preds = %gep.next139
  unreachable

store.next141:                                    ; preds = %gep.next139
  store i8 %165, i8* %163, align 1
  %167 = icmp ne i32 %30, 0
  br i1 %167, label %if.then15, label %if.done23

gep.throw142:                                     ; preds = %if.then15
  unreachable

gep.next143:                                      ; preds = %if.then15
  br i1 false, label %deref.throw144, label %deref.next145

deref.throw144:                                   ; preds = %gep.next143
  unreachable

deref.next145:                                    ; preds = %gep.next143
  %168 = load i8, i8* %157, align 1
  %169 = mul i64 %29, 9
  %170 = trunc i64 %169 to i8
  %171 = icmp sgt i8 %168, %170
  br i1 %171, label %if.then16, label %if.done17

gep.throw146:                                     ; preds = %if.then16
  unreachable

gep.next147:                                      ; preds = %if.then16
  br i1 false, label %store.throw148, label %store.next149

store.throw148:                                   ; preds = %gep.next147
  unreachable

store.next149:                                    ; preds = %gep.next147
  store i8 %170, i8* %157, align 1
  br label %if.done17

gep.throw150:                                     ; preds = %for.body26
  unreachable

gep.next151:                                      ; preds = %for.body26
  %172 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw152, label %gep.next153

gep.throw152:                                     ; preds = %gep.next151
  unreachable

gep.next153:                                      ; preds = %gep.next151
  %173 = icmp uge i64 %49, 9
  br i1 %173, label %lookup.throw154, label %lookup.next155

lookup.throw154:                                  ; preds = %gep.next153
  unreachable

lookup.next155:                                   ; preds = %gep.next153
  %174 = getelementptr inbounds [9 x i32], [9 x i32]* %172, i32 0, i64 %49
  store i32 0, i32* %174, align 4
  br label %for.loop25

gep.throw156:                                     ; preds = %for.body28
  unreachable

gep.next157:                                      ; preds = %for.body28
  %175 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw158, label %gep.next159

gep.throw158:                                     ; preds = %gep.next157
  unreachable

gep.next159:                                      ; preds = %gep.next157
  %176 = icmp uge i64 %53, 9
  br i1 %176, label %lookup.throw160, label %lookup.next161

lookup.throw160:                                  ; preds = %gep.next159
  unreachable

lookup.next161:                                   ; preds = %gep.next159
  %177 = getelementptr inbounds [9 x i32], [9 x i32]* %175, i32 0, i64 %53
  br i1 false, label %gep.throw162, label %gep.next163

gep.throw162:                                     ; preds = %lookup.next161
  unreachable

gep.next163:                                      ; preds = %lookup.next161
  %178 = getelementptr inbounds %MyDecimal, %MyDecimal* %19, i32 0, i32 4
  br i1 false, label %gep.throw164, label %gep.next165

gep.throw164:                                     ; preds = %gep.next163
  unreachable

gep.next165:                                      ; preds = %gep.next163
  %179 = icmp uge i64 %54, 9
  br i1 %179, label %lookup.throw166, label %lookup.next167

lookup.throw166:                                  ; preds = %gep.next165
  unreachable

lookup.next167:                                   ; preds = %gep.next165
  %180 = getelementptr inbounds [9 x i32], [9 x i32]* %178, i32 0, i64 %54
  %181 = load i32, i32* %180, align 4
  store i32 %181, i32* %177, align 4
  br label %for.loop27

gep.throw168:                                     ; preds = %for.body30
  unreachable

gep.next169:                                      ; preds = %for.body30
  %182 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw170, label %gep.next171

gep.throw170:                                     ; preds = %gep.next169
  unreachable

gep.next171:                                      ; preds = %gep.next169
  %183 = icmp uge i64 %60, 9
  br i1 %183, label %lookup.throw172, label %lookup.next173

lookup.throw172:                                  ; preds = %gep.next171
  unreachable

lookup.next173:                                   ; preds = %gep.next171
  %184 = getelementptr inbounds [9 x i32], [9 x i32]* %182, i32 0, i64 %60
  br i1 false, label %gep.throw174, label %gep.next175

gep.throw174:                                     ; preds = %lookup.next173
  unreachable

gep.next175:                                      ; preds = %lookup.next173
  %185 = getelementptr inbounds %MyDecimal, %MyDecimal* %19, i32 0, i32 4
  br i1 false, label %gep.throw176, label %gep.next177

gep.throw176:                                     ; preds = %gep.next175
  unreachable

gep.next177:                                      ; preds = %gep.next175
  %186 = icmp uge i64 %61, 9
  br i1 %186, label %lookup.throw178, label %lookup.next179

lookup.throw178:                                  ; preds = %gep.next177
  unreachable

lookup.next179:                                   ; preds = %gep.next177
  %187 = getelementptr inbounds [9 x i32], [9 x i32]* %185, i32 0, i64 %61
  %188 = load i32, i32* %187, align 4
  br i1 false, label %gep.throw180, label %gep.next181

gep.throw180:                                     ; preds = %lookup.next179
  unreachable

gep.next181:                                      ; preds = %lookup.next179
  %189 = getelementptr inbounds %MyDecimal, %MyDecimal* %20, i32 0, i32 4
  br i1 false, label %gep.throw182, label %gep.next183

gep.throw182:                                     ; preds = %gep.next181
  unreachable

gep.next183:                                      ; preds = %gep.next181
  %190 = icmp uge i64 %62, 9
  br i1 %190, label %lookup.throw184, label %lookup.next185

lookup.throw184:                                  ; preds = %gep.next183
  unreachable

lookup.next185:                                   ; preds = %gep.next183
  %191 = getelementptr inbounds [9 x i32], [9 x i32]* %189, i32 0, i64 %62
  %192 = load i32, i32* %191, align 4
  %193 = call { i32, i32 } @sub(i32 %188, i32 %192, i32 %57)
  %194 = extractvalue { i32, i32 } %193, 0
  store i32 %194, i32* %184, align 4
  %195 = extractvalue { i32, i32 } %193, 1
  br label %for.loop29

gep.throw186:                                     ; preds = %for.body33
  unreachable

gep.next187:                                      ; preds = %for.body33
  %196 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw188, label %gep.next189

gep.throw188:                                     ; preds = %gep.next187
  unreachable

gep.next189:                                      ; preds = %gep.next187
  %197 = icmp uge i64 %68, 9
  br i1 %197, label %lookup.throw190, label %lookup.next191

lookup.throw190:                                  ; preds = %gep.next189
  unreachable

lookup.next191:                                   ; preds = %gep.next189
  %198 = getelementptr inbounds [9 x i32], [9 x i32]* %196, i32 0, i64 %68
  br i1 false, label %gep.throw192, label %gep.next193

gep.throw192:                                     ; preds = %lookup.next191
  unreachable

gep.next193:                                      ; preds = %lookup.next191
  %199 = getelementptr inbounds %MyDecimal, %MyDecimal* %19, i32 0, i32 4
  br i1 false, label %gep.throw194, label %gep.next195

gep.throw194:                                     ; preds = %gep.next193
  unreachable

gep.next195:                                      ; preds = %gep.next193
  %200 = icmp uge i64 %69, 9
  br i1 %200, label %lookup.throw196, label %lookup.next197

lookup.throw196:                                  ; preds = %gep.next195
  unreachable

lookup.next197:                                   ; preds = %gep.next195
  %201 = getelementptr inbounds [9 x i32], [9 x i32]* %199, i32 0, i64 %69
  %202 = load i32, i32* %201, align 4
  %203 = call { i32, i32 } @sub(i32 %202, i32 0, i32 %64)
  %204 = extractvalue { i32, i32 } %203, 0
  store i32 %204, i32* %198, align 4
  %205 = extractvalue { i32, i32 } %203, 1
  br label %for.loop31

gep.throw198:                                     ; preds = %for.body35
  unreachable

gep.next199:                                      ; preds = %for.body35
  %206 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw200, label %gep.next201

gep.throw200:                                     ; preds = %gep.next199
  unreachable

gep.next201:                                      ; preds = %gep.next199
  %207 = icmp uge i64 %73, 9
  br i1 %207, label %lookup.throw202, label %lookup.next203

lookup.throw202:                                  ; preds = %gep.next201
  unreachable

lookup.next203:                                   ; preds = %gep.next201
  %208 = getelementptr inbounds [9 x i32], [9 x i32]* %206, i32 0, i64 %73
  br i1 false, label %gep.throw204, label %gep.next205

gep.throw204:                                     ; preds = %lookup.next203
  unreachable

gep.next205:                                      ; preds = %lookup.next203
  %209 = getelementptr inbounds %MyDecimal, %MyDecimal* %19, i32 0, i32 4
  br i1 false, label %gep.throw206, label %gep.next207

gep.throw206:                                     ; preds = %gep.next205
  unreachable

gep.next207:                                      ; preds = %gep.next205
  %210 = icmp uge i64 %74, 9
  br i1 %210, label %lookup.throw208, label %lookup.next209

lookup.throw208:                                  ; preds = %gep.next207
  unreachable

lookup.next209:                                   ; preds = %gep.next207
  %211 = getelementptr inbounds [9 x i32], [9 x i32]* %209, i32 0, i64 %74
  %212 = load i32, i32* %211, align 4
  store i32 %212, i32* %208, align 4
  br label %for.loop34

gep.throw210:                                     ; preds = %for.body37
  unreachable

gep.next211:                                      ; preds = %for.body37
  %213 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw212, label %gep.next213

gep.throw212:                                     ; preds = %gep.next211
  unreachable

gep.next213:                                      ; preds = %gep.next211
  %214 = icmp uge i64 %77, 9
  br i1 %214, label %lookup.throw214, label %lookup.next215

lookup.throw214:                                  ; preds = %gep.next213
  unreachable

lookup.next215:                                   ; preds = %gep.next213
  %215 = getelementptr inbounds [9 x i32], [9 x i32]* %213, i32 0, i64 %77
  store i32 0, i32* %215, align 4
  br label %for.loop36

gep.throw216:                                     ; preds = %for.body40
  unreachable

gep.next217:                                      ; preds = %for.body40
  %216 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw218, label %gep.next219

gep.throw218:                                     ; preds = %gep.next217
  unreachable

gep.next219:                                      ; preds = %gep.next217
  %217 = icmp uge i64 %86, 9
  br i1 %217, label %lookup.throw220, label %lookup.next221

lookup.throw220:                                  ; preds = %gep.next219
  unreachable

lookup.next221:                                   ; preds = %gep.next219
  %218 = getelementptr inbounds [9 x i32], [9 x i32]* %216, i32 0, i64 %86
  store i32 0, i32* %218, align 4
  br label %for.loop39

gep.throw222:                                     ; preds = %for.body42
  unreachable

gep.next223:                                      ; preds = %for.body42
  %219 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw224, label %gep.next225

gep.throw224:                                     ; preds = %gep.next223
  unreachable

gep.next225:                                      ; preds = %gep.next223
  %220 = icmp uge i64 %91, 9
  br i1 %220, label %lookup.throw226, label %lookup.next227

lookup.throw226:                                  ; preds = %gep.next225
  unreachable

lookup.next227:                                   ; preds = %gep.next225
  %221 = getelementptr inbounds [9 x i32], [9 x i32]* %219, i32 0, i64 %91
  br i1 false, label %gep.throw228, label %gep.next229

gep.throw228:                                     ; preds = %lookup.next227
  unreachable

gep.next229:                                      ; preds = %lookup.next227
  %222 = getelementptr inbounds %MyDecimal, %MyDecimal* %20, i32 0, i32 4
  br i1 false, label %gep.throw230, label %gep.next231

gep.throw230:                                     ; preds = %gep.next229
  unreachable

gep.next231:                                      ; preds = %gep.next229
  %223 = icmp uge i64 %92, 9
  br i1 %223, label %lookup.throw232, label %lookup.next233

lookup.throw232:                                  ; preds = %gep.next231
  unreachable

lookup.next233:                                   ; preds = %gep.next231
  %224 = getelementptr inbounds [9 x i32], [9 x i32]* %222, i32 0, i64 %92
  %225 = load i32, i32* %224, align 4
  %226 = call { i32, i32 } @sub(i32 0, i32 %225, i32 %88)
  %227 = extractvalue { i32, i32 } %226, 0
  store i32 %227, i32* %221, align 4
  %228 = extractvalue { i32, i32 } %226, 1
  br label %for.loop41

gep.throw234:                                     ; preds = %cond.true46
  unreachable

gep.next235:                                      ; preds = %cond.true46
  br i1 false, label %gep.throw236, label %gep.next237

gep.throw236:                                     ; preds = %gep.next235
  unreachable

gep.next237:                                      ; preds = %gep.next235
  %229 = icmp uge i64 %98, 9
  br i1 %229, label %lookup.throw238, label %lookup.next239

lookup.throw238:                                  ; preds = %gep.next237
  unreachable

lookup.next239:                                   ; preds = %gep.next237
  %230 = getelementptr inbounds [9 x i32], [9 x i32]* %133, i32 0, i64 %98
  %231 = load i32, i32* %230, align 4
  %232 = icmp eq i32 %231, 0
  br i1 %232, label %for.body47, label %for.loop48

gep.throw240:                                     ; preds = %cond.true49
  unreachable

gep.next241:                                      ; preds = %cond.true49
  br i1 false, label %gep.throw242, label %gep.next243

gep.throw242:                                     ; preds = %gep.next241
  unreachable

gep.next243:                                      ; preds = %gep.next241
  %233 = icmp uge i64 %101, 9
  br i1 %233, label %lookup.throw244, label %lookup.next245

lookup.throw244:                                  ; preds = %gep.next243
  unreachable

lookup.next245:                                   ; preds = %gep.next243
  %234 = getelementptr inbounds [9 x i32], [9 x i32]* %141, i32 0, i64 %101
  %235 = load i32, i32* %234, align 4
  %236 = icmp eq i32 %235, 0
  br i1 %236, label %for.body50, label %for.done51

gep.throw246:                                     ; preds = %cond.true54
  unreachable

gep.next247:                                      ; preds = %cond.true54
  br i1 false, label %gep.throw248, label %gep.next249

gep.throw248:                                     ; preds = %gep.next247
  unreachable

gep.next249:                                      ; preds = %gep.next247
  %237 = icmp uge i64 %108, 9
  br i1 %237, label %lookup.throw250, label %lookup.next251

lookup.throw250:                                  ; preds = %gep.next249
  unreachable

lookup.next251:                                   ; preds = %gep.next249
  %238 = getelementptr inbounds [9 x i32], [9 x i32]* %133, i32 0, i64 %108
  %239 = load i32, i32* %238, align 4
  br i1 false, label %gep.throw252, label %gep.next253

gep.throw252:                                     ; preds = %lookup.next251
  unreachable

gep.next253:                                      ; preds = %lookup.next251
  br i1 false, label %gep.throw254, label %gep.next255

gep.throw254:                                     ; preds = %gep.next253
  unreachable

gep.next255:                                      ; preds = %gep.next253
  %240 = icmp uge i64 %109, 9
  br i1 %240, label %lookup.throw256, label %lookup.next257

lookup.throw256:                                  ; preds = %gep.next255
  unreachable

lookup.next257:                                   ; preds = %gep.next255
  %241 = getelementptr inbounds [9 x i32], [9 x i32]* %141, i32 0, i64 %109
  %242 = load i32, i32* %241, align 4
  %243 = icmp eq i32 %239, %242
  br i1 %243, label %for.body55, label %for.done56

gep.throw258:                                     ; preds = %cond.true58
  unreachable

gep.next259:                                      ; preds = %cond.true58
  br i1 false, label %gep.throw260, label %gep.next261

gep.throw260:                                     ; preds = %gep.next259
  unreachable

gep.next261:                                      ; preds = %gep.next259
  %244 = icmp uge i64 %109, 9
  br i1 %244, label %lookup.throw262, label %lookup.next263

lookup.throw262:                                  ; preds = %gep.next261
  unreachable

lookup.next263:                                   ; preds = %gep.next261
  %245 = getelementptr inbounds [9 x i32], [9 x i32]* %141, i32 0, i64 %109
  %246 = load i32, i32* %245, align 4
  br i1 false, label %gep.throw264, label %gep.next265

gep.throw264:                                     ; preds = %lookup.next263
  unreachable

gep.next265:                                      ; preds = %lookup.next263
  br i1 false, label %gep.throw266, label %gep.next267

gep.throw266:                                     ; preds = %gep.next265
  unreachable

gep.next267:                                      ; preds = %gep.next265
  %247 = icmp uge i64 %108, 9
  br i1 %247, label %lookup.throw268, label %lookup.next269

lookup.throw268:                                  ; preds = %gep.next267
  unreachable

lookup.next269:                                   ; preds = %gep.next267
  %248 = getelementptr inbounds [9 x i32], [9 x i32]* %133, i32 0, i64 %108
  %249 = load i32, i32* %248, align 4
  %250 = icmp sgt i32 %246, %249
  br i1 %250, label %if.done6, label %if.else60

gep.next271:                                      ; preds = %if.else63
  %251 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 2
  br i1 false, label %deref.throw272, label %deref.next273

deref.throw272:                                   ; preds = %gep.next271
  unreachable

deref.next273:                                    ; preds = %gep.next271
  %252 = load i8, i8* %251, align 1
  %253 = call %MyDecimal @zeroMyDecimalWithFrac(i8 %252)
  br i1 false, label %store.throw274, label %store.next275

store.throw274:                                   ; preds = %deref.next273
  unreachable

store.next275:                                    ; preds = %deref.next273
  store %MyDecimal %253, %MyDecimal* %to, align 4
  ret { i64, i32 } zeroinitializer
}

define internal i64 @myMax(i64 %a, i64 %b) unnamed_addr #0 {
entry:
  %0 = icmp sgt i64 %a, %b
  %spec.select = select i1 %0, i64 %a, i64 %b
  ret i64 %spec.select
}

define internal { i32, i32 } @sub(i32 %a, i32 %b, i32 %carry) unnamed_addr #0 {
entry:
  %0 = sub i32 %a, %b
  %1 = sub i32 %0, %carry
  %2 = icmp slt i32 %1, 0
  %3 = add i32 %1, 1000000000
  %4 = select i1 %2, i32 1, i32 0
  %5 = select i1 %2, i32 %3, i32 %1
  %6 = insertvalue { i32, i32 } zeroinitializer, i32 %5, 0
  %7 = insertvalue { i32, i32 } %6, i32 %4, 1
  ret { i32, i32 } %7
}

define internal i8 @myMaxInt8(i8 %a, i8 %b) unnamed_addr #0 {
entry:
  %0 = icmp sgt i8 %a, %b
  %spec.select = select i1 %0, i8 %a, i8 %b
  ret i8 %spec.select
}

define internal void @maxDecimal(i64 %precision, i64 %frac, %MyDecimal* dereferenceable_or_null(40) %to) unnamed_addr #0 {
entry:
  %0 = sub i64 %precision, %frac
  %1 = icmp eq %MyDecimal* %to, null
  br i1 %1, label %gep.throw, label %gep.next

if.then:                                          ; preds = %store.next11
  %2 = icmp eq i64 %0, -9223372036854775808
  %3 = srem i64 %0, 9
  %4 = icmp sgt i64 %3, 0
  br i1 %4, label %if.then1, label %if.done

if.then1:                                         ; preds = %if.then
  br i1 false, label %gep.throw12, label %gep.next13

if.done:                                          ; preds = %lookup.next, %if.then
  %5 = phi i64 [ 0, %if.then ], [ 1, %lookup.next ]
  %6 = sdiv i64 %0, 9
  br label %for.loop

for.loop:                                         ; preds = %lookup.next21, %if.done
  %7 = phi i64 [ %6, %if.done ], [ %32, %lookup.next21 ]
  %8 = phi i64 [ %5, %if.done ], [ %31, %lookup.next21 ]
  %9 = icmp sgt i64 %7, 0
  br i1 %9, label %for.body, label %if.done2

for.body:                                         ; preds = %for.loop
  br i1 false, label %gep.throw16, label %gep.next17

if.done2:                                         ; preds = %store.next11, %for.loop
  %10 = phi i64 [ 0, %store.next11 ], [ %8, %for.loop ]
  br i1 false, label %gep.throw22, label %gep.next23

if.then3:                                         ; preds = %store.next25
  %11 = icmp eq i64 %frac, -9223372036854775808
  %12 = srem i64 %frac, 9
  %13 = sdiv i64 %frac, 9
  br label %for.loop4

for.loop4:                                        ; preds = %lookup.next31, %if.then3
  %14 = phi i64 [ %13, %if.then3 ], [ %40, %lookup.next31 ]
  %15 = phi i64 [ %10, %if.then3 ], [ %39, %lookup.next31 ]
  %16 = icmp sgt i64 %14, 0
  br i1 %16, label %for.body5, label %for.done

for.body5:                                        ; preds = %for.loop4
  br i1 false, label %gep.throw26, label %gep.next27

for.done:                                         ; preds = %for.loop4
  %17 = icmp sgt i64 %12, 0
  br i1 %17, label %if.then6, label %if.done7

if.then6:                                         ; preds = %for.done
  br i1 false, label %gep.throw32, label %gep.next33

if.done7:                                         ; preds = %lookup.next39, %store.next25, %for.done
  ret void

gep.throw:                                        ; preds = %entry
  unreachable

gep.next:                                         ; preds = %entry
  %18 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 3
  br i1 false, label %store.throw, label %store.next

store.throw:                                      ; preds = %gep.next
  unreachable

store.next:                                       ; preds = %gep.next
  store i1 false, i1* %18, align 1
  br i1 false, label %gep.throw8, label %gep.next9

gep.throw8:                                       ; preds = %store.next
  unreachable

gep.next9:                                        ; preds = %store.next
  %19 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 0
  %20 = trunc i64 %0 to i8
  br i1 false, label %store.throw10, label %store.next11

store.throw10:                                    ; preds = %gep.next9
  unreachable

store.next11:                                     ; preds = %gep.next9
  store i8 %20, i8* %19, align 1
  %21 = icmp sgt i64 %0, 0
  br i1 %21, label %if.then, label %if.done2

gep.throw12:                                      ; preds = %if.then1
  unreachable

gep.next13:                                       ; preds = %if.then1
  %22 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw14, label %gep.next15

gep.throw14:                                      ; preds = %gep.next13
  unreachable

gep.next15:                                       ; preds = %gep.next13
  %23 = getelementptr inbounds [9 x i32], [9 x i32]* %22, i32 0, i64 0
  %24 = icmp uge i64 %3, 10
  br i1 %24, label %lookup.throw, label %lookup.next

lookup.throw:                                     ; preds = %gep.next15
  unreachable

lookup.next:                                      ; preds = %gep.next15
  %25 = getelementptr inbounds [10 x i32], [10 x i32]* @powers10, i32 0, i64 %3
  %26 = load i32, i32* %25, align 4
  %27 = sub i32 %26, 1
  store i32 %27, i32* %23, align 4
  br label %if.done

gep.throw16:                                      ; preds = %for.body
  unreachable

gep.next17:                                       ; preds = %for.body
  %28 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw18, label %gep.next19

gep.throw18:                                      ; preds = %gep.next17
  unreachable

gep.next19:                                       ; preds = %gep.next17
  %29 = icmp uge i64 %8, 9
  br i1 %29, label %lookup.throw20, label %lookup.next21

lookup.throw20:                                   ; preds = %gep.next19
  unreachable

lookup.next21:                                    ; preds = %gep.next19
  %30 = getelementptr inbounds [9 x i32], [9 x i32]* %28, i32 0, i64 %8
  store i32 999999999, i32* %30, align 4
  %31 = add i64 %8, 1
  %32 = sub i64 %7, 1
  br label %for.loop

gep.throw22:                                      ; preds = %if.done2
  unreachable

gep.next23:                                       ; preds = %if.done2
  %33 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 1
  %34 = trunc i64 %frac to i8
  br i1 false, label %store.throw24, label %store.next25

store.throw24:                                    ; preds = %gep.next23
  unreachable

store.next25:                                     ; preds = %gep.next23
  store i8 %34, i8* %33, align 1
  %35 = icmp sgt i64 %frac, 0
  br i1 %35, label %if.then3, label %if.done7

gep.throw26:                                      ; preds = %for.body5
  unreachable

gep.next27:                                       ; preds = %for.body5
  %36 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw28, label %gep.next29

gep.throw28:                                      ; preds = %gep.next27
  unreachable

gep.next29:                                       ; preds = %gep.next27
  %37 = icmp uge i64 %15, 9
  br i1 %37, label %lookup.throw30, label %lookup.next31

lookup.throw30:                                   ; preds = %gep.next29
  unreachable

lookup.next31:                                    ; preds = %gep.next29
  %38 = getelementptr inbounds [9 x i32], [9 x i32]* %36, i32 0, i64 %15
  store i32 999999999, i32* %38, align 4
  %39 = add i64 %15, 1
  %40 = sub i64 %14, 1
  br label %for.loop4

gep.throw32:                                      ; preds = %if.then6
  unreachable

gep.next33:                                       ; preds = %if.then6
  %41 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw34, label %gep.next35

gep.throw34:                                      ; preds = %gep.next33
  unreachable

gep.next35:                                       ; preds = %gep.next33
  %42 = icmp uge i64 %15, 9
  br i1 %42, label %lookup.throw36, label %lookup.next37

lookup.throw36:                                   ; preds = %gep.next35
  unreachable

lookup.next37:                                    ; preds = %gep.next35
  %43 = getelementptr inbounds [9 x i32], [9 x i32]* %41, i32 0, i64 %15
  %44 = sub i64 %12, 1
  %45 = icmp uge i64 %44, 8
  br i1 %45, label %lookup.throw38, label %lookup.next39

lookup.throw38:                                   ; preds = %lookup.next37
  unreachable

lookup.next39:                                    ; preds = %lookup.next37
  %46 = getelementptr inbounds [8 x i32], [8 x i32]* @fracMax, i32 0, i64 %44
  %47 = load i32, i32* %46, align 4
  store i32 %47, i32* %43, align 4
  br label %if.done7
}

define internal i32 @doAdd(%MyDecimal* dereferenceable_or_null(40) %from1, %MyDecimal* dereferenceable_or_null(40) %from2, %MyDecimal* dereferenceable_or_null(40) %to) unnamed_addr #0 {
entry:
  %0 = icmp eq %MyDecimal* %from1, null
  br i1 %0, label %gep.throw, label %gep.next

if.then:                                          ; preds = %deref.next44
  br i1 false, label %gep.throw45, label %gep.next46

if.done:                                          ; preds = %gep.next140, %gep.next132, %gep.next48
  %1 = phi i32 [ %88, %gep.next48 ], [ %141, %gep.next132 ], [ %148, %gep.next140 ]
  %2 = icmp sgt i32 %1, 999999998
  br i1 %2, label %if.then1, label %if.done2

if.then1:                                         ; preds = %if.done
  %3 = add i64 %83, 1
  %4 = icmp eq %MyDecimal* %to, null
  br i1 %4, label %gep.throw49, label %gep.next50

if.done2:                                         ; preds = %gep.next52, %if.done
  %5 = phi i64 [ %83, %if.done ], [ %3, %gep.next52 ]
  %6 = call { i64, i64, i32 } @fixWordCntError(i64 %5, i64 %84)
  %7 = extractvalue { i64, i64, i32 } %6, 0
  %8 = extractvalue { i64, i64, i32 } %6, 1
  %9 = extractvalue { i64, i64, i32 } %6, 2
  %10 = icmp eq i32 %9, 1
  br i1 %10, label %if.then3, label %if.done4

if.then3:                                         ; preds = %if.done2
  %11 = load i64, i64* @wordBufLen, align 8
  %12 = mul i64 %11, 9
  call void @maxDecimal(i64 %12, i64 0, %MyDecimal* %to)
  ret i32 %9

if.done4:                                         ; preds = %if.done2
  %13 = add i64 %7, %8
  %14 = icmp eq %MyDecimal* %to, null
  br i1 %14, label %gep.throw53, label %gep.next54

if.then5:                                         ; preds = %store.next74
  br i1 false, label %gep.throw75, label %gep.next76

if.then6:                                         ; preds = %deref.next78
  br i1 false, label %gep.throw79, label %gep.next80

if.done7:                                         ; preds = %store.next82, %deref.next78
  %15 = icmp sgt i64 %73, %8
  %spec.select = select i1 %15, i64 %8, i64 %73
  %16 = icmp sgt i64 %82, %8
  %17 = select i1 %16, i64 %8, i64 %82
  %18 = icmp sgt i64 %69, %7
  %spec.select141 = select i1 %18, i64 %7, i64 %69
  %19 = icmp sgt i64 %78, %7
  %spec.select144 = select i1 %19, i64 %7, i64 %78
  br label %if.done15

if.done15:                                        ; preds = %store.next74, %if.done7
  %20 = phi i64 [ %69, %store.next74 ], [ %spec.select141, %if.done7 ]
  %21 = phi i64 [ %73, %store.next74 ], [ %spec.select, %if.done7 ]
  %22 = phi i64 [ %78, %store.next74 ], [ %spec.select144, %if.done7 ]
  %23 = phi i64 [ %82, %store.next74 ], [ %17, %if.done7 ]
  %24 = icmp sgt i64 %21, %23
  br i1 %24, label %if.then16, label %if.else27

if.then16:                                        ; preds = %if.done15
  %25 = add i64 %20, %21
  %26 = add i64 %20, %23
  %27 = add i64 %22, %23
  %28 = icmp sgt i64 %20, %22
  %29 = sub i64 %20, %22
  %spec.select142 = select i1 %28, i64 %29, i64 0
  br label %for.loop

for.loop:                                         ; preds = %lookup.next92, %if.else27, %if.then16
  %30 = phi i64 [ %38, %lookup.next92 ], [ %13, %if.else27 ], [ %13, %if.then16 ]
  %31 = phi %MyDecimal* [ %31, %lookup.next92 ], [ %from2, %if.else27 ], [ %from1, %if.then16 ]
  %32 = phi %MyDecimal* [ %32, %lookup.next92 ], [ %from1, %if.else27 ], [ %from2, %if.then16 ]
  %33 = phi i64 [ %39, %lookup.next92 ], [ %60, %if.else27 ], [ %25, %if.then16 ]
  %34 = phi i64 [ %34, %lookup.next92 ], [ %62, %if.else27 ], [ %27, %if.then16 ]
  %35 = phi i64 [ %35, %lookup.next92 ], [ %61, %if.else27 ], [ %26, %if.then16 ]
  %36 = phi i64 [ %36, %lookup.next92 ], [ %spec.select143, %if.else27 ], [ %spec.select142, %if.then16 ]
  %37 = icmp sgt i64 %33, %35
  br i1 %37, label %for.body, label %for.loop18

for.body:                                         ; preds = %for.loop
  %38 = sub i64 %30, 1
  %39 = sub i64 %33, 1
  br i1 false, label %gep.throw83, label %gep.next84

for.loop18:                                       ; preds = %lookup.next110, %for.loop
  %40 = phi i64 [ %47, %lookup.next110 ], [ %30, %for.loop ]
  %41 = phi i64 [ %45, %lookup.next110 ], [ %33, %for.loop ]
  %42 = phi i64 [ %46, %lookup.next110 ], [ %34, %for.loop ]
  %43 = phi i32 [ %125, %lookup.next110 ], [ 0, %for.loop ]
  %44 = icmp sgt i64 %41, %36
  br i1 %44, label %for.body19, label %for.done20

for.body19:                                       ; preds = %for.loop18
  %45 = sub i64 %41, 1
  %46 = sub i64 %42, 1
  %47 = sub i64 %40, 1
  br i1 false, label %gep.throw93, label %gep.next94

for.done20:                                       ; preds = %for.loop18
  %48 = icmp sgt i64 %20, %22
  br i1 %48, label %if.then21, label %if.else

if.then21:                                        ; preds = %for.done20
  %49 = sub i64 %20, %22
  br label %for.loop22

for.loop22:                                       ; preds = %lookup.next122, %if.else, %if.then21
  %50 = phi i64 [ %40, %if.then21 ], [ %55, %lookup.next122 ], [ %40, %if.else ]
  %51 = phi %MyDecimal* [ %from1, %if.then21 ], [ %51, %lookup.next122 ], [ %from2, %if.else ]
  %52 = phi i64 [ %49, %if.then21 ], [ %56, %lookup.next122 ], [ %59, %if.else ]
  %53 = phi i32 [ %43, %if.then21 ], [ %135, %lookup.next122 ], [ %43, %if.else ]
  %54 = icmp sgt i64 %52, 0
  br i1 %54, label %for.body23, label %for.done24

for.body23:                                       ; preds = %for.loop22
  %55 = sub i64 %50, 1
  %56 = sub i64 %52, 1
  br i1 false, label %gep.throw111, label %gep.next112

for.done24:                                       ; preds = %for.loop22
  %57 = icmp sgt i32 %53, 0
  br i1 %57, label %if.then25, label %if.done26

if.then25:                                        ; preds = %for.done24
  %58 = sub i64 %50, 1
  br i1 false, label %gep.throw123, label %gep.next124

if.done26:                                        ; preds = %lookup.next128, %for.done24
  ret i32 %9

if.else:                                          ; preds = %for.done20
  %59 = sub i64 %22, %20
  br label %for.loop22

if.else27:                                        ; preds = %if.done15
  %60 = add i64 %22, %23
  %61 = add i64 %22, %21
  %62 = add i64 %20, %21
  %63 = icmp sgt i64 %22, %20
  %64 = sub i64 %22, %20
  %spec.select143 = select i1 %63, i64 %64, i64 0
  br label %for.loop

if.else30:                                        ; preds = %deref.next44
  %65 = icmp sgt i64 %78, %69
  br i1 %65, label %if.then31, label %if.else32

if.then31:                                        ; preds = %if.else30
  br i1 false, label %gep.throw129, label %gep.next130

if.else32:                                        ; preds = %if.else30
  br i1 false, label %gep.throw133, label %gep.next134

gep.throw:                                        ; preds = %entry
  unreachable

gep.next:                                         ; preds = %entry
  %66 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 0
  br i1 false, label %deref.throw, label %deref.next

deref.throw:                                      ; preds = %gep.next
  unreachable

deref.next:                                       ; preds = %gep.next
  %67 = load i8, i8* %66, align 1
  %68 = sext i8 %67 to i64
  %69 = call i64 @digitsToWords(i64 %68)
  br i1 false, label %gep.throw33, label %gep.next34

gep.throw33:                                      ; preds = %deref.next
  unreachable

gep.next34:                                       ; preds = %deref.next
  %70 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 1
  br i1 false, label %deref.throw35, label %deref.next36

deref.throw35:                                    ; preds = %gep.next34
  unreachable

deref.next36:                                     ; preds = %gep.next34
  %71 = load i8, i8* %70, align 1
  %72 = sext i8 %71 to i64
  %73 = call i64 @digitsToWords(i64 %72)
  %74 = icmp eq %MyDecimal* %from2, null
  br i1 %74, label %gep.throw37, label %gep.next38

gep.throw37:                                      ; preds = %deref.next36
  unreachable

gep.next38:                                       ; preds = %deref.next36
  %75 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i32 0, i32 0
  br i1 false, label %deref.throw39, label %deref.next40

deref.throw39:                                    ; preds = %gep.next38
  unreachable

deref.next40:                                     ; preds = %gep.next38
  %76 = load i8, i8* %75, align 1
  %77 = sext i8 %76 to i64
  %78 = call i64 @digitsToWords(i64 %77)
  br i1 false, label %gep.throw41, label %gep.next42

gep.throw41:                                      ; preds = %deref.next40
  unreachable

gep.next42:                                       ; preds = %deref.next40
  %79 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i32 0, i32 1
  br i1 false, label %deref.throw43, label %deref.next44

deref.throw43:                                    ; preds = %gep.next42
  unreachable

deref.next44:                                     ; preds = %gep.next42
  %80 = load i8, i8* %79, align 1
  %81 = sext i8 %80 to i64
  %82 = call i64 @digitsToWords(i64 %81)
  %83 = call i64 @myMax(i64 %69, i64 %78)
  %84 = call i64 @myMax(i64 %73, i64 %82)
  %85 = icmp sgt i64 %69, %78
  br i1 %85, label %if.then, label %if.else30

gep.throw45:                                      ; preds = %if.then
  unreachable

gep.next46:                                       ; preds = %if.then
  %86 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 4
  br i1 false, label %gep.throw47, label %gep.next48

gep.throw47:                                      ; preds = %gep.next46
  unreachable

gep.next48:                                       ; preds = %gep.next46
  %87 = getelementptr inbounds [9 x i32], [9 x i32]* %86, i32 0, i64 0
  %88 = load i32, i32* %87, align 4
  br label %if.done

gep.throw49:                                      ; preds = %if.then1
  unreachable

gep.next50:                                       ; preds = %if.then1
  %89 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw51, label %gep.next52

gep.throw51:                                      ; preds = %gep.next50
  unreachable

gep.next52:                                       ; preds = %gep.next50
  %90 = getelementptr inbounds [9 x i32], [9 x i32]* %89, i32 0, i64 0
  store i32 0, i32* %90, align 4
  br label %if.done2

gep.throw53:                                      ; preds = %if.done4
  unreachable

gep.next54:                                       ; preds = %if.done4
  %91 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 3
  br i1 false, label %gep.throw55, label %gep.next56

gep.throw55:                                      ; preds = %gep.next54
  unreachable

gep.next56:                                       ; preds = %gep.next54
  %92 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 3
  br i1 false, label %deref.throw57, label %deref.next58

deref.throw57:                                    ; preds = %gep.next56
  unreachable

deref.next58:                                     ; preds = %gep.next56
  %93 = load i1, i1* %92, align 1
  br i1 false, label %store.throw, label %store.next

store.throw:                                      ; preds = %deref.next58
  unreachable

store.next:                                       ; preds = %deref.next58
  store i1 %93, i1* %91, align 1
  br i1 false, label %gep.throw59, label %gep.next60

gep.throw59:                                      ; preds = %store.next
  unreachable

gep.next60:                                       ; preds = %store.next
  %94 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 0
  %95 = mul i64 %7, 9
  %96 = trunc i64 %95 to i8
  br i1 false, label %store.throw61, label %store.next62

store.throw61:                                    ; preds = %gep.next60
  unreachable

store.next62:                                     ; preds = %gep.next60
  store i8 %96, i8* %94, align 1
  br i1 false, label %gep.throw63, label %gep.next64

gep.throw63:                                      ; preds = %store.next62
  unreachable

gep.next64:                                       ; preds = %store.next62
  %97 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 1
  br i1 false, label %gep.throw65, label %gep.next66

gep.throw65:                                      ; preds = %gep.next64
  unreachable

gep.next66:                                       ; preds = %gep.next64
  br i1 false, label %deref.throw67, label %deref.next68

deref.throw67:                                    ; preds = %gep.next66
  unreachable

deref.next68:                                     ; preds = %gep.next66
  %98 = load i8, i8* %70, align 1
  br i1 false, label %gep.throw69, label %gep.next70

gep.throw69:                                      ; preds = %deref.next68
  unreachable

gep.next70:                                       ; preds = %deref.next68
  br i1 false, label %deref.throw71, label %deref.next72

deref.throw71:                                    ; preds = %gep.next70
  unreachable

deref.next72:                                     ; preds = %gep.next70
  %99 = load i8, i8* %79, align 1
  %100 = call i8 @myMaxInt8(i8 %98, i8 %99)
  br i1 false, label %store.throw73, label %store.next74

store.throw73:                                    ; preds = %deref.next72
  unreachable

store.next74:                                     ; preds = %deref.next72
  store i8 %100, i8* %97, align 1
  %101 = icmp ne i32 %9, 0
  br i1 %101, label %if.then5, label %if.done15

gep.throw75:                                      ; preds = %if.then5
  unreachable

gep.next76:                                       ; preds = %if.then5
  br i1 false, label %deref.throw77, label %deref.next78

deref.throw77:                                    ; preds = %gep.next76
  unreachable

deref.next78:                                     ; preds = %gep.next76
  %102 = mul i64 %8, 9
  %103 = trunc i64 %102 to i8
  %104 = icmp sgt i8 %100, %103
  br i1 %104, label %if.then6, label %if.done7

gep.throw79:                                      ; preds = %if.then6
  unreachable

gep.next80:                                       ; preds = %if.then6
  br i1 false, label %store.throw81, label %store.next82

store.throw81:                                    ; preds = %gep.next80
  unreachable

store.next82:                                     ; preds = %gep.next80
  store i8 %103, i8* %97, align 1
  br label %if.done7

gep.throw83:                                      ; preds = %for.body
  unreachable

gep.next84:                                       ; preds = %for.body
  %105 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw85, label %gep.next86

gep.throw85:                                      ; preds = %gep.next84
  unreachable

gep.next86:                                       ; preds = %gep.next84
  %106 = icmp uge i64 %38, 9
  br i1 %106, label %lookup.throw, label %lookup.next

lookup.throw:                                     ; preds = %gep.next86
  unreachable

lookup.next:                                      ; preds = %gep.next86
  %107 = getelementptr inbounds [9 x i32], [9 x i32]* %105, i32 0, i64 %38
  br i1 false, label %gep.throw87, label %gep.next88

gep.throw87:                                      ; preds = %lookup.next
  unreachable

gep.next88:                                       ; preds = %lookup.next
  %108 = getelementptr inbounds %MyDecimal, %MyDecimal* %31, i32 0, i32 4
  br i1 false, label %gep.throw89, label %gep.next90

gep.throw89:                                      ; preds = %gep.next88
  unreachable

gep.next90:                                       ; preds = %gep.next88
  %109 = icmp uge i64 %39, 9
  br i1 %109, label %lookup.throw91, label %lookup.next92

lookup.throw91:                                   ; preds = %gep.next90
  unreachable

lookup.next92:                                    ; preds = %gep.next90
  %110 = getelementptr inbounds [9 x i32], [9 x i32]* %108, i32 0, i64 %39
  %111 = load i32, i32* %110, align 4
  store i32 %111, i32* %107, align 4
  br label %for.loop

gep.throw93:                                      ; preds = %for.body19
  unreachable

gep.next94:                                       ; preds = %for.body19
  %112 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw95, label %gep.next96

gep.throw95:                                      ; preds = %gep.next94
  unreachable

gep.next96:                                       ; preds = %gep.next94
  %113 = icmp uge i64 %47, 9
  br i1 %113, label %lookup.throw97, label %lookup.next98

lookup.throw97:                                   ; preds = %gep.next96
  unreachable

lookup.next98:                                    ; preds = %gep.next96
  %114 = getelementptr inbounds [9 x i32], [9 x i32]* %112, i32 0, i64 %47
  br i1 false, label %gep.throw99, label %gep.next100

gep.throw99:                                      ; preds = %lookup.next98
  unreachable

gep.next100:                                      ; preds = %lookup.next98
  %115 = getelementptr inbounds %MyDecimal, %MyDecimal* %31, i32 0, i32 4
  br i1 false, label %gep.throw101, label %gep.next102

gep.throw101:                                     ; preds = %gep.next100
  unreachable

gep.next102:                                      ; preds = %gep.next100
  %116 = icmp uge i64 %45, 9
  br i1 %116, label %lookup.throw103, label %lookup.next104

lookup.throw103:                                  ; preds = %gep.next102
  unreachable

lookup.next104:                                   ; preds = %gep.next102
  %117 = getelementptr inbounds [9 x i32], [9 x i32]* %115, i32 0, i64 %45
  %118 = load i32, i32* %117, align 4
  br i1 false, label %gep.throw105, label %gep.next106

gep.throw105:                                     ; preds = %lookup.next104
  unreachable

gep.next106:                                      ; preds = %lookup.next104
  %119 = getelementptr inbounds %MyDecimal, %MyDecimal* %32, i32 0, i32 4
  br i1 false, label %gep.throw107, label %gep.next108

gep.throw107:                                     ; preds = %gep.next106
  unreachable

gep.next108:                                      ; preds = %gep.next106
  %120 = icmp uge i64 %46, 9
  br i1 %120, label %lookup.throw109, label %lookup.next110

lookup.throw109:                                  ; preds = %gep.next108
  unreachable

lookup.next110:                                   ; preds = %gep.next108
  %121 = getelementptr inbounds [9 x i32], [9 x i32]* %119, i32 0, i64 %46
  %122 = load i32, i32* %121, align 4
  %123 = call { i32, i32 } @add(i32 %118, i32 %122, i32 %43)
  %124 = extractvalue { i32, i32 } %123, 0
  store i32 %124, i32* %114, align 4
  %125 = extractvalue { i32, i32 } %123, 1
  br label %for.loop18

gep.throw111:                                     ; preds = %for.body23
  unreachable

gep.next112:                                      ; preds = %for.body23
  %126 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw113, label %gep.next114

gep.throw113:                                     ; preds = %gep.next112
  unreachable

gep.next114:                                      ; preds = %gep.next112
  %127 = icmp uge i64 %55, 9
  br i1 %127, label %lookup.throw115, label %lookup.next116

lookup.throw115:                                  ; preds = %gep.next114
  unreachable

lookup.next116:                                   ; preds = %gep.next114
  %128 = getelementptr inbounds [9 x i32], [9 x i32]* %126, i32 0, i64 %55
  br i1 false, label %gep.throw117, label %gep.next118

gep.throw117:                                     ; preds = %lookup.next116
  unreachable

gep.next118:                                      ; preds = %lookup.next116
  %129 = getelementptr inbounds %MyDecimal, %MyDecimal* %51, i32 0, i32 4
  br i1 false, label %gep.throw119, label %gep.next120

gep.throw119:                                     ; preds = %gep.next118
  unreachable

gep.next120:                                      ; preds = %gep.next118
  %130 = icmp uge i64 %56, 9
  br i1 %130, label %lookup.throw121, label %lookup.next122

lookup.throw121:                                  ; preds = %gep.next120
  unreachable

lookup.next122:                                   ; preds = %gep.next120
  %131 = getelementptr inbounds [9 x i32], [9 x i32]* %129, i32 0, i64 %56
  %132 = load i32, i32* %131, align 4
  %133 = call { i32, i32 } @add(i32 %132, i32 0, i32 %53)
  %134 = extractvalue { i32, i32 } %133, 0
  store i32 %134, i32* %128, align 4
  %135 = extractvalue { i32, i32 } %133, 1
  br label %for.loop22

gep.throw123:                                     ; preds = %if.then25
  unreachable

gep.next124:                                      ; preds = %if.then25
  %136 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i32 0, i32 4
  br i1 false, label %gep.throw125, label %gep.next126

gep.throw125:                                     ; preds = %gep.next124
  unreachable

gep.next126:                                      ; preds = %gep.next124
  %137 = icmp uge i64 %58, 9
  br i1 %137, label %lookup.throw127, label %lookup.next128

lookup.throw127:                                  ; preds = %gep.next126
  unreachable

lookup.next128:                                   ; preds = %gep.next126
  %138 = getelementptr inbounds [9 x i32], [9 x i32]* %136, i32 0, i64 %58
  store i32 1, i32* %138, align 4
  br label %if.done26

gep.throw129:                                     ; preds = %if.then31
  unreachable

gep.next130:                                      ; preds = %if.then31
  %139 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i32 0, i32 4
  br i1 false, label %gep.throw131, label %gep.next132

gep.throw131:                                     ; preds = %gep.next130
  unreachable

gep.next132:                                      ; preds = %gep.next130
  %140 = getelementptr inbounds [9 x i32], [9 x i32]* %139, i32 0, i64 0
  %141 = load i32, i32* %140, align 4
  br label %if.done

gep.throw133:                                     ; preds = %if.else32
  unreachable

gep.next134:                                      ; preds = %if.else32
  %142 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i32 0, i32 4
  br i1 false, label %gep.throw135, label %gep.next136

gep.throw135:                                     ; preds = %gep.next134
  unreachable

gep.next136:                                      ; preds = %gep.next134
  %143 = getelementptr inbounds [9 x i32], [9 x i32]* %142, i32 0, i64 0
  %144 = load i32, i32* %143, align 4
  br i1 false, label %gep.throw137, label %gep.next138

gep.throw137:                                     ; preds = %gep.next136
  unreachable

gep.next138:                                      ; preds = %gep.next136
  %145 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i32 0, i32 4
  br i1 false, label %gep.throw139, label %gep.next140

gep.throw139:                                     ; preds = %gep.next138
  unreachable

gep.next140:                                      ; preds = %gep.next138
  %146 = getelementptr inbounds [9 x i32], [9 x i32]* %145, i32 0, i64 0
  %147 = load i32, i32* %146, align 4
  %148 = add i32 %144, %147
  br label %if.done
}

define i32 @DecimalSub(%MyDecimal* dereferenceable_or_null(40) %from1, %MyDecimal* dereferenceable_or_null(40) %from2, %MyDecimal* dereferenceable_or_null(40) %to) unnamed_addr #0  {
entry:
  %0 = call { %MyDecimal*, %MyDecimal*, %MyDecimal* } @validateArgs(%MyDecimal* %from1, %MyDecimal* %from2, %MyDecimal* %to)
  %1 = extractvalue { %MyDecimal*, %MyDecimal*, %MyDecimal* } %0, 0
  %2 = extractvalue { %MyDecimal*, %MyDecimal*, %MyDecimal* } %0, 1
  %3 = extractvalue { %MyDecimal*, %MyDecimal*, %MyDecimal* } %0, 2
  %4 = icmp eq %MyDecimal* %3, null
  br i1 %4, label %gep.throw, label %gep.next

if.then:                                          ; preds = %deref.next14
  %5 = call { i64, i32 } @doSub(%MyDecimal* %1, %MyDecimal* %2, %MyDecimal* %3, i8* undef, i8* undef)
  %6 = extractvalue { i64, i32 } %5, 1
  ret i32 %6

if.done:                                          ; preds = %deref.next14
  %7 = call i32 @doAdd(%MyDecimal* %1, %MyDecimal* %2, %MyDecimal* %3)
  ret i32 %7

gep.throw:                                        ; preds = %entry
  unreachable

gep.next:                                         ; preds = %entry
  %8 = getelementptr inbounds %MyDecimal, %MyDecimal* %3, i32 0, i32 2
  %9 = icmp eq %MyDecimal* %1, null
  br i1 %9, label %gep.throw1, label %gep.next2

gep.throw1:                                       ; preds = %gep.next
  unreachable

gep.next2:                                        ; preds = %gep.next
  %10 = getelementptr inbounds %MyDecimal, %MyDecimal* %1, i32 0, i32 2
  br i1 false, label %deref.throw, label %deref.next

deref.throw:                                      ; preds = %gep.next2
  unreachable

deref.next:                                       ; preds = %gep.next2
  %11 = load i8, i8* %10, align 1
  %12 = icmp eq %MyDecimal* %2, null
  br i1 %12, label %gep.throw3, label %gep.next4

gep.throw3:                                       ; preds = %deref.next
  unreachable

gep.next4:                                        ; preds = %deref.next
  %13 = getelementptr inbounds %MyDecimal, %MyDecimal* %2, i32 0, i32 2
  br i1 false, label %deref.throw5, label %deref.next6

deref.throw5:                                     ; preds = %gep.next4
  unreachable

deref.next6:                                      ; preds = %gep.next4
  %14 = load i8, i8* %13, align 1
  %15 = call i8 @myMaxInt8(i8 %11, i8 %14)
  br i1 false, label %store.throw, label %store.next

store.throw:                                      ; preds = %deref.next6
  unreachable

store.next:                                       ; preds = %deref.next6
  store i8 %15, i8* %8, align 1
  br i1 false, label %gep.throw7, label %gep.next8

gep.throw7:                                       ; preds = %store.next
  unreachable

gep.next8:                                        ; preds = %store.next
  %16 = getelementptr inbounds %MyDecimal, %MyDecimal* %1, i32 0, i32 3
  br i1 false, label %deref.throw9, label %deref.next10

deref.throw9:                                     ; preds = %gep.next8
  unreachable

deref.next10:                                     ; preds = %gep.next8
  %17 = load i1, i1* %16, align 1
  br i1 false, label %gep.throw11, label %gep.next12

gep.throw11:                                      ; preds = %deref.next10
  unreachable

gep.next12:                                       ; preds = %deref.next10
  %18 = getelementptr inbounds %MyDecimal, %MyDecimal* %2, i32 0, i32 3
  br i1 false, label %deref.throw13, label %deref.next14

deref.throw13:                                    ; preds = %gep.next12
  unreachable

deref.next14:                                     ; preds = %gep.next12
  %19 = load i1, i1* %18, align 1
  %20 = icmp eq i1 %17, %19
  br i1 %20, label %if.then, label %if.done
}
