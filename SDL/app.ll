; ModuleID = '/home/parallels/Documents/llvm_course/SDL/app.c'
source_filename = "/home/parallels/Documents/llvm_course/SDL/app.c"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-gnu"

@__const.get_neigbours_count.dirs = private unnamed_addr constant [8 x [2 x i32]] [[2 x i32] [i32 1, i32 0], [2 x i32] [i32 1, i32 1], [2 x i32] [i32 0, i32 1], [2 x i32] [i32 -1, i32 1], [2 x i32] [i32 -1, i32 0], [2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 0, i32 -1], [2 x i32] [i32 1, i32 -1]], align 4

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read) uwtable
define dso_local i32 @get_neigbours_count(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  br label %5

4:                                                ; preds = %26
  ret i32 %35

5:                                                ; preds = %3, %26
  %6 = phi i64 [ 0, %3 ], [ %36, %26 ]
  %7 = phi i32 [ 0, %3 ], [ %35, %26 ]
  %8 = getelementptr inbounds [8 x [2 x i32]], ptr @__const.get_neigbours_count.dirs, i64 0, i64 %6
  %9 = load i32, ptr %8, align 4, !tbaa !6
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
  %18 = getelementptr inbounds [8 x [2 x i32]], ptr @__const.get_neigbours_count.dirs, i64 0, i64 %6, i64 1
  %19 = load i32, ptr %18, align 4, !tbaa !6
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
  %32 = load i8, ptr %31, align 1, !tbaa !10
  %33 = icmp ne i8 %32, 0
  %34 = zext i1 %33 to i32
  %35 = add nuw nsw i32 %7, %34
  %36 = add nuw nsw i64 %6, 1
  %37 = icmp eq i64 %36, 8
  br i1 %37, label %4, label %5, !llvm.loop !11
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind uwtable
define dso_local void @init_zero_frame(ptr nocapture noundef writeonly %0) local_unnamed_addr #2 {
  br label %2

2:                                                ; preds = %1, %7
  %3 = phi i64 [ 0, %1 ], [ %8, %7 ]
  %4 = mul nuw nsw i64 %3, 500
  %5 = getelementptr i8, ptr %0, i64 %4
  br label %10

6:                                                ; preds = %7
  ret void

7:                                                ; preds = %17
  %8 = add nuw nsw i64 %3, 1
  %9 = icmp eq i64 %8, 400
  br i1 %9, label %6, label %2, !llvm.loop !13

10:                                               ; preds = %2, %17
  %11 = phi i64 [ 0, %2 ], [ %18, %17 ]
  %12 = tail call i32 @simRand() #5
  %13 = srem i32 %12, 5
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %10
  %16 = getelementptr i8, ptr %5, i64 %11
  store i8 1, ptr %16, align 1, !tbaa !10
  br label %17

17:                                               ; preds = %10, %15
  %18 = add nuw nsw i64 %11, 1
  %19 = icmp eq i64 %18, 500
  br i1 %19, label %7, label %10, !llvm.loop !14
}

declare i32 @simRand(...) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local void @calculate_and_draw_frame(ptr nocapture noundef readonly %0, ptr nocapture noundef %1) local_unnamed_addr #2 {
  br label %3

3:                                                ; preds = %2, %12
  %4 = phi i64 [ 0, %2 ], [ %13, %12 ]
  %5 = mul nuw nsw i64 %4, 500
  %6 = trunc i64 %4 to i32
  %7 = getelementptr i8, ptr %1, i64 %5
  br label %9

8:                                                ; preds = %12
  ret void

9:                                                ; preds = %3, %58
  %10 = phi i64 [ 0, %3 ], [ %61, %58 ]
  %11 = trunc i64 %10 to i32
  br label %15

12:                                               ; preds = %58
  %13 = add nuw nsw i64 %4, 1
  %14 = icmp eq i64 %13, 400
  br i1 %14, label %8, label %3, !llvm.loop !15

15:                                               ; preds = %9, %36
  %16 = phi i64 [ %46, %36 ], [ 0, %9 ]
  %17 = phi i32 [ %45, %36 ], [ 0, %9 ]
  %18 = getelementptr inbounds [8 x [2 x i32]], ptr @__const.get_neigbours_count.dirs, i64 0, i64 %16
  %19 = load i32, ptr %18, align 4, !tbaa !6
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
  %28 = getelementptr inbounds [8 x [2 x i32]], ptr @__const.get_neigbours_count.dirs, i64 0, i64 %16, i64 1
  %29 = load i32, ptr %28, align 4, !tbaa !6
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
  %42 = load i8, ptr %41, align 1, !tbaa !10
  %43 = icmp ne i8 %42, 0
  %44 = zext i1 %43 to i32
  %45 = add nuw nsw i32 %17, %44
  %46 = add nuw nsw i64 %16, 1
  %47 = icmp eq i64 %46, 8
  br i1 %47, label %48, label %15, !llvm.loop !11

48:                                               ; preds = %36
  %49 = getelementptr i8, ptr %7, i64 %10
  %50 = load i8, ptr %49, align 1, !tbaa !10
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
  store i8 %59, ptr %49, align 1, !tbaa !10
  tail call void @simPutPixel(i32 noundef %11, i32 noundef %6, i32 noundef %60) #5
  %61 = add nuw nsw i64 %10, 1
  %62 = icmp eq i64 %61, 500
  br i1 %62, label %12, label %9, !llvm.loop !16
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind uwtable
define dso_local void @app() local_unnamed_addr #2 {
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
  %6 = getelementptr i8, ptr %1, i64 %5
  br label %10

7:                                                ; preds = %17
  %8 = add nuw nsw i64 %4, 1
  %9 = icmp eq i64 %8, 400
  br i1 %9, label %25, label %3, !llvm.loop !13

10:                                               ; preds = %17, %3
  %11 = phi i64 [ 0, %3 ], [ %18, %17 ]
  %12 = tail call i32 @simRand() #5
  %13 = srem i32 %12, 5
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

15:                                               ; preds = %10
  %16 = getelementptr i8, ptr %6, i64 %11
  store i8 1, ptr %16, align 1, !tbaa !10
  br label %17

17:                                               ; preds = %15, %10
  %18 = add nuw nsw i64 %11, 1
  %19 = icmp eq i64 %18, 500
  br i1 %19, label %7, label %10, !llvm.loop !14

20:                                               ; preds = %118
  %21 = icmp ne <2 x i32> %204, zeroinitializer
  %22 = extractelement <2 x i1> %21, i64 0
  %23 = extractelement <2 x i1> %21, i64 1
  %24 = select i1 %23, i1 %22, i1 false
  br i1 %24, label %36, label %207

25:                                               ; preds = %7, %36
  %26 = phi i64 [ %37, %36 ], [ 0, %7 ]
  %27 = mul nuw nsw i64 %26, 500
  %28 = trunc i64 %26 to i32
  %29 = getelementptr i8, ptr %2, i64 %27
  br label %30

30:                                               ; preds = %81, %25
  %31 = phi i64 [ 0, %25 ], [ %84, %81 ]
  %32 = trunc i64 %31 to i32
  br label %38

33:                                               ; preds = %81
  %34 = add nuw nsw i64 %26, 1
  %35 = icmp eq i64 %34, 400
  br i1 %35, label %86, label %36

36:                                               ; preds = %33, %20
  %37 = phi i64 [ %34, %33 ], [ 0, %20 ]
  br label %25, !llvm.loop !17

38:                                               ; preds = %59, %30
  %39 = phi i64 [ %69, %59 ], [ 0, %30 ]
  %40 = phi i32 [ %68, %59 ], [ 0, %30 ]
  %41 = getelementptr inbounds [8 x [2 x i32]], ptr @__const.get_neigbours_count.dirs, i64 0, i64 %39
  %42 = load i32, ptr %41, align 4, !tbaa !6
  %43 = add nsw i32 %42, %28
  %44 = icmp slt i32 %43, 0
  br i1 %44, label %45, label %47

45:                                               ; preds = %38
  %46 = add nsw i32 %43, 400
  br label %49

47:                                               ; preds = %38
  %48 = urem i32 %43, 400
  br label %49

49:                                               ; preds = %47, %45
  %50 = phi i32 [ %46, %45 ], [ %48, %47 ]
  %51 = getelementptr inbounds [8 x [2 x i32]], ptr @__const.get_neigbours_count.dirs, i64 0, i64 %39, i64 1
  %52 = load i32, ptr %51, align 4, !tbaa !6
  %53 = add nsw i32 %52, %32
  %54 = icmp slt i32 %53, 0
  br i1 %54, label %55, label %57

55:                                               ; preds = %49
  %56 = add nsw i32 %53, 500
  br label %59

57:                                               ; preds = %49
  %58 = urem i32 %53, 500
  br label %59

59:                                               ; preds = %57, %55
  %60 = phi i32 [ %56, %55 ], [ %58, %57 ]
  %61 = mul nsw i32 %50, 500
  %62 = add nsw i32 %60, %61
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, ptr %1, i64 %63
  %65 = load i8, ptr %64, align 1, !tbaa !10
  %66 = icmp ne i8 %65, 0
  %67 = zext i1 %66 to i32
  %68 = add nuw nsw i32 %40, %67
  %69 = add nuw nsw i64 %39, 1
  %70 = icmp eq i64 %69, 8
  br i1 %70, label %71, label %38, !llvm.loop !11

71:                                               ; preds = %59
  %72 = getelementptr i8, ptr %29, i64 %31
  %73 = load i8, ptr %72, align 1, !tbaa !10
  %74 = icmp eq i8 %73, 0
  br i1 %74, label %78, label %75

75:                                               ; preds = %71
  %76 = add nsw i32 %68, -4
  %77 = icmp ult i32 %76, -2
  br i1 %77, label %80, label %81

78:                                               ; preds = %71
  %79 = icmp eq i32 %68, 3
  br i1 %79, label %81, label %80

80:                                               ; preds = %78, %75
  br label %81

81:                                               ; preds = %80, %78, %75
  %82 = phi i8 [ 0, %80 ], [ 1, %78 ], [ 1, %75 ]
  %83 = phi i32 [ 0, %80 ], [ 65280, %78 ], [ 65280, %75 ]
  store i8 %82, ptr %72, align 1, !tbaa !10
  tail call void @simPutPixel(i32 noundef %32, i32 noundef %28, i32 noundef %83) #5
  %84 = add nuw nsw i64 %31, 1
  %85 = icmp eq i64 %84, 500
  br i1 %85, label %33, label %30, !llvm.loop !16

86:                                               ; preds = %33
  tail call void @simFlush() #5
  br label %87

87:                                               ; preds = %86, %118
  %88 = phi i64 [ 0, %86 ], [ %205, %118 ]
  %89 = phi <2 x i32> [ zeroinitializer, %86 ], [ %204, %118 ]
  %90 = mul nuw nsw i64 %88, 500
  %91 = shufflevector <2 x i32> %89, <2 x i32> poison, <16 x i32> zeroinitializer
  %92 = shufflevector <2 x i32> %89, <2 x i32> poison, <16 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  br label %93

93:                                               ; preds = %93, %87
  %94 = phi i64 [ 0, %87 ], [ %116, %93 ]
  %95 = phi <16 x i32> [ %91, %87 ], [ %114, %93 ]
  %96 = phi <16 x i32> [ %91, %87 ], [ %115, %93 ]
  %97 = phi <16 x i32> [ %92, %87 ], [ %110, %93 ]
  %98 = phi <16 x i32> [ %92, %87 ], [ %111, %93 ]
  %99 = add nuw nsw i64 %94, %90
  %100 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %99
  %101 = getelementptr inbounds i8, ptr %100, i64 16
  %102 = load <16 x i8>, ptr %100, align 1, !tbaa !10
  %103 = load <16 x i8>, ptr %101, align 1, !tbaa !10
  %104 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %99
  %105 = getelementptr inbounds i8, ptr %104, i64 16
  %106 = load <16 x i8>, ptr %104, align 1, !tbaa !10
  %107 = load <16 x i8>, ptr %105, align 1, !tbaa !10
  %108 = icmp eq <16 x i8> %102, %106
  %109 = icmp eq <16 x i8> %103, %107
  %110 = select <16 x i1> %108, <16 x i32> %97, <16 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %111 = select <16 x i1> %109, <16 x i32> %98, <16 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %112 = icmp eq <16 x i8> %106, zeroinitializer
  %113 = icmp eq <16 x i8> %107, zeroinitializer
  %114 = select <16 x i1> %112, <16 x i32> %95, <16 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %115 = select <16 x i1> %113, <16 x i32> %96, <16 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  store <16 x i8> %106, ptr %100, align 1, !tbaa !10
  store <16 x i8> %107, ptr %101, align 1, !tbaa !10
  %116 = add nuw i64 %94, 32
  %117 = icmp eq i64 %116, 480
  br i1 %117, label %118, label %93, !llvm.loop !18

118:                                              ; preds = %93
  %119 = add nuw nsw i64 %90, 480
  %120 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %119
  %121 = load <8 x i8>, ptr %120, align 1, !tbaa !10
  %122 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %119
  %123 = load <8 x i8>, ptr %122, align 1, !tbaa !10
  store <8 x i8> %123, ptr %120, align 1, !tbaa !10
  %124 = add nuw nsw i64 %90, 488
  %125 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %124
  %126 = load <8 x i8>, ptr %125, align 1, !tbaa !10
  %127 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %124
  %128 = load <8 x i8>, ptr %127, align 1, !tbaa !10
  store <8 x i8> %128, ptr %125, align 1, !tbaa !10
  %129 = icmp eq <8 x i8> %128, zeroinitializer
  %130 = icmp eq <8 x i8> %123, zeroinitializer
  %131 = select <8 x i1> %129, <8 x i1> %130, <8 x i1> zeroinitializer
  %132 = icmp ne <16 x i32> %114, %91
  %133 = icmp ne <16 x i32> %115, %91
  %134 = select <16 x i1> %132, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i1> %133
  %135 = bitcast <16 x i1> %134 to i16
  %136 = icmp eq i16 %135, 0
  %137 = extractelement <2 x i32> %89, i64 0
  %138 = select i1 %136, i32 %137, i32 1
  %139 = insertelement <8 x i32> poison, i32 %138, i64 0
  %140 = shufflevector <8 x i32> %139, <8 x i32> poison, <8 x i32> zeroinitializer
  %141 = select <8 x i1> %131, <8 x i32> %140, <8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %142 = shufflevector <2 x i32> %89, <2 x i32> poison, <8 x i32> zeroinitializer
  %143 = icmp ne <8 x i32> %141, %142
  %144 = bitcast <8 x i1> %143 to i8
  %145 = insertelement <2 x i8> poison, i8 %144, i64 0
  %146 = icmp eq <8 x i8> %126, %128
  %147 = icmp eq <8 x i8> %121, %123
  %148 = select <8 x i1> %146, <8 x i1> %147, <8 x i1> zeroinitializer
  %149 = icmp ne <16 x i32> %110, %92
  %150 = icmp ne <16 x i32> %111, %92
  %151 = select <16 x i1> %149, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i1> %150
  %152 = bitcast <16 x i1> %151 to i16
  %153 = icmp eq i16 %152, 0
  %154 = extractelement <2 x i32> %89, i64 1
  %155 = select i1 %153, i32 %154, i32 1
  %156 = insertelement <8 x i32> poison, i32 %155, i64 0
  %157 = shufflevector <8 x i32> %156, <8 x i32> poison, <8 x i32> zeroinitializer
  %158 = select <8 x i1> %148, <8 x i32> %157, <8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %159 = shufflevector <2 x i32> %89, <2 x i32> poison, <8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %160 = icmp ne <8 x i32> %158, %159
  %161 = bitcast <8 x i1> %160 to i8
  %162 = insertelement <2 x i8> %145, i8 %161, i64 1
  %163 = icmp eq <2 x i8> %162, zeroinitializer
  %164 = add nuw nsw i64 %90, 496
  %165 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %164
  %166 = load i8, ptr %165, align 1, !tbaa !10
  %167 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %164
  %168 = load i8, ptr %167, align 1, !tbaa !10
  %169 = insertelement <2 x i8> poison, i8 %168, i64 0
  %170 = shufflevector <2 x i8> %169, <2 x i8> poison, <2 x i32> zeroinitializer
  %171 = insertelement <2 x i8> <i8 0, i8 poison>, i8 %166, i64 1
  %172 = icmp eq <2 x i8> %170, %171
  store i8 %168, ptr %165, align 1, !tbaa !10
  %173 = add nuw nsw i64 %90, 497
  %174 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %173
  %175 = load i8, ptr %174, align 1, !tbaa !10
  %176 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %173
  %177 = load i8, ptr %176, align 1, !tbaa !10
  %178 = insertelement <2 x i8> poison, i8 %177, i64 0
  %179 = shufflevector <2 x i8> %178, <2 x i8> poison, <2 x i32> zeroinitializer
  %180 = insertelement <2 x i8> <i8 0, i8 poison>, i8 %175, i64 1
  %181 = icmp eq <2 x i8> %179, %180
  store i8 %177, ptr %174, align 1, !tbaa !10
  %182 = add nuw nsw i64 %90, 498
  %183 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %182
  %184 = load i8, ptr %183, align 1, !tbaa !10
  %185 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %182
  %186 = load i8, ptr %185, align 1, !tbaa !10
  %187 = insertelement <2 x i8> poison, i8 %186, i64 0
  %188 = shufflevector <2 x i8> %187, <2 x i8> poison, <2 x i32> zeroinitializer
  %189 = insertelement <2 x i8> <i8 0, i8 poison>, i8 %184, i64 1
  %190 = icmp eq <2 x i8> %188, %189
  store i8 %186, ptr %183, align 1, !tbaa !10
  %191 = add nuw nsw i64 %90, 499
  %192 = getelementptr inbounds [200000 x i8], ptr %1, i64 0, i64 %191
  %193 = load i8, ptr %192, align 1, !tbaa !10
  %194 = getelementptr inbounds [200000 x i8], ptr %2, i64 0, i64 %191
  %195 = load i8, ptr %194, align 1, !tbaa !10
  %196 = insertelement <2 x i8> poison, i8 %195, i64 0
  %197 = shufflevector <2 x i8> %196, <2 x i8> poison, <2 x i32> zeroinitializer
  %198 = insertelement <2 x i8> <i8 0, i8 poison>, i8 %193, i64 1
  %199 = icmp eq <2 x i8> %197, %198
  %200 = select <2 x i1> %199, <2 x i1> %190, <2 x i1> zeroinitializer
  %201 = select <2 x i1> %200, <2 x i1> %181, <2 x i1> zeroinitializer
  %202 = select <2 x i1> %201, <2 x i1> %172, <2 x i1> zeroinitializer
  %203 = select <2 x i1> %202, <2 x i1> %163, <2 x i1> zeroinitializer
  %204 = select <2 x i1> %203, <2 x i32> %89, <2 x i32> <i32 1, i32 1>
  store i8 %195, ptr %192, align 1, !tbaa !10
  %205 = add nuw nsw i64 %88, 1
  %206 = icmp eq i64 %205, 400
  br i1 %206, label %20, label %87, !llvm.loop !21

207:                                              ; preds = %20
  call void @llvm.lifetime.end.p0(i64 200000, ptr nonnull %2) #5
  call void @llvm.lifetime.end.p0(i64 200000, ptr nonnull %1) #5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

declare void @simFlush(...) local_unnamed_addr #3

attributes #0 = { nofree norecurse nosync nounwind memory(argmem: read) uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind uwtable "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fp-armv8,+neon,+outline-atomics,+v8a,-fmv" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 1}
!5 = !{!"Ubuntu clang version 18.1.3 (1ubuntu1)"}
!6 = !{!7, !7, i64 0}
!7 = !{!"int", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C/C++ TBAA"}
!10 = !{!8, !8, i64 0}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12, !19, !20}
!19 = !{!"llvm.loop.isvectorized", i32 1}
!20 = !{!"llvm.loop.unroll.runtime.disable"}
!21 = distinct !{!21, !12}
