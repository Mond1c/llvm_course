; ModuleID = '/Users/mike/Documents/llvm_course/SDL/app.c'
source_filename = "/Users/mike/Documents/llvm_course/SDL/app.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128-Fn32"
target triple = "arm64-apple-macosx14.0.0"

@__const.get_neigbours_count.dirs = private unnamed_addr constant [8 x [2 x i32]] [[2 x i32] [i32 1, i32 0], [2 x i32] [i32 1, i32 1], [2 x i32] [i32 0, i32 1], [2 x i32] [i32 -1, i32 1], [2 x i32] [i32 -1, i32 0], [2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 0, i32 -1], [2 x i32] [i32 1, i32 -1]], align 4

; Function Attrs: nofree norecurse nosync nounwind ssp memory(argmem: read) uwtable(sync)
define i32 @get_neigbours_count(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  br label %5

4:                                                ; preds = %26
  ret i32 %35

5:                                                ; preds = %3, %26
  %6 = phi i64 [ 0, %3 ], [ %36, %26 ]
  %7 = phi i32 [ 0, %3 ], [ %35, %26 ]
  %8 = getelementptr inbounds [8 x [2 x i32]], ptr @__const.get_neigbours_count.dirs, i64 0, i64 %6
  %9 = load i32, ptr %8, align 4, !tbaa !5
  %10 = add nsw i32 %9, %1
  %11 = icmp slt i32 %10, 0
  br i1 %11, label %12, label %14

12:                                               ; preds = %5
  %13 = add nsw i32 %10, 400
  br label %16

14:                                               ; preds = %5
  %15 = urem i32 %10, 400
  br label %16

16:                                               ; preds = %14, %12
  %17 = phi i32 [ %13, %12 ], [ %15, %14 ]
  %18 = getelementptr inbounds i8, ptr %8, i64 4
  %19 = load i32, ptr %18, align 4, !tbaa !5
  %20 = add nsw i32 %19, %2
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %24

22:                                               ; preds = %16
  %23 = add nsw i32 %20, 500
  br label %26

24:                                               ; preds = %16
  %25 = urem i32 %20, 500
  br label %26

26:                                               ; preds = %24, %22
  %27 = phi i32 [ %23, %22 ], [ %25, %24 ]
  %28 = mul nsw i32 %17, 500
  %29 = add nsw i32 %27, %28
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds i8, ptr %0, i64 %30
  %32 = load i8, ptr %31, align 1, !tbaa !9
  %33 = icmp ne i8 %32, 0
  %34 = zext i1 %33 to i32
  %35 = add nuw nsw i32 %7, %34
  %36 = add nuw nsw i64 %6, 1
  %37 = icmp eq i64 %36, 8
  br i1 %37, label %4, label %5, !llvm.loop !10
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind ssp uwtable(sync)
define void @init_zero_frame(ptr nocapture noundef writeonly %0) local_unnamed_addr #2 {
  br label %2

2:                                                ; preds = %1, %7
  %3 = phi i64 [ 0, %1 ], [ %8, %7 ]
  %4 = mul nuw nsw i64 %3, 500
  %5 = getelementptr inbounds i8, ptr %0, i64 %4
  br label %10

6:                                                ; preds = %7
  ret void

7:                                                ; preds = %17
  %8 = add nuw nsw i64 %3, 1
  %9 = icmp eq i64 %8, 400
  br i1 %9, label %6, label %2, !llvm.loop !12

10:                                               ; preds = %2, %17
  %11 = phi i64 [ 0, %2 ], [ %18, %17 ]
  %12 = tail call i32 @simRand() #5
  %13 = srem i32 %12, 5
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %10
  %16 = getelementptr inbounds i8, ptr %5, i64 %11
  store i8 1, ptr %16, align 1, !tbaa !9
  br label %17

17:                                               ; preds = %10, %15
  %18 = add nuw nsw i64 %11, 1
  %19 = icmp eq i64 %18, 500
  br i1 %19, label %7, label %10, !llvm.loop !13
}

declare i32 @simRand(...) local_unnamed_addr #3

; Function Attrs: nounwind ssp uwtable(sync)
define void @calculate_and_draw_frame(ptr nocapture noundef readonly %0, ptr nocapture noundef %1) local_unnamed_addr #2 {
  br label %3

3:                                                ; preds = %2, %12
  %4 = phi i64 [ 0, %2 ], [ %13, %12 ]
  %5 = mul nuw nsw i64 %4, 500
  %6 = trunc nuw nsw i64 %4 to i32
  %7 = getelementptr inbounds i8, ptr %1, i64 %5
  br label %9

8:                                                ; preds = %12
  ret void

9:                                                ; preds = %3, %58
  %10 = phi i64 [ 0, %3 ], [ %61, %58 ]
  %11 = trunc nuw nsw i64 %10 to i32
  br label %15

12:                                               ; preds = %58
  %13 = add nuw nsw i64 %4, 1
  %14 = icmp eq i64 %13, 400
  br i1 %14, label %8, label %3, !llvm.loop !14

15:                                               ; preds = %9, %36
  %16 = phi i64 [ %46, %36 ], [ 0, %9 ]
  %17 = phi i32 [ %45, %36 ], [ 0, %9 ]
  %18 = getelementptr inbounds [8 x [2 x i32]], ptr @__const.get_neigbours_count.dirs, i64 0, i64 %16
  %19 = load i32, ptr %18, align 4, !tbaa !5
  %20 = add nsw i32 %19, %6
  %21 = icmp slt i32 %20, 0
  br i1 %21, label %22, label %24

22:                                               ; preds = %15
  %23 = add nsw i32 %20, 400
  br label %26

24:                                               ; preds = %15
  %25 = urem i32 %20, 400
  br label %26

26:                                               ; preds = %24, %22
  %27 = phi i32 [ %23, %22 ], [ %25, %24 ]
  %28 = getelementptr inbounds i8, ptr %18, i64 4
  %29 = load i32, ptr %28, align 4, !tbaa !5
  %30 = add nsw i32 %29, %11
  %31 = icmp slt i32 %30, 0
  br i1 %31, label %32, label %34

32:                                               ; preds = %26
  %33 = add nsw i32 %30, 500
  br label %36

34:                                               ; preds = %26
  %35 = urem i32 %30, 500
  br label %36

36:                                               ; preds = %34, %32
  %37 = phi i32 [ %33, %32 ], [ %35, %34 ]
  %38 = mul nsw i32 %27, 500
  %39 = add nsw i32 %37, %38
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i8, ptr %0, i64 %40
  %42 = load i8, ptr %41, align 1, !tbaa !9
  %43 = icmp ne i8 %42, 0
  %44 = zext i1 %43 to i32
  %45 = add nuw nsw i32 %17, %44
  %46 = add nuw nsw i64 %16, 1
  %47 = icmp eq i64 %46, 8
  br i1 %47, label %48, label %15, !llvm.loop !10

48:                                               ; preds = %36
  %49 = getelementptr inbounds i8, ptr %7, i64 %10
  %50 = load i8, ptr %49, align 1, !tbaa !9
  %51 = icmp eq i8 %50, 0
  br i1 %51, label %55, label %52

52:                                               ; preds = %48
  %53 = add nsw i32 %45, -4
  %54 = icmp ult i32 %53, -2
  br i1 %54, label %57, label %58

55:                                               ; preds = %48
  %56 = icmp eq i32 %45, 3
  br i1 %56, label %58, label %57

57:                                               ; preds = %55, %52
  br label %58

58:                                               ; preds = %52, %55, %57
  %59 = phi i8 [ 0, %57 ], [ 1, %55 ], [ 1, %52 ]
  %60 = phi i32 [ 0, %57 ], [ 65280, %55 ], [ 65280, %52 ]
  store i8 %59, ptr %49, align 1, !tbaa !9
  tail call void @simPutPixel(i32 noundef %11, i32 noundef %6, i32 noundef %60) #5
  %61 = add nuw nsw i64 %10, 1
  %62 = icmp eq i64 %61, 500
  br i1 %62, label %12, label %9, !llvm.loop !15
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind ssp uwtable(sync)
define void @app() local_unnamed_addr #2 {
  %1 = alloca [200000 x i8], align 1
  %2 = alloca [200000 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 200000, ptr nonnull %1) #5
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(200000) %1, i8 0, i64 200000, i1 false)
  call void @llvm.lifetime.start.p0(i64 200000, ptr nonnull %2) #5
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(200000) %2, i8 0, i64 200000, i1 false)
  br label %3

3:                                                ; preds = %7, %0
  %4 = phi i64 [ 0, %0 ], [ %8, %7 ]
  %5 = mul nuw nsw i64 %4, 500
  %6 = getelementptr inbounds i8, ptr %1, i64 %5
  br label %10

7:                                                ; preds = %17
  %8 = add nuw nsw i64 %4, 1
  %9 = icmp eq i64 %8, 400
  br i1 %9, label %24, label %3, !llvm.loop !12

10:                                               ; preds = %17, %3
  %11 = phi i64 [ 0, %3 ], [ %18, %17 ]
  %12 = tail call i32 @simRand() #5
  %13 = srem i32 %12, 5
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %10
  %16 = getelementptr inbounds i8, ptr %6, i64 %11
  store i8 1, ptr %16, align 1, !tbaa !9
  br label %17

17:                                               ; preds = %15, %10
  %18 = add nuw nsw i64 %11, 1
  %19 = icmp eq i64 %18, 500
  br i1 %19, label %7, label %10, !llvm.loop !13

20:                                               ; preds = %116
  %21 = icmp ne i32 %190, 0
  %22 = icmp ne i32 %195, 0
  %23 = select i1 %21, i1 %22, i1 false
  br i1 %23, label %35, label %198

24:                                               ; preds = %7, %35
  %25 = phi i64 [ %36, %35 ], [ 0, %7 ]
  %26 = mul nuw nsw i64 %25, 500
  %27 = trunc nuw nsw i64 %25 to i32
  %28 = getelementptr inbounds i8, ptr %2, i64 %26
  br label %29

29:                                               ; preds = %80, %24
  %30 = phi i64 [ 0, %24 ], [ %83, %80 ]
  %31 = trunc nuw nsw i64 %30 to i32
  br label %37

32:                                               ; preds = %80
  %33 = add nuw nsw i64 %25, 1
  %34 = icmp eq i64 %33, 400
  br i1 %34, label %85, label %35

35:                                               ; preds = %32, %20
  %36 = phi i64 [ %33, %32 ], [ 0, %20 ]
  br label %24, !llvm.loop !16

37:                                               ; preds = %58, %29
  %38 = phi i64 [ %68, %58 ], [ 0, %29 ]
  %39 = phi i32 [ %67, %58 ], [ 0, %29 ]
  %40 = getelementptr inbounds [8 x [2 x i32]], ptr @__const.get_neigbours_count.dirs, i64 0, i64 %38
  %41 = load i32, ptr %40, align 4, !tbaa !5
  %42 = add nsw i32 %41, %27
  %43 = icmp slt i32 %42, 0
  br i1 %43, label %44, label %46

44:                                               ; preds = %37
  %45 = add nsw i32 %42, 400
  br label %48

46:                                               ; preds = %37
  %47 = urem i32 %42, 400
  br label %48

48:                                               ; preds = %46, %44
  %49 = phi i32 [ %45, %44 ], [ %47, %46 ]
  %50 = getelementptr inbounds i8, ptr %40, i64 4
  %51 = load i32, ptr %50, align 4, !tbaa !5
  %52 = add nsw i32 %51, %31
  %53 = icmp slt i32 %52, 0
  br i1 %53, label %54, label %56

54:                                               ; preds = %48
  %55 = add nsw i32 %52, 500
  br label %58

56:                                               ; preds = %48
  %57 = urem i32 %52, 500
  br label %58

58:                                               ; preds = %56, %54
  %59 = phi i32 [ %55, %54 ], [ %57, %56 ]
  %60 = mul nsw i32 %49, 500
  %61 = add nsw i32 %59, %60
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, ptr %1, i64 %62
  %64 = load i8, ptr %63, align 1, !tbaa !9
  %65 = icmp ne i8 %64, 0
  %66 = zext i1 %65 to i32
  %67 = add nuw nsw i32 %39, %66
  %68 = add nuw nsw i64 %38, 1
  %69 = icmp eq i64 %68, 8
  br i1 %69, label %70, label %37, !llvm.loop !10

70:                                               ; preds = %58
  %71 = getelementptr inbounds i8, ptr %28, i64 %30
  %72 = load i8, ptr %71, align 1, !tbaa !9
  %73 = icmp eq i8 %72, 0
  br i1 %73, label %77, label %74

74:                                               ; preds = %70
  %75 = add nsw i32 %67, -4
  %76 = icmp ult i32 %75, -2
  br i1 %76, label %79, label %80

77:                                               ; preds = %70
  %78 = icmp eq i32 %67, 3
  br i1 %78, label %80, label %79

79:                                               ; preds = %77, %74
  br label %80

80:                                               ; preds = %79, %77, %74
  %81 = phi i8 [ 0, %79 ], [ 1, %77 ], [ 1, %74 ]
  %82 = phi i32 [ 0, %79 ], [ 65280, %77 ], [ 65280, %74 ]
  store i8 %81, ptr %71, align 1, !tbaa !9
  tail call void @simPutPixel(i32 noundef %31, i32 noundef %27, i32 noundef %82) #5
  %83 = add nuw nsw i64 %30, 1
  %84 = icmp eq i64 %83, 500
  br i1 %84, label %32, label %29, !llvm.loop !15

85:                                               ; preds = %32
  tail call void @simFlush() #5
  br label %86

86:                                               ; preds = %85, %116
  %87 = phi i64 [ 0, %85 ], [ %196, %116 ]
  %88 = phi i32 [ 0, %85 ], [ %195, %116 ]
  %89 = phi i32 [ 0, %85 ], [ %190, %116 ]
  %90 = mul nuw nsw i64 %87, 500
  br label %91

91:                                               ; preds = %91, %86
  %92 = phi i64 [ 0, %86 ], [ %114, %91 ]
  %93 = phi <16 x i1> [ zeroinitializer, %86 ], [ %112, %91 ]
  %94 = phi <16 x i1> [ zeroinitializer, %86 ], [ %113, %91 ]
  %95 = phi <16 x i1> [ zeroinitializer, %86 ], [ %108, %91 ]
  %96 = phi <16 x i1> [ zeroinitializer, %86 ], [ %109, %91 ]
  %97 = add nuw nsw i64 %92, %90
  %98 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %97
  %99 = getelementptr inbounds i8, ptr %98, i64 16
  %100 = load <16 x i8>, ptr %98, align 1, !tbaa !9
  %101 = load <16 x i8>, ptr %99, align 1, !tbaa !9
  %102 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %97
  %103 = getelementptr inbounds i8, ptr %102, i64 16
  %104 = load <16 x i8>, ptr %102, align 1, !tbaa !9
  %105 = load <16 x i8>, ptr %103, align 1, !tbaa !9
  %106 = icmp ne <16 x i8> %100, %104
  %107 = icmp ne <16 x i8> %101, %105
  %108 = or <16 x i1> %95, %106
  %109 = or <16 x i1> %96, %107
  %110 = icmp ne <16 x i8> %104, zeroinitializer
  %111 = icmp ne <16 x i8> %105, zeroinitializer
  %112 = or <16 x i1> %93, %110
  %113 = or <16 x i1> %94, %111
  store <16 x i8> %104, ptr %98, align 1, !tbaa !9
  store <16 x i8> %105, ptr %99, align 1, !tbaa !9
  %114 = add nuw i64 %92, 32
  %115 = icmp eq i64 %114, 480
  br i1 %115, label %116, label %91, !llvm.loop !17

116:                                              ; preds = %91
  %117 = add nuw nsw i64 %90, 480
  %118 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %117
  %119 = load <8 x i8>, ptr %118, align 1, !tbaa !9
  %120 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %117
  %121 = load <8 x i8>, ptr %120, align 1, !tbaa !9
  store <8 x i8> %121, ptr %118, align 1, !tbaa !9
  %122 = add nuw nsw i64 %90, 488
  %123 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %122
  %124 = load <8 x i8>, ptr %123, align 1, !tbaa !9
  %125 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %122
  %126 = load <8 x i8>, ptr %125, align 1, !tbaa !9
  %127 = freeze <8 x i8> %126
  store <8 x i8> %127, ptr %123, align 1, !tbaa !9
  %128 = or <16 x i1> %109, %108
  %129 = freeze <16 x i1> %128
  %130 = bitcast <16 x i1> %129 to i16
  %131 = icmp ne i16 %130, 0
  %132 = icmp ne i32 %89, 1
  %133 = select i1 %131, i1 %132, i1 false
  %134 = insertelement <8 x i1> poison, i1 %133, i64 0
  %135 = shufflevector <8 x i1> %134, <8 x i1> poison, <8 x i32> zeroinitializer
  %136 = icmp ne <8 x i8> %119, %121
  %137 = or <8 x i1> %135, %136
  %138 = freeze <8 x i1> %137
  %139 = freeze <8 x i8> %124
  %140 = icmp ne <8 x i8> %139, %127
  %141 = or <8 x i1> %138, %140
  %142 = bitcast <8 x i1> %141 to i8
  %143 = icmp eq i8 %142, 0
  %144 = or <16 x i1> %113, %112
  %145 = freeze <16 x i1> %144
  %146 = bitcast <16 x i1> %145 to i16
  %147 = icmp ne i16 %146, 0
  %148 = icmp ne i32 %88, 1
  %149 = select i1 %147, i1 %148, i1 false
  %150 = insertelement <8 x i1> poison, i1 %149, i64 0
  %151 = shufflevector <8 x i1> %150, <8 x i1> poison, <8 x i32> zeroinitializer
  %152 = icmp ne <8 x i8> %121, zeroinitializer
  %153 = or <8 x i1> %151, %152
  %154 = freeze <8 x i1> %153
  %155 = icmp ne <8 x i8> %127, zeroinitializer
  %156 = or <8 x i1> %154, %155
  %157 = bitcast <8 x i1> %156 to i8
  %158 = add nuw nsw i64 %90, 496
  %159 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %158
  %160 = load i8, ptr %159, align 1, !tbaa !9
  %161 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %158
  %162 = load i8, ptr %161, align 1, !tbaa !9
  %163 = icmp eq i8 %160, %162
  %164 = and i1 %163, %143
  %165 = or i8 %162, %157
  %166 = icmp eq i8 %165, 0
  store i8 %162, ptr %159, align 1, !tbaa !9
  %167 = add nuw nsw i64 %90, 497
  %168 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %167
  %169 = load i8, ptr %168, align 1, !tbaa !9
  %170 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %167
  %171 = load i8, ptr %170, align 1, !tbaa !9
  %172 = icmp eq i8 %169, %171
  %173 = icmp eq i8 %171, 0
  store i8 %171, ptr %168, align 1, !tbaa !9
  %174 = add nuw nsw i64 %90, 498
  %175 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %174
  %176 = load i8, ptr %175, align 1, !tbaa !9
  %177 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %174
  %178 = load i8, ptr %177, align 1, !tbaa !9
  %179 = icmp eq i8 %176, %178
  %180 = icmp eq i8 %178, 0
  store i8 %178, ptr %175, align 1, !tbaa !9
  %181 = add nuw nsw i64 %90, 499
  %182 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %181
  %183 = load i8, ptr %182, align 1, !tbaa !9
  %184 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %181
  %185 = load i8, ptr %184, align 1, !tbaa !9
  %186 = icmp eq i8 %183, %185
  %187 = select i1 %186, i1 %179, i1 false
  %188 = select i1 %187, i1 %172, i1 false
  %189 = select i1 %188, i1 %164, i1 false
  %190 = select i1 %189, i32 %89, i32 1
  %191 = icmp eq i8 %185, 0
  %192 = select i1 %191, i1 %180, i1 false
  %193 = select i1 %192, i1 %173, i1 false
  %194 = select i1 %193, i1 %166, i1 false
  %195 = select i1 %194, i32 %88, i32 1
  store i8 %185, ptr %182, align 1, !tbaa !9
  %196 = add nuw nsw i64 %87, 1
  %197 = icmp eq i64 %196, 400
  br i1 %197, label %20, label %86, !llvm.loop !20

198:                                              ; preds = %20
  call void @llvm.lifetime.end.p0(i64 200000, ptr nonnull %2) #5
  call void @llvm.lifetime.end.p0(i64 200000, ptr nonnull %1) #5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

declare void @simFlush(...) local_unnamed_addr #3

attributes #0 = { nofree norecurse nosync nounwind ssp memory(argmem: read) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+altnzcv,+ccdp,+ccidx,+complxnum,+crc,+dit,+dotprod,+flagm,+fp-armv8,+fp16fml,+fptoint,+fullfp16,+jsconv,+lse,+neon,+pauth,+perfmon,+predres,+ras,+rcpc,+rdm,+sb,+sha2,+sha3,+specrestrict,+ssbs,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8a,+zcm,+zcz" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 19.1.1"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!7, !7, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
!12 = distinct !{!12, !11}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !11}
!15 = distinct !{!15, !11}
!16 = distinct !{!16, !11}
!17 = distinct !{!17, !11, !18, !19}
!18 = !{!"llvm.loop.isvectorized", i32 1}
!19 = !{!"llvm.loop.unroll.runtime.disable"}
!20 = distinct !{!20, !11}
