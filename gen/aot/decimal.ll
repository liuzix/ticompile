%MyDecimal = type <{ i8, i8, i8, i1, [9 x i32] }>

@div9 = internal constant [128 x i64] [i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 9, i64 9, i64 9, i64 9, i64 9, i64 9, i64 9, i64 9, i64 9, i64 10, i64 10, i64 10, i64 10, i64 10, i64 10, i64 10, i64 10, i64 10, i64 11, i64 11, i64 11, i64 11, i64 11, i64 11, i64 11, i64 11, i64 11, i64 12, i64 12, i64 12, i64 12, i64 12, i64 12, i64 12, i64 12, i64 12, i64 13, i64 13, i64 13, i64 13, i64 13, i64 13, i64 13, i64 13, i64 13, i64 14, i64 14], align 8
@powers10 = internal constant [10 x i32] [i32 1, i32 10, i32 100, i32 1000, i32 10000, i32 100000, i32 1000000, i32 10000000, i32 100000000, i32 1000000000], align 4
@wordBufLen = internal constant i64 9, align 8
@zeroMyDecimal = internal global %MyDecimal zeroinitializer, align 4

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

; Function Attrs: nounwind optsize uwtable
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

; Function Attrs: nounwind optsize uwtable
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

define internal i8 @myMinInt8(i8 %a, i8 %b) unnamed_addr #0  {
entry:
  %0 = icmp slt i8 %a, %b
  %spec.select = select i1 %0, i8 %a, i8 %b
  ret i8 %spec.select
}


define internal i32 @DecimalMul(%MyDecimal* dereferenceable_or_null(40) %from1, %MyDecimal* dereferenceable_or_null(40) %from2, %MyDecimal* dereferenceable_or_null(40) %to) unnamed_addr #0  {
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
