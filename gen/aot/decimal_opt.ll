; ModuleID = 'decimal.ll'
source_filename = "decimal.ll"

%MyDecimal = type <{ i8, i8, i8, i1, [9 x i32] }>

@div9 = internal unnamed_addr constant [128 x i64] [i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 0, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 1, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 2, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 4, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 5, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 6, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 7, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 8, i64 9, i64 9, i64 9, i64 9, i64 9, i64 9, i64 9, i64 9, i64 9, i64 10, i64 10, i64 10, i64 10, i64 10, i64 10, i64 10, i64 10, i64 10, i64 11, i64 11, i64 11, i64 11, i64 11, i64 11, i64 11, i64 11, i64 11, i64 12, i64 12, i64 12, i64 12, i64 12, i64 12, i64 12, i64 12, i64 12, i64 13, i64 13, i64 13, i64 13, i64 13, i64 13, i64 13, i64 13, i64 13, i64 14, i64 14], align 8

; Function Attrs: alwaysinline
define internal i32 @DecimalMul(%MyDecimal* nocapture readonly dereferenceable_or_null(40) %from1, %MyDecimal* nocapture readonly dereferenceable_or_null(40) %from2, %MyDecimal* dereferenceable_or_null(40) %to) unnamed_addr #0 {
entry:
  %0 = icmp ne %MyDecimal* %from1, null
  tail call void @llvm.assume(i1 %0)
  %1 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 0
  %2 = load i8, i8* %1, align 1
  %3 = sext i8 %2 to i64
  %4 = add nsw i64 %3, 8
  %5 = icmp ult i64 %4, 128
  br i1 %5, label %if.then.i, label %if.done.i

if.then.i:                                        ; preds = %entry
  %6 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %4
  %7 = load i64, i64* %6, align 8
  br label %digitsToWords.exit

if.done.i:                                        ; preds = %entry
  %.lhs.trunc97 = trunc i64 %4 to i16
  %8 = sdiv i16 %.lhs.trunc97, 9
  %.sext98 = sext i16 %8 to i64
  br label %digitsToWords.exit

digitsToWords.exit:                               ; preds = %if.then.i, %if.done.i
  %common.ret.op.i = phi i64 [ %.sext98, %if.done.i ], [ %7, %if.then.i ]
  %9 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 1
  %10 = load i8, i8* %9, align 1
  %11 = sext i8 %10 to i64
  %12 = add nsw i64 %11, 8
  %13 = icmp ult i64 %12, 128
  br i1 %13, label %if.then.i66, label %if.done.i68

if.then.i66:                                      ; preds = %digitsToWords.exit
  %14 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %12
  %15 = load i64, i64* %14, align 8
  br label %digitsToWords.exit69

if.done.i68:                                      ; preds = %digitsToWords.exit
  %.lhs.trunc95 = trunc i64 %12 to i16
  %16 = sdiv i16 %.lhs.trunc95, 9
  %.sext96 = sext i16 %16 to i64
  br label %digitsToWords.exit69

digitsToWords.exit69:                             ; preds = %if.then.i66, %if.done.i68
  %common.ret.op.i67 = phi i64 [ %.sext96, %if.done.i68 ], [ %15, %if.then.i66 ]
  %17 = icmp ne %MyDecimal* %from2, null
  tail call void @llvm.assume(i1 %17)
  %18 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 0
  %19 = load i8, i8* %18, align 1
  %20 = sext i8 %19 to i64
  %21 = add nsw i64 %20, 8
  %22 = icmp ult i64 %21, 128
  br i1 %22, label %if.then.i70, label %if.done.i72

if.then.i70:                                      ; preds = %digitsToWords.exit69
  %23 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %21
  %24 = load i64, i64* %23, align 8
  br label %digitsToWords.exit73

if.done.i72:                                      ; preds = %digitsToWords.exit69
  %.lhs.trunc93 = trunc i64 %21 to i16
  %25 = sdiv i16 %.lhs.trunc93, 9
  %.sext94 = sext i16 %25 to i64
  br label %digitsToWords.exit73

digitsToWords.exit73:                             ; preds = %if.then.i70, %if.done.i72
  %common.ret.op.i71 = phi i64 [ %.sext94, %if.done.i72 ], [ %24, %if.then.i70 ]
  %26 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 1
  %27 = load i8, i8* %26, align 1
  %28 = sext i8 %27 to i64
  %29 = add nsw i64 %28, 8
  %30 = icmp ult i64 %29, 128
  br i1 %30, label %if.then.i74, label %if.done.i76

if.then.i74:                                      ; preds = %digitsToWords.exit73
  %31 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %29
  %32 = load i64, i64* %31, align 8
  br label %digitsToWords.exit77

if.done.i76:                                      ; preds = %digitsToWords.exit73
  %.lhs.trunc91 = trunc i64 %29 to i16
  %33 = sdiv i16 %.lhs.trunc91, 9
  %.sext92 = sext i16 %33 to i64
  br label %digitsToWords.exit77

digitsToWords.exit77:                             ; preds = %if.then.i74, %if.done.i76
  %common.ret.op.i75 = phi i64 [ %.sext92, %if.done.i76 ], [ %32, %if.then.i74 ]
  %34 = add nsw i64 %4, %20
  %35 = icmp ult i64 %34, 128
  br i1 %35, label %if.then.i78, label %if.done.i80

if.then.i78:                                      ; preds = %digitsToWords.exit77
  %36 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %34
  %37 = load i64, i64* %36, align 8
  br label %digitsToWords.exit81

if.done.i80:                                      ; preds = %digitsToWords.exit77
  %.lhs.trunc89 = trunc i64 %34 to i16
  %38 = sdiv i16 %.lhs.trunc89, 9
  %.sext90 = sext i16 %38 to i64
  br label %digitsToWords.exit81

digitsToWords.exit81:                             ; preds = %if.then.i78, %if.done.i80
  %common.ret.op.i79 = phi i64 [ %.sext90, %if.done.i80 ], [ %37, %if.then.i78 ]
  %39 = add i64 %common.ret.op.i75, %common.ret.op.i67
  %40 = icmp ne %MyDecimal* %to, null
  tail call void @llvm.assume(i1 %40)
  %41 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 2
  %42 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 2
  %43 = load i8, i8* %42, align 1
  %44 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 2
  %45 = load i8, i8* %44, align 1
  %46 = add i8 %45, %43
  %47 = icmp slt i8 %46, 30
  %spec.select.i = select i1 %47, i8 %46, i8 30
  store i8 %spec.select.i, i8* %41, align 1
  %48 = add i64 %common.ret.op.i79, %39
  %49 = icmp sgt i64 %48, 9
  br i1 %49, label %if.then.i82, label %if.done2.i

if.then.i82:                                      ; preds = %digitsToWords.exit81
  %50 = icmp sgt i64 %common.ret.op.i79, 9
  br i1 %50, label %fixWordCntError.exit, label %if.done.i84

if.done.i84:                                      ; preds = %if.then.i82
  %51 = sub i64 9, %common.ret.op.i79
  %52 = insertvalue { i64, i64, i32 } zeroinitializer, i64 %common.ret.op.i79, 0
  %53 = insertvalue { i64, i64, i32 } %52, i64 %51, 1
  %54 = insertvalue { i64, i64, i32 } %53, i32 2, 2
  br label %fixWordCntError.exit

if.done2.i:                                       ; preds = %digitsToWords.exit81
  %55 = insertvalue { i64, i64, i32 } zeroinitializer, i64 %common.ret.op.i79, 0
  %56 = insertvalue { i64, i64, i32 } %55, i64 %39, 1
  %57 = insertvalue { i64, i64, i32 } %56, i32 0, 2
  br label %fixWordCntError.exit

fixWordCntError.exit:                             ; preds = %if.then.i82, %if.done.i84, %if.done2.i
  %common.ret.op.i83 = phi { i64, i64, i32 } [ %54, %if.done.i84 ], [ %57, %if.done2.i ], [ { i64 9, i64 0, i32 1 }, %if.then.i82 ]
  %58 = extractvalue { i64, i64, i32 } %common.ret.op.i83, 0
  %59 = extractvalue { i64, i64, i32 } %common.ret.op.i83, 1
  %60 = extractvalue { i64, i64, i32 } %common.ret.op.i83, 2
  %61 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 3
  %62 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 3
  %63 = load i1, i1* %62, align 1
  %64 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 3
  %65 = load i1, i1* %64, align 1
  %66 = xor i1 %63, %65
  store i1 %66, i1* %61, align 1
  %67 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 1
  %68 = load i8, i8* %9, align 1
  %69 = load i8, i8* %26, align 1
  %70 = add i8 %69, %68
  %71 = icmp slt i8 %70, 31
  %spec.store.select = select i1 %71, i8 %70, i8 31
  store i8 %spec.store.select, i8* %67, align 1
  %72 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 0
  %73 = trunc i64 %58 to i8
  %74 = mul i8 %73, 9
  store i8 %74, i8* %72, align 1
  switch i32 %60, label %deref.next105 [
    i32 1, label %if.then1
    i32 0, label %if.done11
  ]

if.then1:                                         ; preds = %if.then14, %for.body19, %gep.next207, %digitsToWords.exit88, %fixWordCntError.exit, %for.done31
  %merge = phi i32 [ %60, %fixWordCntError.exit ], [ %60, %for.done31 ], [ %60, %digitsToWords.exit88 ], [ %60, %gep.next207 ], [ 1, %for.body19 ], [ 1, %if.then14 ]
  ret i32 %merge

if.done7:                                         ; preds = %deref.next105, %store.next109
  %75 = icmp sgt i64 %common.ret.op.i79, %58
  br i1 %75, label %if.then8, label %if.else

if.then8:                                         ; preds = %if.done7
  %76 = sub i64 %common.ret.op.i79, %58
  %77 = ashr i64 %76, 1
  %.neg65 = sub i64 %common.ret.op.i71, %76
  %78 = add i64 %.neg65, %77
  br label %if.done11

if.else:                                          ; preds = %if.done7
  %79 = sub i64 %39, %59
  %80 = ashr i64 %79, 1
  %.not62 = icmp sgt i64 %common.ret.op.i67, %common.ret.op.i75
  br i1 %.not62, label %if.else10, label %if.then9

if.then9:                                         ; preds = %if.else
  %81 = sub i64 %common.ret.op.i67, %80
  %.neg64 = sub i64 %common.ret.op.i75, %79
  %82 = add i64 %.neg64, %80
  br label %if.done11

if.else10:                                        ; preds = %if.else
  %83 = sub i64 %common.ret.op.i75, %80
  %.neg63 = sub i64 %common.ret.op.i67, %79
  %84 = add i64 %.neg63, %80
  br label %if.done11

if.done11:                                        ; preds = %fixWordCntError.exit, %if.else10, %if.then9, %if.then8
  %85 = phi i64 [ 0, %if.then8 ], [ %81, %if.then9 ], [ %84, %if.else10 ], [ %common.ret.op.i67, %fixWordCntError.exit ]
  %86 = phi i64 [ %78, %if.then8 ], [ %common.ret.op.i71, %if.then9 ], [ %common.ret.op.i71, %if.else10 ], [ %common.ret.op.i71, %fixWordCntError.exit ]
  %87 = phi i64 [ 0, %if.then8 ], [ %82, %if.then9 ], [ %83, %if.else10 ], [ %common.ret.op.i75, %fixWordCntError.exit ]
  %88 = add i64 %58, %59
  %89 = add i64 %87, %common.ret.op.i71
  %90 = sub i64 %common.ret.op.i71, %86
  %.repack = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 0
  %91 = add i64 %common.ret.op.i, -1
  %92 = add i64 %91, %85
  %93 = add i64 %89, -1
  %.not59106 = icmp slt i64 %93, %90
  %94 = icmp sgt i64 %92, -1
  %95 = bitcast i32* %.repack to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 4 dereferenceable(36) %95, i8 0, i64 36, i1 false)
  br i1 %94, label %for.loop12.preheader, label %deref.next171

for.loop12.preheader:                             ; preds = %if.done11, %for.done22
  %.in = phi i64 [ %97, %for.done22 ], [ %88, %if.done11 ]
  %96 = phi i64 [ %105, %for.done22 ], [ %92, %if.done11 ]
  %97 = add i64 %.in, -1
  %98 = icmp ult i64 %96, 9
  %99 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 4, i64 %96
  br i1 %.not59106, label %for.done22, label %gep.next123.lr.ph

gep.next123.lr.ph:                                ; preds = %for.loop12.preheader
  tail call void @llvm.assume(i1 %98)
  br label %gep.next123

for.done:                                         ; preds = %gep.next123
  %100 = icmp sgt i32 %158, 0
  br i1 %100, label %if.then14, label %for.done22

if.then14:                                        ; preds = %for.done
  %101 = icmp eq i64 %127, 0
  br i1 %101, label %if.then1, label %gep.next147

for.body19:                                       ; preds = %for.body19.preheader, %gep.next159
  %.in112 = phi i64 [ %103, %gep.next159 ], [ %159, %for.body19.preheader ]
  %102 = phi i32 [ 1, %gep.next159 ], [ %.mux, %for.body19.preheader ]
  %103 = add nsw i64 %.in112, -1
  %104 = icmp slt i64 %.in112, 1
  br i1 %104, label %if.then1, label %gep.next159

for.done22:                                       ; preds = %gep.next159, %gep.next147, %for.loop12.preheader, %for.done
  %105 = add i64 %96, -1
  %106 = icmp sgt i64 %105, -1
  br i1 %106, label %for.loop12.preheader, label %deref.next171.loopexit

for.body25:                                       ; preds = %for.body25.preheader, %if.done26
  %107 = phi i64 [ %111, %if.done26 ], [ 0, %for.body25.preheader ]
  %108 = icmp ult i64 %107, 9
  tail call void @llvm.assume(i1 %108)
  %109 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %107
  %110 = load i32, i32* %109, align 4
  %.not34 = icmp eq i32 %110, 0
  br i1 %.not34, label %if.done26, label %deref.next187

if.done26:                                        ; preds = %for.body25
  %111 = add nuw nsw i64 %107, 1
  %112 = icmp eq i64 %111, %88
  br i1 %112, label %deref.next181, label %for.body25

for.body30:                                       ; preds = %deref.next197
  %113 = add nuw nsw i64 %194, 1
  %114 = add nsw i8 %192, -9
  store i8 %114, i8* %72, align 1
  %115 = add i64 %193, -1
  %116 = icmp ult i64 %194, 8
  tail call void @llvm.assume(i1 %116)
  %117 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %113
  %118 = load i32, i32* %117, align 4
  %119 = icmp eq i32 %118, 0
  br i1 %119, label %deref.next197, label %for.done31

for.done31:                                       ; preds = %for.body30, %deref.next197
  %.lcssa103 = phi i64 [ %113, %for.body30 ], [ %194, %deref.next197 ]
  %.lcssa = phi i64 [ %115, %for.body30 ], [ %193, %deref.next197 ]
  %.not = icmp ne i64 %.lcssa103, 0
  %120 = icmp sgt i64 %.lcssa, 0
  %or.cond = select i1 %.not, i1 %120, i1 false
  br i1 %or.cond, label %gep.next207.preheader, label %if.then1

gep.next207.preheader:                            ; preds = %for.done31
  %121 = insertelement <2 x i64> <i64 0, i64 poison>, i64 %.lcssa103, i32 1
  br label %gep.next207

deref.next105:                                    ; preds = %fixWordCntError.exit
  %122 = trunc i64 %59 to i8
  %123 = mul i8 %122, 9
  %124 = icmp sgt i8 %spec.store.select, %123
  br i1 %124, label %store.next109, label %if.done7

store.next109:                                    ; preds = %deref.next105
  store i8 %123, i8* %67, align 1
  br label %if.done7

gep.next123:                                      ; preds = %gep.next123.lr.ph, %gep.next123
  %125 = phi i64 [ %93, %gep.next123.lr.ph ], [ %160, %gep.next123 ]
  %126 = phi i32 [ 0, %gep.next123.lr.ph ], [ %158, %gep.next123 ]
  %127 = phi i64 [ %97, %gep.next123.lr.ph ], [ %159, %gep.next123 ]
  %128 = load i32, i32* %99, align 4
  %129 = sext i32 %128 to i64
  %130 = icmp ult i64 %125, 9
  tail call void @llvm.assume(i1 %130)
  %131 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 4, i64 %125
  %132 = load i32, i32* %131, align 4
  %133 = sext i32 %132 to i64
  %134 = mul nsw i64 %133, %129
  %135 = sdiv i64 %134, 1000000000
  %136 = trunc i64 %135 to i32
  %137 = and i64 %135, 4294967295
  %.neg = mul nsw i64 %137, -1000000000
  %138 = add nsw i64 %.neg, %134
  %139 = icmp ult i64 %127, 9
  tail call void @llvm.assume(i1 %139)
  %140 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %127
  %141 = load i32, i32* %140, align 4
  %142 = sext i32 %141 to i64
  %143 = shl i64 %138, 32
  %144 = ashr exact i64 %143, 32
  %145 = sext i32 %126 to i64
  %146 = add nsw i64 %142, %145
  %147 = add nsw i64 %146, %144
  %148 = icmp sgt i64 %147, 999999999
  %149 = add nsw i64 %147, -1000000000
  %150 = zext i1 %148 to i32
  %151 = select i1 %148, i64 %149, i64 %147
  %152 = icmp sgt i64 %151, 999999999
  %153 = add nsw i64 %151, 3294967296
  %154 = select i1 %148, i32 2, i32 1
  %155 = select i1 %152, i32 %154, i32 %150
  %156 = select i1 %152, i64 %153, i64 %151
  %157 = trunc i64 %156 to i32
  store i32 %157, i32* %140, align 4
  %158 = add i32 %155, %136
  %159 = add nsw i64 %127, -1
  %160 = add nsw i64 %125, -1
  %.not59.not = icmp sgt i64 %125, %90
  br i1 %.not59.not, label %gep.next123, label %for.done

gep.next147:                                      ; preds = %if.then14
  %161 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %159
  %162 = load i32, i32* %161, align 4
  %163 = sext i32 %162 to i64
  %164 = zext i32 %158 to i64
  %165 = add nsw i64 %163, %164
  %166 = icmp sgt i64 %165, 999999999
  %167 = add nsw i64 %165, -1000000000
  %168 = select i1 %166, i64 %167, i64 %165
  %169 = icmp sgt i64 %168, 999999999
  %170 = add nsw i64 %168, 3294967296
  %171 = select i1 %169, i64 %170, i64 %168
  %172 = trunc i64 %171 to i32
  store i32 %172, i32* %161, align 4
  %brmerge = or i1 %169, %166
  br i1 %brmerge, label %for.body19.preheader, label %for.done22

for.body19.preheader:                             ; preds = %gep.next147
  %173 = and i1 %169, %166
  %.mux = select i1 %173, i32 2, i32 1
  br label %for.body19

gep.next159:                                      ; preds = %for.body19
  %174 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %103
  %175 = load i32, i32* %174, align 4
  %176 = add i32 %175, %102
  %177 = icmp sgt i32 %176, 999999999
  %178 = add i32 %176, -1000000000
  %179 = select i1 %177, i32 %178, i32 %176
  store i32 %179, i32* %174, align 4
  br i1 %177, label %for.body19, label %for.done22

deref.next171.loopexit:                           ; preds = %for.done22
  %.pre = load i1, i1* %61, align 1
  br i1 %.pre, label %for.body25.preheader, label %deref.next187

deref.next171:                                    ; preds = %if.done11
  br i1 %66, label %for.body25.preheader, label %deref.next187

for.body25.preheader:                             ; preds = %deref.next171.loopexit, %deref.next171
  br label %for.body25

deref.next181:                                    ; preds = %if.done26
  %180 = load i8, i8* %41, align 1
  store i8 0, i8* %72, align 4
  store i8 %180, i8* %67, align 1
  %181 = bitcast i1* %61 to i8*
  call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(37) %181, i8 0, i64 37, i1 false)
  br label %deref.next187

deref.next187:                                    ; preds = %for.body25, %deref.next171.loopexit, %deref.next181, %deref.next171
  %182 = load i8, i8* %67, align 1
  %183 = sext i8 %182 to i64
  %184 = add nsw i64 %183, 8
  %185 = icmp ult i64 %184, 128
  br i1 %185, label %if.then.i85, label %if.done.i87

if.then.i85:                                      ; preds = %deref.next187
  %186 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %184
  %187 = load i64, i64* %186, align 8
  br label %digitsToWords.exit88

if.done.i87:                                      ; preds = %deref.next187
  %.lhs.trunc = trunc i64 %184 to i16
  %188 = sdiv i16 %.lhs.trunc, 9
  %.sext = sext i16 %188 to i64
  br label %digitsToWords.exit88

digitsToWords.exit88:                             ; preds = %if.then.i85, %if.done.i87
  %common.ret.op.i86 = phi i64 [ %.sext, %if.done.i87 ], [ %187, %if.then.i85 ]
  %189 = load i32, i32* %.repack, align 4
  %190 = icmp eq i32 %189, 0
  br i1 %190, label %deref.next197.preheader, label %if.then1

deref.next197.preheader:                          ; preds = %digitsToWords.exit88
  %191 = add i64 %common.ret.op.i86, %58
  %.pre119 = load i8, i8* %72, align 1
  br label %deref.next197

deref.next197:                                    ; preds = %deref.next197.preheader, %for.body30
  %192 = phi i8 [ %114, %for.body30 ], [ %.pre119, %deref.next197.preheader ]
  %193 = phi i64 [ %115, %for.body30 ], [ %191, %deref.next197.preheader ]
  %194 = phi i64 [ %113, %for.body30 ], [ 0, %deref.next197.preheader ]
  %195 = icmp sgt i8 %192, 9
  br i1 %195, label %for.body30, label %for.done31

gep.next207:                                      ; preds = %gep.next207.preheader, %gep.next207
  %196 = phi i64 [ %206, %gep.next207 ], [ %.lcssa, %gep.next207.preheader ]
  %197 = phi <2 x i64> [ %205, %gep.next207 ], [ %121, %gep.next207.preheader ]
  %198 = extractelement <2 x i64> %197, i32 0
  %199 = icmp ult i64 %198, 9
  tail call void @llvm.assume(i1 %199)
  %200 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %198
  %201 = extractelement <2 x i64> %197, i32 1
  %202 = icmp ult i64 %201, 9
  tail call void @llvm.assume(i1 %202)
  %203 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %201
  %204 = load i32, i32* %203, align 4
  store i32 %204, i32* %200, align 4
  %205 = add nuw nsw <2 x i64> %197, <i64 1, i64 1>
  %206 = add nsw i64 %196, -1
  %207 = icmp sgt i64 %196, 1
  br i1 %207, label %gep.next207, label %if.then1
}

; Function Attrs: alwaysinline
define internal i32 @DecimalSub(%MyDecimal* dereferenceable_or_null(40) %from1, %MyDecimal* dereferenceable_or_null(40) %from2, %MyDecimal* dereferenceable_or_null(40) %to) unnamed_addr #0 {
entry:
  %0 = icmp ne %MyDecimal* %to, null
  tail call void @llvm.assume(i1 %0) #3
  %1 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 0
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(40) %1, i8 0, i64 40, i1 false) #3
  %2 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 2
  %3 = icmp ne %MyDecimal* %from1, null
  tail call void @llvm.assume(i1 %3)
  %4 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 2
  %5 = load i8, i8* %4, align 1
  %6 = icmp ne %MyDecimal* %from2, null
  tail call void @llvm.assume(i1 %6)
  %7 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 2
  %8 = load i8, i8* %7, align 1
  %9 = icmp sgt i8 %5, %8
  %spec.select.i = select i1 %9, i8 %5, i8 %8
  store i8 %spec.select.i, i8* %2, align 1
  %10 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 3
  %11 = load i1, i1* %10, align 1
  %12 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 3
  %13 = load i1, i1* %12, align 1
  %14 = xor i1 %11, %13
  %15 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 0
  %16 = load i8, i8* %15, align 1
  %17 = sext i8 %16 to i64
  %18 = add nsw i64 %17, 8
  %19 = icmp ult i64 %18, 128
  br i1 %14, label %if.done, label %if.then

common.ret:                                       ; preds = %if.then25.i, %for.done24.i, %if.then3.i, %doSub.exit
  %common.ret.op = phi i32 [ %oldret1.i, %doSub.exit ], [ 1, %if.then3.i ], [ %299, %for.done24.i ], [ %299, %if.then25.i ]
  ret i32 %common.ret.op

if.then:                                          ; preds = %entry
  br i1 %19, label %if.then.i.i, label %if.done.i.i

if.then.i.i:                                      ; preds = %if.then
  %20 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %18
  %21 = load i64, i64* %20, align 8
  br label %digitsToWords.exit.i

if.done.i.i:                                      ; preds = %if.then
  %.lhs.trunc50.i = trunc i64 %18 to i16
  %22 = sdiv i16 %.lhs.trunc50.i, 9
  %.sext51.i = sext i16 %22 to i64
  br label %digitsToWords.exit.i

digitsToWords.exit.i:                             ; preds = %if.done.i.i, %if.then.i.i
  %common.ret.op.i.i = phi i64 [ %.sext51.i, %if.done.i.i ], [ %21, %if.then.i.i ]
  %23 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 1
  %24 = load i8, i8* %23, align 1
  %25 = sext i8 %24 to i64
  %26 = add nsw i64 %25, 8
  %27 = icmp ult i64 %26, 128
  br i1 %27, label %if.then.i29.i, label %if.done.i31.i

if.then.i29.i:                                    ; preds = %digitsToWords.exit.i
  %28 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %26
  %29 = load i64, i64* %28, align 8
  br label %digitsToWords.exit32.i

if.done.i31.i:                                    ; preds = %digitsToWords.exit.i
  %.lhs.trunc48.i = trunc i64 %26 to i16
  %30 = sdiv i16 %.lhs.trunc48.i, 9
  %.sext49.i = sext i16 %30 to i64
  br label %digitsToWords.exit32.i

digitsToWords.exit32.i:                           ; preds = %if.done.i31.i, %if.then.i29.i
  %common.ret.op.i30.i = phi i64 [ %.sext49.i, %if.done.i31.i ], [ %29, %if.then.i29.i ]
  %31 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 0
  %32 = load i8, i8* %31, align 1
  %33 = sext i8 %32 to i64
  %34 = add nsw i64 %33, 8
  %35 = icmp ult i64 %34, 128
  br i1 %35, label %if.then.i33.i, label %if.done.i35.i

if.then.i33.i:                                    ; preds = %digitsToWords.exit32.i
  %36 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %34
  %37 = load i64, i64* %36, align 8
  br label %digitsToWords.exit36.i

if.done.i35.i:                                    ; preds = %digitsToWords.exit32.i
  %.lhs.trunc46.i = trunc i64 %34 to i16
  %38 = sdiv i16 %.lhs.trunc46.i, 9
  %.sext47.i = sext i16 %38 to i64
  br label %digitsToWords.exit36.i

digitsToWords.exit36.i:                           ; preds = %if.done.i35.i, %if.then.i33.i
  %common.ret.op.i34.i = phi i64 [ %.sext47.i, %if.done.i35.i ], [ %37, %if.then.i33.i ]
  %39 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 1
  %40 = load i8, i8* %39, align 1
  %41 = sext i8 %40 to i64
  %42 = add nsw i64 %41, 8
  %43 = icmp ult i64 %42, 128
  br i1 %43, label %if.then.i37.i, label %if.done.i39.i

if.then.i37.i:                                    ; preds = %digitsToWords.exit36.i
  %44 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %42
  %45 = load i64, i64* %44, align 8
  br label %digitsToWords.exit40.i

if.done.i39.i:                                    ; preds = %digitsToWords.exit36.i
  %.lhs.trunc.i = trunc i64 %42 to i16
  %46 = sdiv i16 %.lhs.trunc.i, 9
  %.sext.i = sext i16 %46 to i64
  br label %digitsToWords.exit40.i

digitsToWords.exit40.i:                           ; preds = %if.done.i39.i, %if.then.i37.i
  %common.ret.op.i38.i = phi i64 [ %.sext.i, %if.done.i39.i ], [ %45, %if.then.i37.i ]
  %47 = icmp sgt i64 %common.ret.op.i30.i, %common.ret.op.i38.i
  %spec.select.i.i = select i1 %47, i64 %common.ret.op.i30.i, i64 %common.ret.op.i38.i
  %48 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 4, i64 0
  %49 = load i32, i32* %48, align 4
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %for.loop.preheader.i, label %gep.next87.i

for.loop.preheader.i:                             ; preds = %digitsToWords.exit40.i
  %51 = icmp sgt i64 %common.ret.op.i.i, 0
  br i1 %51, label %for.body.i, label %for.done.i

for.body.i:                                       ; preds = %for.loop.preheader.i, %for.body.gep.next85_crit_edge.i
  %52 = phi i64 [ %53, %for.body.gep.next85_crit_edge.i ], [ 0, %for.loop.preheader.i ]
  %53 = add nuw nsw i64 %52, 1
  %54 = icmp sgt i64 %common.ret.op.i.i, %53
  br i1 %54, label %for.body.gep.next85_crit_edge.i, label %for.done.i

for.body.gep.next85_crit_edge.i:                  ; preds = %for.body.i
  %.phi.trans.insert.i = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 4, i64 %53
  %.pre.i = load i32, i32* %.phi.trans.insert.i, align 4
  %55 = icmp ult i64 %52, 8
  tail call void @llvm.assume(i1 %55) #3
  %56 = icmp eq i32 %.pre.i, 0
  br i1 %56, label %for.body.i, label %for.done.i

for.done.i:                                       ; preds = %for.body.gep.next85_crit_edge.i, %for.body.i, %for.loop.preheader.i
  %.lcssa77.i = phi i64 [ 0, %for.loop.preheader.i ], [ %common.ret.op.i.i, %for.body.i ], [ %53, %for.body.gep.next85_crit_edge.i ]
  %57 = sub i64 %common.ret.op.i.i, %.lcssa77.i
  br label %gep.next87.i

for.body3.i:                                      ; preds = %for.loop1.preheader.i, %for.body3.gep.next93_crit_edge.i
  %58 = phi i64 [ %59, %for.body3.gep.next93_crit_edge.i ], [ 0, %for.loop1.preheader.i ]
  %59 = add nuw nsw i64 %58, 1
  %60 = icmp sgt i64 %common.ret.op.i34.i, %59
  br i1 %60, label %for.body3.gep.next93_crit_edge.i, label %for.done4.i

for.body3.gep.next93_crit_edge.i:                 ; preds = %for.body3.i
  %.phi.trans.insert125.i = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 4, i64 %59
  %.pre126.i = load i32, i32* %.phi.trans.insert125.i, align 4
  %61 = icmp ult i64 %58, 8
  tail call void @llvm.assume(i1 %61) #3
  %62 = icmp eq i32 %.pre126.i, 0
  br i1 %62, label %for.body3.i, label %for.done4.i

for.done4.i:                                      ; preds = %for.body3.gep.next93_crit_edge.i, %for.body3.i, %for.loop1.preheader.i
  %.lcssa76.i = phi i64 [ 0, %for.loop1.preheader.i ], [ %common.ret.op.i34.i, %for.body3.i ], [ %59, %for.body3.gep.next93_crit_edge.i ]
  %63 = sub i64 %common.ret.op.i34.i, %.lcssa76.i
  br label %if.done5.i

if.done5.i:                                       ; preds = %gep.next87.i, %for.done4.i
  %64 = phi i64 [ %common.ret.op.i34.i, %gep.next87.i ], [ %63, %for.done4.i ]
  %65 = phi i64 [ 0, %gep.next87.i ], [ %.lcssa76.i, %for.done4.i ]
  %66 = icmp sgt i64 %64, %216
  br i1 %66, label %deref.next111.i, label %if.else43.i

if.done12.i:                                      ; preds = %if.else43.i, %gep.next261.i, %if.then57.i, %deref.next111.i
  %storemerge.i = phi i1 [ %222, %deref.next111.i ], [ %11, %if.then57.i ], [ %11, %gep.next261.i ], [ %11, %if.else43.i ]
  %67 = phi %MyDecimal* [ %from2, %deref.next111.i ], [ %from1, %if.then57.i ], [ %from1, %gep.next261.i ], [ %from1, %if.else43.i ]
  %68 = phi %MyDecimal* [ %from1, %deref.next111.i ], [ %from2, %if.then57.i ], [ %from2, %gep.next261.i ], [ %from2, %if.else43.i ]
  %69 = phi i64 [ %64, %deref.next111.i ], [ %216, %if.then57.i ], [ %216, %gep.next261.i ], [ %216, %if.else43.i ]
  %70 = phi i64 [ %.ph20, %deref.next111.i ], [ %205, %if.then57.i ], [ %205, %gep.next261.i ], [ %common.ret.op.i30.i, %if.else43.i ]
  %71 = phi i64 [ %65, %deref.next111.i ], [ %217, %if.then57.i ], [ %217, %gep.next261.i ], [ %217, %if.else43.i ]
  %72 = phi i64 [ %217, %deref.next111.i ], [ %65, %if.then57.i ], [ %65, %gep.next261.i ], [ %65, %if.else43.i ]
  %73 = phi <2 x i64> [ %224, %deref.next111.i ], [ %215, %if.then57.i ], [ %251, %gep.next261.i ], [ %199, %if.else43.i ]
  %74 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 3
  store i1 %storemerge.i, i1* %74, align 1
  %75 = add i64 %69, %spec.select.i.i
  %76 = icmp sgt i64 %75, 9
  br i1 %76, label %if.then.i41.i, label %if.done2.i.i

if.then.i41.i:                                    ; preds = %if.done12.i
  %77 = icmp sgt i64 %69, 9
  br i1 %77, label %fixWordCntError.exit.i, label %if.done.i43.i

if.done.i43.i:                                    ; preds = %if.then.i41.i
  %78 = sub i64 9, %69
  %79 = insertvalue { i64, i64, i32 } zeroinitializer, i64 %69, 0
  %80 = insertvalue { i64, i64, i32 } %79, i64 %78, 1
  %81 = insertvalue { i64, i64, i32 } %80, i32 2, 2
  br label %fixWordCntError.exit.i

if.done2.i.i:                                     ; preds = %if.done12.i
  %82 = insertvalue { i64, i64, i32 } zeroinitializer, i64 %69, 0
  %83 = insertvalue { i64, i64, i32 } %82, i64 %spec.select.i.i, 1
  %84 = insertvalue { i64, i64, i32 } %83, i32 0, 2
  br label %fixWordCntError.exit.i

fixWordCntError.exit.i:                           ; preds = %if.done2.i.i, %if.done.i43.i, %if.then.i41.i
  %common.ret.op.i42.i = phi { i64, i64, i32 } [ %81, %if.done.i43.i ], [ %84, %if.done2.i.i ], [ { i64 9, i64 0, i32 1 }, %if.then.i41.i ]
  %85 = extractvalue { i64, i64, i32 } %common.ret.op.i42.i, 0
  %86 = extractvalue { i64, i64, i32 } %common.ret.op.i42.i, 1
  %87 = extractvalue { i64, i64, i32 } %common.ret.op.i42.i, 2
  %88 = add i64 %85, %86
  %89 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 1
  %90 = getelementptr inbounds %MyDecimal, %MyDecimal* %67, i64 0, i32 1
  %91 = load i8, i8* %90, align 1
  store i8 %91, i8* %89, align 1
  %92 = getelementptr inbounds %MyDecimal, %MyDecimal* %68, i64 0, i32 1
  %93 = load i8, i8* %92, align 1
  %94 = icmp slt i8 %91, %93
  %spec.store.select.i = select i1 %94, i8 %93, i8 %91
  store i8 %spec.store.select.i, i8* %89, align 1
  %95 = trunc i64 %85 to i8
  %96 = mul i8 %95, 9
  store i8 %96, i8* %1, align 1
  %.not.i = icmp eq i32 %87, 0
  br i1 %.not.i, label %if.done23.i, label %deref.next145.i

if.done17.i:                                      ; preds = %store.next149.i, %deref.next145.i
  %97 = icmp sgt i64 %70, %86
  %spec.select.i1 = select i1 %97, i64 %86, i64 %70
  %98 = insertelement <2 x i64> poison, i64 %85, i32 0
  %99 = insertelement <2 x i64> %98, i64 %86, i32 1
  %100 = icmp sgt <2 x i64> %73, %99
  %101 = select <2 x i1> %100, <2 x i64> %99, <2 x i64> %73
  br label %if.done23.i

if.done23.i:                                      ; preds = %if.done17.i, %fixWordCntError.exit.i
  %102 = phi i64 [ %70, %fixWordCntError.exit.i ], [ %spec.select.i1, %if.done17.i ]
  %103 = phi <2 x i64> [ %73, %fixWordCntError.exit.i ], [ %101, %if.done17.i ]
  %104 = extractelement <2 x i64> %103, i32 1
  %105 = icmp sgt i64 %102, %104
  %106 = add i64 %85, %71
  %107 = add i64 %102, %106
  br i1 %105, label %if.then24.i, label %if.else.i

if.then24.i:                                      ; preds = %if.done23.i
  %108 = add i64 %104, %106
  %109 = extractelement <2 x i64> %103, i32 0
  %110 = add i64 %109, %72
  %111 = add i64 %110, %104
  %112 = icmp sgt i64 %86, %102
  br i1 %112, label %for.body26.preheader.i, label %for.loop27.preheader.i

for.body26.preheader.i:                           ; preds = %if.then24.i
  %113 = add i64 %102, %85
  %114 = shl i64 %113, 2
  %115 = add i64 %114, 4
  %uglygep119.i = getelementptr i8, i8* %1, i64 %115
  %116 = sub i64 %86, %102
  %117 = shl i64 %116, 2
  tail call void @llvm.memset.p0i8.i64(i8* align 4 %uglygep119.i, i8 0, i64 %117, i1 false) #3
  br label %for.loop27.preheader.i

for.loop27.preheader.i:                           ; preds = %for.body26.preheader.i, %if.then24.i
  %.lcssa65.i = phi i64 [ %88, %if.then24.i ], [ %113, %for.body26.preheader.i ]
  %118 = icmp sgt i64 %107, %108
  br i1 %118, label %for.body28.i, label %for.loop29.preheader.i

for.body28.i:                                     ; preds = %for.loop27.preheader.i, %for.body28.i
  %119 = phi i64 [ %121, %for.body28.i ], [ %.lcssa65.i, %for.loop27.preheader.i ]
  %120 = phi i64 [ %122, %for.body28.i ], [ %107, %for.loop27.preheader.i ]
  %121 = add nsw i64 %119, -1
  %122 = add nsw i64 %120, -1
  %123 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %121
  %124 = getelementptr inbounds %MyDecimal, %MyDecimal* %67, i64 0, i32 4, i64 %122
  %125 = load i32, i32* %124, align 4
  store i32 %125, i32* %123, align 4
  %126 = icmp sgt i64 %122, %108
  br i1 %126, label %for.body28.i, label %for.loop29.preheader.i

for.loop31.preheader.i:                           ; preds = %for.body30.i, %for.loop29.preheader.i
  %.lcssa62.i = phi i64 [ %.ph.i, %for.loop29.preheader.i ], [ %134, %for.body30.i ]
  %.lcssa61.i = phi i32 [ %.ph55.i, %for.loop29.preheader.i ], [ %.lobit.i.i, %for.body30.i ]
  %.lcssa60.i = phi i64 [ %.ph56.i, %for.loop29.preheader.i ], [ %133, %for.body30.i ]
  %127 = icmp sgt i32 %.lcssa61.i, 0
  %128 = icmp sgt i64 %.lcssa62.i, %71
  %or.cond100.i = and i1 %128, %127
  br i1 %or.cond100.i, label %for.body33.i, label %for.loop34.preheader.i

for.body30.i:                                     ; preds = %for.loop29.preheader.i, %for.body30.i
  %129 = phi i64 [ %133, %for.body30.i ], [ %.ph56.i, %for.loop29.preheader.i ]
  %130 = phi i32 [ %.lobit.i.i, %for.body30.i ], [ %.ph55.i, %for.loop29.preheader.i ]
  %131 = phi i64 [ %135, %for.body30.i ], [ %.ph54.i, %for.loop29.preheader.i ]
  %132 = phi i64 [ %134, %for.body30.i ], [ %.ph.i, %for.loop29.preheader.i ]
  %133 = add nsw i64 %129, -1
  %134 = add nsw i64 %132, -1
  %135 = add nsw i64 %131, -1
  %136 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %133
  %137 = getelementptr inbounds %MyDecimal, %MyDecimal* %67, i64 0, i32 4, i64 %134
  %138 = load i32, i32* %137, align 4
  %139 = getelementptr inbounds %MyDecimal, %MyDecimal* %68, i64 0, i32 4, i64 %135
  %140 = load i32, i32* %139, align 4
  %141 = add i32 %130, %140
  %142 = sub i32 %138, %141
  %143 = icmp slt i32 %142, 0
  %144 = add i32 %142, 1000000000
  %.lobit.i.i = lshr i32 %142, 31
  %145 = select i1 %143, i32 %144, i32 %142
  store i32 %145, i32* %136, align 4
  %146 = icmp sgt i64 %135, %72
  br i1 %146, label %for.body30.i, label %for.loop31.preheader.i

for.loop34.preheader.i:                           ; preds = %for.body33.i, %for.loop31.preheader.i
  %.lcssa59.i = phi i64 [ %.lcssa62.i, %for.loop31.preheader.i ], [ %151, %for.body33.i ]
  %.lcssa58.i = phi i64 [ %.lcssa60.i, %for.loop31.preheader.i ], [ %150, %for.body33.i ]
  %147 = icmp sgt i64 %.lcssa59.i, %71
  br i1 %147, label %for.body35.i, label %for.loop36.preheader.i

for.body33.i:                                     ; preds = %for.loop31.preheader.i, %for.body33.i
  %148 = phi i64 [ %150, %for.body33.i ], [ %.lcssa60.i, %for.loop31.preheader.i ]
  %149 = phi i64 [ %151, %for.body33.i ], [ %.lcssa62.i, %for.loop31.preheader.i ]
  %150 = add nsw i64 %148, -1
  %151 = add nsw i64 %149, -1
  %152 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %150
  %153 = getelementptr inbounds %MyDecimal, %MyDecimal* %67, i64 0, i32 4, i64 %151
  %154 = load i32, i32* %153, align 4
  %155 = add i32 %154, -1
  %156 = icmp slt i32 %155, 0
  %157 = add i32 %154, 999999999
  %158 = select i1 %156, i32 %157, i32 %155
  store i32 %158, i32* %152, align 4
  %159 = icmp sgt i64 %151, %71
  %or.cond.i = and i1 %159, %156
  br i1 %or.cond.i, label %for.body33.i, label %for.loop34.preheader.i

for.loop36.preheader.i:                           ; preds = %for.body35.i, %for.loop34.preheader.i
  %.lcssa.i = phi i64 [ %.lcssa58.i, %for.loop34.preheader.i ], [ %164, %for.body35.i ]
  %160 = icmp sgt i64 %.lcssa.i, 0
  br i1 %160, label %for.body37.preheader.i, label %for.done38.i

for.body37.preheader.i:                           ; preds = %for.loop36.preheader.i
  %scevgep.i = getelementptr %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 0
  %scevgep124.i = bitcast i32* %scevgep.i to i8*
  %161 = shl nuw i64 %.lcssa.i, 2
  tail call void @llvm.memset.p0i8.i64(i8* align 4 %scevgep124.i, i8 0, i64 %161, i1 false) #3
  br label %for.done38.i

for.body35.i:                                     ; preds = %for.loop34.preheader.i, %for.body35.i
  %162 = phi i64 [ %164, %for.body35.i ], [ %.lcssa58.i, %for.loop34.preheader.i ]
  %163 = phi i64 [ %165, %for.body35.i ], [ %.lcssa59.i, %for.loop34.preheader.i ]
  %164 = add nsw i64 %162, -1
  %165 = add nsw i64 %163, -1
  %166 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %164
  %167 = getelementptr inbounds %MyDecimal, %MyDecimal* %67, i64 0, i32 4, i64 %165
  %168 = load i32, i32* %167, align 4
  store i32 %168, i32* %166, align 4
  %169 = icmp sgt i64 %165, %71
  br i1 %169, label %for.body35.i, label %for.loop36.preheader.i

for.done38.i:                                     ; preds = %for.body37.preheader.i, %for.loop36.preheader.i
  %170 = insertvalue { i64, i32 } zeroinitializer, i32 %87, 1
  br label %doSub.exit

if.else.i:                                        ; preds = %if.done23.i
  %171 = extractelement <2 x i64> %103, i32 0
  %172 = add i64 %171, %72
  %173 = add i64 %172, %104
  %174 = add i64 %172, %102
  %175 = icmp sgt i64 %86, %104
  br i1 %175, label %for.body40.preheader.i, label %for.loop41.preheader.i

for.body40.preheader.i:                           ; preds = %if.else.i
  %176 = add i64 %104, %85
  %177 = shl i64 %176, 2
  %178 = add i64 %177, 4
  %uglygep.i = getelementptr i8, i8* %1, i64 %178
  %179 = sub i64 %86, %104
  %180 = shl i64 %179, 2
  tail call void @llvm.memset.p0i8.i64(i8* align 4 %uglygep.i, i8 0, i64 %180, i1 false) #3
  br label %for.loop41.preheader.i

for.loop41.preheader.i:                           ; preds = %for.body40.preheader.i, %if.else.i
  %.lcssa69.i = phi i64 [ %88, %if.else.i ], [ %176, %for.body40.preheader.i ]
  %181 = icmp sgt i64 %173, %174
  br i1 %181, label %for.body42.i, label %for.loop29.preheader.i

for.loop29.preheader.i:                           ; preds = %for.body42.i, %for.body28.i, %for.loop41.preheader.i, %for.loop27.preheader.i
  %.ph.i = phi i64 [ %107, %for.loop27.preheader.i ], [ %107, %for.loop41.preheader.i ], [ %122, %for.body28.i ], [ %107, %for.body42.i ]
  %.ph54.i = phi i64 [ %111, %for.loop27.preheader.i ], [ %173, %for.loop41.preheader.i ], [ %111, %for.body28.i ], [ %187, %for.body42.i ]
  %.ph55.i = phi i32 [ 0, %for.loop27.preheader.i ], [ 0, %for.loop41.preheader.i ], [ 0, %for.body28.i ], [ %.lobit.i45.i, %for.body42.i ]
  %.ph56.i = phi i64 [ %.lcssa65.i, %for.loop27.preheader.i ], [ %.lcssa69.i, %for.loop41.preheader.i ], [ %121, %for.body28.i ], [ %186, %for.body42.i ]
  %182 = icmp sgt i64 %.ph54.i, %72
  br i1 %182, label %for.body30.i, label %for.loop31.preheader.i

for.body42.i:                                     ; preds = %for.loop41.preheader.i, %for.body42.i
  %183 = phi i64 [ %186, %for.body42.i ], [ %.lcssa69.i, %for.loop41.preheader.i ]
  %184 = phi i32 [ %.lobit.i45.i, %for.body42.i ], [ 0, %for.loop41.preheader.i ]
  %185 = phi i64 [ %187, %for.body42.i ], [ %173, %for.loop41.preheader.i ]
  %186 = add nsw i64 %183, -1
  %187 = add nsw i64 %185, -1
  %188 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %186
  %189 = getelementptr inbounds %MyDecimal, %MyDecimal* %68, i64 0, i32 4, i64 %187
  %190 = load i32, i32* %189, align 4
  %191 = add i32 %190, %184
  %192 = sub i32 0, %191
  %193 = icmp slt i32 %192, 0
  %194 = sub i32 1000000000, %191
  %.lobit.i45.i = lshr i32 %192, 31
  %195 = select i1 %193, i32 %194, i32 %192
  store i32 %195, i32* %188, align 4
  %196 = icmp sgt i64 %187, %174
  br i1 %196, label %for.body42.i, label %for.loop29.preheader.i

if.else43.i:                                      ; preds = %if.done5.i
  %197 = icmp eq i64 %64, %216
  %198 = insertelement <2 x i64> poison, i64 %common.ret.op.i38.i, i32 1
  %199 = insertelement <2 x i64> %198, i64 %64, i32 0
  br i1 %197, label %if.then44.i, label %if.done12.i

if.then44.i:                                      ; preds = %if.else43.i
  %200 = add i64 %common.ret.op.i30.i, %common.ret.op.i.i
  %201 = add i64 %common.ret.op.i38.i, %common.ret.op.i34.i
  br label %for.loop45.i

for.loop45.i:                                     ; preds = %gep.next237.i, %if.then44.i
  %.in28.i = phi i64 [ %200, %if.then44.i ], [ %202, %gep.next237.i ]
  %202 = add i64 %.in28.i, -1
  %.not2.i = icmp sgt i64 %217, %202
  br i1 %.not2.i, label %for.loop48.i.preheader, label %gep.next237.i

for.loop48.i.preheader:                           ; preds = %gep.next237.i, %for.loop45.i
  br label %for.loop48.i

for.loop48.i:                                     ; preds = %for.loop48.i.preheader, %gep.next243.i
  %.in.i = phi i64 [ %203, %gep.next243.i ], [ %201, %for.loop48.i.preheader ]
  %203 = add i64 %.in.i, -1
  %.not3.i = icmp sgt i64 %65, %203
  br i1 %.not3.i, label %for.done51.i, label %gep.next243.i

for.done51.i:                                     ; preds = %gep.next243.i, %for.loop48.i
  %204 = sub i64 %202, %common.ret.op.i.i
  %205 = add i64 %204, 1
  %206 = sub i64 %203, %common.ret.op.i34.i
  %207 = add i64 %206, 1
  %208 = icmp sle i64 %217, %202
  %209 = icmp sle i64 %65, %203
  %or.cond27781.i = and i1 %208, %209
  br i1 %or.cond27781.i, label %gep.next249.i, label %for.done56.i

for.body55.i:                                     ; preds = %gep.next249.i
  %210 = add nuw nsw i64 %237, 1
  %211 = add nuw nsw i64 %236, 1
  %212 = icmp slt i64 %237, %202
  %213 = icmp slt i64 %236, %203
  %or.cond277.i = and i1 %213, %212
  br i1 %or.cond277.i, label %gep.next249.i, label %for.done56.i

for.done56.i:                                     ; preds = %for.body55.i, %for.done51.i
  %.lcssa73.i = phi i64 [ %217, %for.done51.i ], [ %210, %for.body55.i ]
  %.lcssa72.i = phi i64 [ %65, %for.done51.i ], [ %211, %for.body55.i ]
  %.lcssa71.i = phi i1 [ %208, %for.done51.i ], [ %212, %for.body55.i ]
  %.lcssa70.i = phi i1 [ %209, %for.done51.i ], [ %213, %for.body55.i ]
  br i1 %.lcssa71.i, label %if.then57.i, label %if.else61.i

if.then57.i:                                      ; preds = %for.done56.i
  %214 = insertelement <2 x i64> poison, i64 %216, i32 0
  %215 = insertelement <2 x i64> %214, i64 %207, i32 1
  br i1 %.lcssa70.i, label %if.then57.i.gep.next261.i_crit_edge, label %if.done12.i

if.then57.i.gep.next261.i_crit_edge:              ; preds = %if.then57.i
  %.phi.trans.insert = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 4, i64 %.lcssa72.i
  %.pre = load i32, i32* %.phi.trans.insert, align 4
  %.phi.trans.insert78 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 4, i64 %.lcssa73.i
  %.pre79 = load i32, i32* %.phi.trans.insert78, align 4
  br label %gep.next261.i

if.else61.i:                                      ; preds = %for.done56.i
  br i1 %.lcssa70.i, label %deref.next111.i, label %gep.next271.i

gep.next87.i:                                     ; preds = %for.done.i, %digitsToWords.exit40.i
  %216 = phi i64 [ %common.ret.op.i.i, %digitsToWords.exit40.i ], [ %57, %for.done.i ]
  %217 = phi i64 [ 0, %digitsToWords.exit40.i ], [ %.lcssa77.i, %for.done.i ]
  %218 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 4, i64 0
  %219 = load i32, i32* %218, align 4
  %220 = icmp eq i32 %219, 0
  br i1 %220, label %for.loop1.preheader.i, label %if.done5.i

for.loop1.preheader.i:                            ; preds = %gep.next87.i
  %221 = icmp sgt i64 %common.ret.op.i34.i, 0
  br i1 %221, label %for.body3.i, label %for.done4.i

deref.next111.i:                                  ; preds = %if.done5.i, %gep.next261.i, %if.else61.i
  %.ph = phi i64 [ %205, %if.else61.i ], [ %205, %gep.next261.i ], [ %common.ret.op.i30.i, %if.done5.i ]
  %.ph20 = phi i64 [ %207, %if.else61.i ], [ %207, %gep.next261.i ], [ %common.ret.op.i38.i, %if.done5.i ]
  %222 = xor i1 %11, true
  %223 = insertelement <2 x i64> poison, i64 %216, i32 0
  %224 = insertelement <2 x i64> %223, i64 %.ph, i32 1
  br label %if.done12.i

deref.next145.i:                                  ; preds = %fixWordCntError.exit.i
  %225 = trunc i64 %86 to i8
  %226 = mul i8 %225, 9
  %227 = icmp sgt i8 %spec.store.select.i, %226
  br i1 %227, label %store.next149.i, label %if.done17.i

store.next149.i:                                  ; preds = %deref.next145.i
  store i8 %226, i8* %89, align 1
  br label %if.done17.i

gep.next237.i:                                    ; preds = %for.loop45.i
  %228 = icmp ult i64 %202, 9
  tail call void @llvm.assume(i1 %228) #3
  %229 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 4, i64 %202
  %230 = load i32, i32* %229, align 4
  %231 = icmp eq i32 %230, 0
  br i1 %231, label %for.loop45.i, label %for.loop48.i.preheader

gep.next243.i:                                    ; preds = %for.loop48.i
  %232 = icmp ult i64 %203, 9
  tail call void @llvm.assume(i1 %232) #3
  %233 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 4, i64 %203
  %234 = load i32, i32* %233, align 4
  %235 = icmp eq i32 %234, 0
  br i1 %235, label %for.loop48.i, label %for.done51.i

gep.next249.i:                                    ; preds = %for.done51.i, %for.body55.i
  %236 = phi i64 [ %211, %for.body55.i ], [ %65, %for.done51.i ]
  %237 = phi i64 [ %210, %for.body55.i ], [ %217, %for.done51.i ]
  %238 = icmp ult i64 %237, 9
  tail call void @llvm.assume(i1 %238) #3
  %239 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 4, i64 %237
  %240 = load i32, i32* %239, align 4
  %241 = icmp ult i64 %236, 9
  tail call void @llvm.assume(i1 %241) #3
  %242 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 4, i64 %236
  %243 = load i32, i32* %242, align 4
  %244 = icmp eq i32 %240, %243
  br i1 %244, label %for.body55.i, label %gep.next261.i

gep.next261.i:                                    ; preds = %gep.next249.i, %if.then57.i.gep.next261.i_crit_edge
  %245 = phi i32 [ %.pre79, %if.then57.i.gep.next261.i_crit_edge ], [ %240, %gep.next249.i ]
  %246 = phi i32 [ %.pre, %if.then57.i.gep.next261.i_crit_edge ], [ %243, %gep.next249.i ]
  %.lcssa73131138.i = phi i64 [ %.lcssa73.i, %if.then57.i.gep.next261.i_crit_edge ], [ %237, %gep.next249.i ]
  %.lcssa72132137.i = phi i64 [ %.lcssa72.i, %if.then57.i.gep.next261.i_crit_edge ], [ %236, %gep.next249.i ]
  %247 = icmp ult i64 %.lcssa72132137.i, 9
  tail call void @llvm.assume(i1 %247) #3
  %248 = icmp ult i64 %.lcssa73131138.i, 9
  tail call void @llvm.assume(i1 %248) #3
  %249 = icmp sgt i32 %246, %245
  %250 = insertelement <2 x i64> poison, i64 %216, i32 0
  %251 = insertelement <2 x i64> %250, i64 %207, i32 1
  br i1 %249, label %deref.next111.i, label %if.done12.i

gep.next271.i:                                    ; preds = %if.else61.i
  store i8 0, i8* %1, align 4
  %to.repack4.i = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 1
  store i8 %spec.select.i, i8* %to.repack4.i, align 1
  %to.repack8.i = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 3
  %252 = bitcast i1* %to.repack8.i to i8*
  tail call void @llvm.memset.p0i8.i64(i8* noundef nonnull align 1 dereferenceable(37) %252, i8 0, i64 37, i1 false) #3
  br label %doSub.exit

doSub.exit:                                       ; preds = %for.done38.i, %gep.next271.i
  %common.ret.op.i = phi { i64, i32 } [ %170, %for.done38.i ], [ zeroinitializer, %gep.next271.i ]
  %oldret1.i = extractvalue { i64, i32 } %common.ret.op.i, 1
  br label %common.ret

if.done:                                          ; preds = %entry
  br i1 %19, label %if.then.i.i2, label %if.done.i.i3

if.then.i.i2:                                     ; preds = %if.done
  %253 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %18
  %254 = load i64, i64* %253, align 8
  br label %digitsToWords.exit.i5

if.done.i.i3:                                     ; preds = %if.done
  %.lhs.trunc37.i = trunc i64 %18 to i16
  %255 = sdiv i16 %.lhs.trunc37.i, 9
  %.sext38.i = sext i16 %255 to i64
  br label %digitsToWords.exit.i5

digitsToWords.exit.i5:                            ; preds = %if.done.i.i3, %if.then.i.i2
  %common.ret.op.i.i4 = phi i64 [ %.sext38.i, %if.done.i.i3 ], [ %254, %if.then.i.i2 ]
  %256 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 1
  %257 = load i8, i8* %256, align 1
  %258 = sext i8 %257 to i64
  %259 = add nsw i64 %258, 8
  %260 = icmp ult i64 %259, 128
  br i1 %260, label %if.then.i16.i, label %if.done.i18.i

if.then.i16.i:                                    ; preds = %digitsToWords.exit.i5
  %261 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %259
  %262 = load i64, i64* %261, align 8
  br label %digitsToWords.exit19.i

if.done.i18.i:                                    ; preds = %digitsToWords.exit.i5
  %.lhs.trunc35.i = trunc i64 %259 to i16
  %263 = sdiv i16 %.lhs.trunc35.i, 9
  %.sext36.i = sext i16 %263 to i64
  br label %digitsToWords.exit19.i

digitsToWords.exit19.i:                           ; preds = %if.done.i18.i, %if.then.i16.i
  %common.ret.op.i17.i = phi i64 [ %.sext36.i, %if.done.i18.i ], [ %262, %if.then.i16.i ]
  %264 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 0
  %265 = load i8, i8* %264, align 1
  %266 = sext i8 %265 to i64
  %267 = add nsw i64 %266, 8
  %268 = icmp ult i64 %267, 128
  br i1 %268, label %if.then.i20.i, label %if.done.i22.i

if.then.i20.i:                                    ; preds = %digitsToWords.exit19.i
  %269 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %267
  %270 = load i64, i64* %269, align 8
  br label %digitsToWords.exit23.i

if.done.i22.i:                                    ; preds = %digitsToWords.exit19.i
  %.lhs.trunc33.i = trunc i64 %267 to i16
  %271 = sdiv i16 %.lhs.trunc33.i, 9
  %.sext34.i = sext i16 %271 to i64
  br label %digitsToWords.exit23.i

digitsToWords.exit23.i:                           ; preds = %if.done.i22.i, %if.then.i20.i
  %common.ret.op.i21.i = phi i64 [ %.sext34.i, %if.done.i22.i ], [ %270, %if.then.i20.i ]
  %272 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 1
  %273 = load i8, i8* %272, align 1
  %274 = sext i8 %273 to i64
  %275 = add nsw i64 %274, 8
  %276 = icmp ult i64 %275, 128
  br i1 %276, label %if.then.i24.i, label %if.done.i26.i

if.then.i24.i:                                    ; preds = %digitsToWords.exit23.i
  %277 = getelementptr inbounds [128 x i64], [128 x i64]* @div9, i64 0, i64 %275
  %278 = load i64, i64* %277, align 8
  br label %digitsToWords.exit27.i

if.done.i26.i:                                    ; preds = %digitsToWords.exit23.i
  %.lhs.trunc.i6 = trunc i64 %275 to i16
  %279 = sdiv i16 %.lhs.trunc.i6, 9
  %.sext.i7 = sext i16 %279 to i64
  br label %digitsToWords.exit27.i

digitsToWords.exit27.i:                           ; preds = %if.done.i26.i, %if.then.i24.i
  %common.ret.op.i25.i = phi i64 [ %.sext.i7, %if.done.i26.i ], [ %278, %if.then.i24.i ]
  %280 = icmp sgt i64 %common.ret.op.i.i4, %common.ret.op.i21.i
  %spec.select.i.i8 = select i1 %280, i64 %common.ret.op.i.i4, i64 %common.ret.op.i21.i
  %281 = icmp sgt i64 %common.ret.op.i17.i, %common.ret.op.i25.i
  %spec.select.i28.i = select i1 %281, i64 %common.ret.op.i17.i, i64 %common.ret.op.i25.i
  br i1 %280, label %gep.next46.i, label %if.else30.i

if.done.i:                                        ; preds = %gep.next134.i, %gep.next130.i, %gep.next46.i
  %282 = phi i32 [ %401, %gep.next46.i ], [ %406, %gep.next130.i ], [ %411, %gep.next134.i ]
  %283 = icmp sgt i32 %282, 999999998
  br i1 %283, label %if.then1.i, label %if.done2.i

if.then1.i:                                       ; preds = %if.done.i
  %284 = add i64 %spec.select.i.i8, 1
  %285 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 0
  store i32 0, i32* %285, align 4
  br label %if.done2.i

if.done2.i:                                       ; preds = %if.then1.i, %if.done.i
  %286 = phi i64 [ %spec.select.i.i8, %if.done.i ], [ %284, %if.then1.i ]
  %287 = add i64 %286, %spec.select.i28.i
  %288 = icmp sgt i64 %287, 9
  br i1 %288, label %if.then.i29.i9, label %if.done2.i.i11

if.then.i29.i9:                                   ; preds = %if.done2.i
  %289 = icmp sgt i64 %286, 9
  br i1 %289, label %fixWordCntError.exit.i13, label %if.done.i31.i10

if.done.i31.i10:                                  ; preds = %if.then.i29.i9
  %290 = sub i64 9, %286
  %291 = insertvalue { i64, i64, i32 } zeroinitializer, i64 %286, 0
  %292 = insertvalue { i64, i64, i32 } %291, i64 %290, 1
  %293 = insertvalue { i64, i64, i32 } %292, i32 2, 2
  br label %fixWordCntError.exit.i13

if.done2.i.i11:                                   ; preds = %if.done2.i
  %294 = insertvalue { i64, i64, i32 } zeroinitializer, i64 %286, 0
  %295 = insertvalue { i64, i64, i32 } %294, i64 %spec.select.i28.i, 1
  %296 = insertvalue { i64, i64, i32 } %295, i32 0, 2
  br label %fixWordCntError.exit.i13

fixWordCntError.exit.i13:                         ; preds = %if.done2.i.i11, %if.done.i31.i10, %if.then.i29.i9
  %common.ret.op.i30.i12 = phi { i64, i64, i32 } [ %293, %if.done.i31.i10 ], [ %296, %if.done2.i.i11 ], [ { i64 9, i64 0, i32 1 }, %if.then.i29.i9 ]
  %297 = extractvalue { i64, i64, i32 } %common.ret.op.i30.i12, 0
  %298 = extractvalue { i64, i64, i32 } %common.ret.op.i30.i12, 1
  %299 = extractvalue { i64, i64, i32 } %common.ret.op.i30.i12, 2
  %300 = icmp eq i32 %299, 1
  br i1 %300, label %if.then3.i, label %if.done4.i

if.then3.i:                                       ; preds = %fixWordCntError.exit.i13
  %301 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 3
  store i1 false, i1* %301, align 1
  store i8 81, i8* %1, align 1
  %302 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 0
  store i32 999999999, i32* %302, align 4
  %303 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 1
  store i32 999999999, i32* %303, align 4
  %304 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 2
  store i32 999999999, i32* %304, align 4
  %305 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 3
  store i32 999999999, i32* %305, align 4
  %306 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 4
  store i32 999999999, i32* %306, align 4
  %307 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 5
  store i32 999999999, i32* %307, align 4
  %308 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 6
  store i32 999999999, i32* %308, align 4
  %309 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 7
  store i32 999999999, i32* %309, align 4
  %310 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 8
  store i32 999999999, i32* %310, align 4
  %311 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 1
  store i8 0, i8* %311, align 1
  br label %common.ret

if.done4.i:                                       ; preds = %fixWordCntError.exit.i13
  %312 = add i64 %297, %298
  %313 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 3
  %314 = load i1, i1* %10, align 1
  store i1 %314, i1* %313, align 1
  %315 = trunc i64 %297 to i8
  %316 = mul i8 %315, 9
  store i8 %316, i8* %1, align 1
  %317 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 1
  %318 = load i8, i8* %256, align 1
  %319 = load i8, i8* %272, align 1
  %320 = icmp sgt i8 %318, %319
  %spec.select.i32.i = select i1 %320, i8 %318, i8 %319
  store i8 %spec.select.i32.i, i8* %317, align 1
  %.not.i14 = icmp eq i32 %299, 0
  %321 = insertelement <4 x i64> poison, i64 %common.ret.op.i25.i, i32 0
  %322 = insertelement <4 x i64> %321, i64 %common.ret.op.i21.i, i32 1
  %323 = insertelement <4 x i64> %322, i64 %common.ret.op.i17.i, i32 2
  %324 = insertelement <4 x i64> %323, i64 %common.ret.op.i.i4, i32 3
  br i1 %.not.i14, label %if.done15.i, label %deref.next78.i

if.done7.i:                                       ; preds = %store.next82.i, %deref.next78.i
  %325 = insertelement <4 x i64> poison, i64 %298, i32 0
  %326 = insertelement <4 x i64> %325, i64 %297, i32 1
  %shuffle = shufflevector <4 x i64> %326, <4 x i64> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %327 = icmp sgt <4 x i64> %324, %shuffle
  %shuffle136 = shufflevector <4 x i64> %326, <4 x i64> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %328 = select <4 x i1> %327, <4 x i64> %shuffle136, <4 x i64> %324
  br label %if.done15.i

if.done15.i:                                      ; preds = %if.done7.i, %if.done4.i
  %329 = phi <4 x i64> [ %324, %if.done4.i ], [ %328, %if.done7.i ]
  %330 = extractelement <4 x i64> %329, i32 0
  %331 = extractelement <4 x i64> %329, i32 2
  %332 = icmp sgt i64 %331, %330
  br i1 %332, label %if.then16.i, label %if.else27.i

if.then16.i:                                      ; preds = %if.done15.i
  %333 = extractelement <4 x i64> %329, i32 3
  %334 = add i64 %331, %333
  %335 = add i64 %330, %333
  %336 = extractelement <4 x i64> %329, i32 1
  %337 = add i64 %330, %336
  %338 = icmp sgt i64 %333, %336
  %339 = sub i64 %333, %336
  %spec.select142.i = select i1 %338, i64 %339, i64 0
  br label %for.loop.preheader.i16

for.loop.preheader.i16:                           ; preds = %if.else27.i, %if.then16.i
  %.ph40.i = phi %MyDecimal* [ %from1, %if.then16.i ], [ %from2, %if.else27.i ]
  %.ph41.i = phi %MyDecimal* [ %from2, %if.then16.i ], [ %from1, %if.else27.i ]
  %.ph42.i = phi i64 [ %334, %if.then16.i ], [ %393, %if.else27.i ]
  %.ph43.i = phi i64 [ %337, %if.then16.i ], [ %396, %if.else27.i ]
  %.ph44.i = phi i64 [ %335, %if.then16.i ], [ %394, %if.else27.i ]
  %.ph45.i = phi i64 [ %spec.select142.i, %if.then16.i ], [ %spec.select143.i, %if.else27.i ]
  %340 = icmp sgt i64 %.ph42.i, %.ph44.i
  br i1 %340, label %for.body.i17, label %for.loop18.preheader.i

for.loop18.preheader.i:                           ; preds = %for.body.i17, %for.loop.preheader.i16
  %.lcssa50.i = phi i64 [ %312, %for.loop.preheader.i16 ], [ %344, %for.body.i17 ]
  %.lcssa49.i = phi i64 [ %.ph42.i, %for.loop.preheader.i16 ], [ %.ph44.i, %for.body.i17 ]
  %341 = icmp sgt i64 %.lcssa49.i, %.ph45.i
  br i1 %341, label %for.body19.i, label %for.done20.i

for.body.i17:                                     ; preds = %for.loop.preheader.i16, %for.body.i17
  %342 = phi i64 [ %345, %for.body.i17 ], [ %.ph42.i, %for.loop.preheader.i16 ]
  %343 = phi i64 [ %344, %for.body.i17 ], [ %312, %for.loop.preheader.i16 ]
  %344 = add nsw i64 %343, -1
  %345 = add nsw i64 %342, -1
  %346 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %344
  %347 = getelementptr inbounds %MyDecimal, %MyDecimal* %.ph40.i, i64 0, i32 4, i64 %345
  %348 = load i32, i32* %347, align 4
  store i32 %348, i32* %346, align 4
  %349 = icmp sgt i64 %345, %.ph44.i
  br i1 %349, label %for.body.i17, label %for.loop18.preheader.i

for.body19.i:                                     ; preds = %for.loop18.preheader.i, %for.body19.i
  %350 = phi i32 [ %366, %for.body19.i ], [ 0, %for.loop18.preheader.i ]
  %351 = phi i64 [ %355, %for.body19.i ], [ %.ph43.i, %for.loop18.preheader.i ]
  %352 = phi i64 [ %354, %for.body19.i ], [ %.lcssa49.i, %for.loop18.preheader.i ]
  %353 = phi i64 [ %356, %for.body19.i ], [ %.lcssa50.i, %for.loop18.preheader.i ]
  %354 = add nsw i64 %352, -1
  %355 = add nsw i64 %351, -1
  %356 = add nsw i64 %353, -1
  %357 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %356
  %358 = getelementptr inbounds %MyDecimal, %MyDecimal* %.ph40.i, i64 0, i32 4, i64 %354
  %359 = load i32, i32* %358, align 4
  %360 = getelementptr inbounds %MyDecimal, %MyDecimal* %.ph41.i, i64 0, i32 4, i64 %355
  %361 = load i32, i32* %360, align 4
  %362 = add i32 %359, %350
  %363 = add i32 %362, %361
  %364 = icmp sgt i32 %363, 999999999
  %365 = add i32 %363, -1000000000
  %366 = zext i1 %364 to i32
  %367 = select i1 %364, i32 %365, i32 %363
  store i32 %367, i32* %357, align 4
  %368 = icmp sgt i64 %354, %.ph45.i
  br i1 %368, label %for.body19.i, label %for.done20.i

for.done20.i:                                     ; preds = %for.body19.i, %for.loop18.preheader.i
  %.lcssa48.i = phi i64 [ %.lcssa50.i, %for.loop18.preheader.i ], [ %356, %for.body19.i ]
  %.lcssa47.i = phi i32 [ 0, %for.loop18.preheader.i ], [ %366, %for.body19.i ]
  %369 = extractelement <4 x i64> %329, i32 1
  %370 = extractelement <4 x i64> %329, i32 3
  %371 = icmp sgt i64 %370, %369
  %372 = sub i64 %369, %370
  %373 = sub i64 %370, %369
  %.ph.i18 = select i1 %371, %MyDecimal* %from1, %MyDecimal* %from2
  %.ph39.i = select i1 %371, i64 %373, i64 %372
  %374 = icmp sgt i64 %.ph39.i, 0
  br i1 %374, label %for.body23.i, label %for.done24.i

for.body23.i:                                     ; preds = %for.done20.i, %for.body23.i
  %375 = phi i32 [ %386, %for.body23.i ], [ %.lcssa47.i, %for.done20.i ]
  %376 = phi i64 [ %379, %for.body23.i ], [ %.ph39.i, %for.done20.i ]
  %377 = phi i64 [ %378, %for.body23.i ], [ %.lcssa48.i, %for.done20.i ]
  %378 = add nsw i64 %377, -1
  %379 = add nsw i64 %376, -1
  %380 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %378
  %381 = getelementptr inbounds %MyDecimal, %MyDecimal* %.ph.i18, i64 0, i32 4, i64 %379
  %382 = load i32, i32* %381, align 4
  %383 = add i32 %382, %375
  %384 = icmp sgt i32 %383, 999999999
  %385 = add i32 %383, -1000000000
  %386 = zext i1 %384 to i32
  %387 = select i1 %384, i32 %385, i32 %383
  store i32 %387, i32* %380, align 4
  %388 = icmp sgt i64 %376, 1
  br i1 %388, label %for.body23.i, label %for.done24.i

for.done24.i:                                     ; preds = %for.body23.i, %for.done20.i
  %.lcssa46.i = phi i64 [ %.lcssa48.i, %for.done20.i ], [ %378, %for.body23.i ]
  %.lcssa.i19 = phi i32 [ %.lcssa47.i, %for.done20.i ], [ %386, %for.body23.i ]
  %389 = icmp sgt i32 %.lcssa.i19, 0
  br i1 %389, label %if.then25.i, label %common.ret

if.then25.i:                                      ; preds = %for.done24.i
  %390 = add nsw i64 %.lcssa46.i, -1
  %391 = getelementptr inbounds %MyDecimal, %MyDecimal* %to, i64 0, i32 4, i64 %390
  store i32 1, i32* %391, align 4
  br label %common.ret

if.else27.i:                                      ; preds = %if.done15.i
  %392 = extractelement <4 x i64> %329, i32 1
  %393 = add i64 %330, %392
  %394 = add i64 %392, %331
  %395 = extractelement <4 x i64> %329, i32 3
  %396 = add i64 %331, %395
  %397 = icmp sgt i64 %392, %395
  %398 = sub i64 %392, %395
  %spec.select143.i = select i1 %397, i64 %398, i64 0
  br label %for.loop.preheader.i16

if.else30.i:                                      ; preds = %digitsToWords.exit27.i
  %399 = icmp sgt i64 %common.ret.op.i21.i, %common.ret.op.i.i4
  br i1 %399, label %gep.next130.i, label %gep.next134.i

gep.next46.i:                                     ; preds = %digitsToWords.exit27.i
  %400 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 4, i64 0
  %401 = load i32, i32* %400, align 4
  br label %if.done.i

deref.next78.i:                                   ; preds = %if.done4.i
  %402 = trunc i64 %298 to i8
  %403 = mul i8 %402, 9
  %404 = icmp sgt i8 %spec.select.i32.i, %403
  br i1 %404, label %store.next82.i, label %if.done7.i

store.next82.i:                                   ; preds = %deref.next78.i
  store i8 %403, i8* %317, align 1
  br label %if.done7.i

gep.next130.i:                                    ; preds = %if.else30.i
  %405 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 4, i64 0
  %406 = load i32, i32* %405, align 4
  br label %if.done.i

gep.next134.i:                                    ; preds = %if.else30.i
  %407 = getelementptr inbounds %MyDecimal, %MyDecimal* %from1, i64 0, i32 4, i64 0
  %408 = load i32, i32* %407, align 4
  %409 = getelementptr inbounds %MyDecimal, %MyDecimal* %from2, i64 0, i32 4, i64 0
  %410 = load i32, i32* %409, align 4
  %411 = add i32 %410, %408
  br label %if.done.i
}

; Function Attrs: inaccessiblememonly nofree nosync nounwind willreturn
declare void @llvm.assume(i1 noundef) #1

; Function Attrs: argmemonly nofree nounwind willreturn writeonly
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i1 immarg) #2

attributes #0 = { nofree nosync nounwind }
attributes #1 = { inaccessiblememonly nofree nosync nounwind willreturn }
attributes #2 = { argmemonly nofree nounwind willreturn writeonly }
attributes #3 = { nounwind }
