; ModuleID = 'app.c'
source_filename = "app.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx14.0.0"

@get_neigbours_count.dirs = internal unnamed_addr constant [8 x [2 x i32]] [[2 x i32] [i32 1, i32 0], [2 x i32] [i32 1, i32 1], [2 x i32] [i32 0, i32 1], [2 x i32] [i32 -1, i32 1], [2 x i32] [i32 -1, i32 0], [2 x i32] [i32 -1, i32 -1], [2 x i32] [i32 0, i32 -1], [2 x i32] [i32 1, i32 -1]], align 4

; Function Attrs: nofree norecurse nosync nounwind ssp memory(argmem: read) uwtable(sync)
define i32 @get_neigbours_count(ptr nocapture noundef readonly %0, i32 noundef %1, i32 noundef %2) local_unnamed_addr #0 {
  br label %5

4:                                                ; preds = %26
  ret i32 %34

5:                                                ; preds = %3, %26
  %6 = phi i64 [ 0, %3 ], [ %35, %26 ]
  %7 = phi i32 [ 0, %3 ], [ %34, %26 ]
  %8 = getelementptr inbounds [8 x [2 x i32]], ptr @get_neigbours_count.dirs, i64 0, i64 %6
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
  %18 = getelementptr inbounds [8 x [2 x i32]], ptr @get_neigbours_count.dirs, i64 0, i64 %6, i64 1
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
  %28 = sext i32 %17 to i64
  %29 = sext i32 %27 to i64
  %30 = getelementptr inbounds [500 x i8], ptr %0, i64 %28, i64 %29
  %31 = load i8, ptr %30, align 1, !tbaa !9
  %32 = icmp ne i8 %31, 0
  %33 = zext i1 %32 to i32
  %34 = add nuw nsw i32 %7, %33
  %35 = add nuw nsw i64 %6, 1
  %36 = icmp eq i64 %35, 8
  br i1 %36, label %4, label %5, !llvm.loop !10
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nounwind ssp uwtable(sync)
define void @init_zero_frame(ptr nocapture noundef writeonly %0) local_unnamed_addr #2 {
  br label %2

2:                                                ; preds = %1, %5
  %3 = phi i64 [ 0, %1 ], [ %6, %5 ]
  br label %8

4:                                                ; preds = %5
  ret void

5:                                                ; preds = %15
  %6 = add nuw nsw i64 %3, 1
  %7 = icmp eq i64 %6, 400
  br i1 %7, label %4, label %2, !llvm.loop !12

8:                                                ; preds = %2, %15
  %9 = phi i64 [ 0, %2 ], [ %16, %15 ]
  %10 = tail call i32 @simRand() #5
  %11 = srem i32 %10, 5
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %8
  %14 = getelementptr inbounds [500 x i8], ptr %0, i64 %3, i64 %9
  store i8 1, ptr %14, align 1, !tbaa !9
  br label %15

15:                                               ; preds = %8, %13
  %16 = add nuw nsw i64 %9, 1
  %17 = icmp eq i64 %16, 500
  br i1 %17, label %5, label %8, !llvm.loop !13
}

declare i32 @simRand(...) local_unnamed_addr #3

; Function Attrs: nounwind ssp uwtable(sync)
define void @calculate_and_draw_frame(ptr nocapture noundef readonly %0, ptr nocapture noundef %1) local_unnamed_addr #2 {
  br label %3

3:                                                ; preds = %2, %10
  %4 = phi i64 [ 0, %2 ], [ %11, %10 ]
  %5 = trunc i64 %4 to i32
  br label %7

6:                                                ; preds = %10
  ret void

7:                                                ; preds = %3, %55
  %8 = phi i64 [ 0, %3 ], [ %58, %55 ]
  %9 = trunc i64 %8 to i32
  br label %13

10:                                               ; preds = %55
  %11 = add nuw nsw i64 %4, 1
  %12 = icmp eq i64 %11, 400
  br i1 %12, label %6, label %3, !llvm.loop !14

13:                                               ; preds = %7, %34
  %14 = phi i64 [ %43, %34 ], [ 0, %7 ]
  %15 = phi i32 [ %42, %34 ], [ 0, %7 ]
  %16 = getelementptr inbounds [8 x [2 x i32]], ptr @get_neigbours_count.dirs, i64 0, i64 %14
  %17 = load i32, ptr %16, align 4, !tbaa !5
  %18 = add nsw i32 %17, %5
  %19 = icmp slt i32 %18, 0
  br i1 %19, label %20, label %22

20:                                               ; preds = %13
  %21 = add nsw i32 %18, 400
  br label %24

22:                                               ; preds = %13
  %23 = urem i32 %18, 400
  br label %24

24:                                               ; preds = %22, %20
  %25 = phi i32 [ %21, %20 ], [ %23, %22 ]
  %26 = getelementptr inbounds [8 x [2 x i32]], ptr @get_neigbours_count.dirs, i64 0, i64 %14, i64 1
  %27 = load i32, ptr %26, align 4, !tbaa !5
  %28 = add nsw i32 %27, %9
  %29 = icmp slt i32 %28, 0
  br i1 %29, label %30, label %32

30:                                               ; preds = %24
  %31 = add nsw i32 %28, 500
  br label %34

32:                                               ; preds = %24
  %33 = urem i32 %28, 500
  br label %34

34:                                               ; preds = %32, %30
  %35 = phi i32 [ %31, %30 ], [ %33, %32 ]
  %36 = sext i32 %25 to i64
  %37 = sext i32 %35 to i64
  %38 = getelementptr inbounds [500 x i8], ptr %0, i64 %36, i64 %37
  %39 = load i8, ptr %38, align 1, !tbaa !9
  %40 = icmp ne i8 %39, 0
  %41 = zext i1 %40 to i32
  %42 = add nuw nsw i32 %15, %41
  %43 = add nuw nsw i64 %14, 1
  %44 = icmp eq i64 %43, 8
  br i1 %44, label %45, label %13, !llvm.loop !10

45:                                               ; preds = %34
  %46 = getelementptr inbounds [500 x i8], ptr %1, i64 %4, i64 %8
  %47 = load i8, ptr %46, align 1, !tbaa !9
  %48 = icmp eq i8 %47, 0
  br i1 %48, label %52, label %49

49:                                               ; preds = %45
  %50 = add nsw i32 %42, -4
  %51 = icmp ult i32 %50, -2
  br i1 %51, label %54, label %55

52:                                               ; preds = %45
  %53 = icmp eq i32 %42, 3
  br i1 %53, label %55, label %54

54:                                               ; preds = %52, %49
  br label %55

55:                                               ; preds = %49, %52, %54
  %56 = phi i8 [ 0, %54 ], [ 1, %52 ], [ 1, %49 ]
  %57 = phi i32 [ 0, %54 ], [ 65280, %52 ], [ 65280, %49 ]
  store i8 %56, ptr %46, align 1, !tbaa !9
  tail call void @simPutPixel(i32 noundef %9, i32 noundef %5, i32 noundef %57) #5
  %58 = add nuw nsw i64 %8, 1
  %59 = icmp eq i64 %58, 500
  br i1 %59, label %10, label %7, !llvm.loop !15
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: nounwind ssp uwtable(sync)
define void @app() local_unnamed_addr #2 {
  %1 = alloca [400 x [500 x i8]], align 1
  %2 = alloca [400 x [500 x i8]], align 1
  call void @llvm.lifetime.start.p0(i64 200000, ptr nonnull %1) #5
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(200000) %1, i8 0, i64 200000, i1 false)
  call void @llvm.lifetime.start.p0(i64 200000, ptr nonnull %2) #5
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 1 dereferenceable(200000) %2, i8 0, i64 200000, i1 false)
  br label %3

3:                                                ; preds = %5, %0
  %4 = phi i64 [ 0, %0 ], [ %6, %5 ]
  br label %8

5:                                                ; preds = %15
  %6 = add nuw nsw i64 %4, 1
  %7 = icmp eq i64 %6, 400
  br i1 %7, label %23, label %3, !llvm.loop !12

8:                                                ; preds = %15, %3
  %9 = phi i64 [ 0, %3 ], [ %16, %15 ]
  %10 = tail call i32 @simRand() #5
  %11 = srem i32 %10, 5
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %8
  %14 = getelementptr inbounds [500 x i8], ptr %1, i64 %4, i64 %9
  store i8 1, ptr %14, align 1, !tbaa !9
  br label %15

15:                                               ; preds = %13, %8
  %16 = add nuw nsw i64 %9, 1
  %17 = icmp eq i64 %16, 500
  br i1 %17, label %5, label %8, !llvm.loop !13

18:                                               ; preds = %111
  %19 = icmp ne <2 x i32> %191, zeroinitializer
  %20 = extractelement <2 x i1> %19, i64 0
  %21 = extractelement <2 x i1> %19, i64 1
  %22 = select i1 %21, i1 %20, i1 false
  br i1 %22, label %32, label %194

23:                                               ; preds = %5, %32
  %24 = phi i64 [ %33, %32 ], [ 0, %5 ]
  %25 = trunc i64 %24 to i32
  br label %26

26:                                               ; preds = %76, %23
  %27 = phi i64 [ 0, %23 ], [ %79, %76 ]
  %28 = trunc i64 %27 to i32
  br label %34

29:                                               ; preds = %76
  %30 = add nuw nsw i64 %24, 1
  %31 = icmp eq i64 %30, 400
  br i1 %31, label %81, label %32

32:                                               ; preds = %29, %18
  %33 = phi i64 [ %30, %29 ], [ 0, %18 ]
  br label %23, !llvm.loop !16

34:                                               ; preds = %55, %26
  %35 = phi i64 [ %64, %55 ], [ 0, %26 ]
  %36 = phi i32 [ %63, %55 ], [ 0, %26 ]
  %37 = getelementptr inbounds [8 x [2 x i32]], ptr @get_neigbours_count.dirs, i64 0, i64 %35
  %38 = load i32, ptr %37, align 4, !tbaa !5
  %39 = add nsw i32 %38, %25
  %40 = icmp slt i32 %39, 0
  br i1 %40, label %41, label %43

41:                                               ; preds = %34
  %42 = add nsw i32 %39, 400
  br label %45

43:                                               ; preds = %34
  %44 = urem i32 %39, 400
  br label %45

45:                                               ; preds = %43, %41
  %46 = phi i32 [ %42, %41 ], [ %44, %43 ]
  %47 = getelementptr inbounds [8 x [2 x i32]], ptr @get_neigbours_count.dirs, i64 0, i64 %35, i64 1
  %48 = load i32, ptr %47, align 4, !tbaa !5
  %49 = add nsw i32 %48, %28
  %50 = icmp slt i32 %49, 0
  br i1 %50, label %51, label %53

51:                                               ; preds = %45
  %52 = add nsw i32 %49, 500
  br label %55

53:                                               ; preds = %45
  %54 = urem i32 %49, 500
  br label %55

55:                                               ; preds = %53, %51
  %56 = phi i32 [ %52, %51 ], [ %54, %53 ]
  %57 = sext i32 %46 to i64
  %58 = sext i32 %56 to i64
  %59 = getelementptr inbounds [500 x i8], ptr %1, i64 %57, i64 %58
  %60 = load i8, ptr %59, align 1, !tbaa !9
  %61 = icmp ne i8 %60, 0
  %62 = zext i1 %61 to i32
  %63 = add nuw nsw i32 %36, %62
  %64 = add nuw nsw i64 %35, 1
  %65 = icmp eq i64 %64, 8
  br i1 %65, label %66, label %34, !llvm.loop !10

66:                                               ; preds = %55
  %67 = getelementptr inbounds [500 x i8], ptr %2, i64 %24, i64 %27
  %68 = load i8, ptr %67, align 1, !tbaa !9
  %69 = icmp eq i8 %68, 0
  br i1 %69, label %73, label %70

70:                                               ; preds = %66
  %71 = add nsw i32 %63, -4
  %72 = icmp ult i32 %71, -2
  br i1 %72, label %75, label %76

73:                                               ; preds = %66
  %74 = icmp eq i32 %63, 3
  br i1 %74, label %76, label %75

75:                                               ; preds = %73, %70
  br label %76

76:                                               ; preds = %75, %73, %70
  %77 = phi i8 [ 0, %75 ], [ 1, %73 ], [ 1, %70 ]
  %78 = phi i32 [ 0, %75 ], [ 65280, %73 ], [ 65280, %70 ]
  store i8 %77, ptr %67, align 1, !tbaa !9
  tail call void @simPutPixel(i32 noundef %28, i32 noundef %25, i32 noundef %78) #5
  %79 = add nuw nsw i64 %27, 1
  %80 = icmp eq i64 %79, 500
  br i1 %80, label %29, label %26, !llvm.loop !15

81:                                               ; preds = %29
  tail call void @simFlush() #5
  br label %82

82:                                               ; preds = %81, %111
  %83 = phi i64 [ 0, %81 ], [ %192, %111 ]
  %84 = phi <2 x i32> [ zeroinitializer, %81 ], [ %191, %111 ]
  %85 = shufflevector <2 x i32> %84, <2 x i32> poison, <16 x i32> zeroinitializer
  %86 = shufflevector <2 x i32> %84, <2 x i32> poison, <16 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  br label %87

87:                                               ; preds = %87, %82
  %88 = phi i64 [ 0, %82 ], [ %109, %87 ]
  %89 = phi <16 x i32> [ %85, %82 ], [ %107, %87 ]
  %90 = phi <16 x i32> [ %85, %82 ], [ %108, %87 ]
  %91 = phi <16 x i32> [ %86, %82 ], [ %103, %87 ]
  %92 = phi <16 x i32> [ %86, %82 ], [ %104, %87 ]
  %93 = getelementptr inbounds [400 x [500 x i8]], ptr %1, i64 0, i64 %83, i64 %88
  %94 = getelementptr inbounds i8, ptr %93, i64 16
  %95 = load <16 x i8>, ptr %93, align 1, !tbaa !9
  %96 = load <16 x i8>, ptr %94, align 1, !tbaa !9
  %97 = getelementptr inbounds [400 x [500 x i8]], ptr %2, i64 0, i64 %83, i64 %88
  %98 = getelementptr inbounds i8, ptr %97, i64 16
  %99 = load <16 x i8>, ptr %97, align 1, !tbaa !9
  %100 = load <16 x i8>, ptr %98, align 1, !tbaa !9
  %101 = icmp eq <16 x i8> %95, %99
  %102 = icmp eq <16 x i8> %96, %100
  %103 = select <16 x i1> %101, <16 x i32> %91, <16 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %104 = select <16 x i1> %102, <16 x i32> %92, <16 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %105 = icmp eq <16 x i8> %99, zeroinitializer
  %106 = icmp eq <16 x i8> %100, zeroinitializer
  %107 = select <16 x i1> %105, <16 x i32> %89, <16 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %108 = select <16 x i1> %106, <16 x i32> %90, <16 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  store <16 x i8> %99, ptr %93, align 1, !tbaa !9
  store <16 x i8> %100, ptr %94, align 1, !tbaa !9
  %109 = add nuw i64 %88, 32
  %110 = icmp eq i64 %109, 480
  br i1 %110, label %111, label %87, !llvm.loop !17

111:                                              ; preds = %87
  %112 = getelementptr inbounds [400 x [500 x i8]], ptr %1, i64 0, i64 %83, i64 480
  %113 = load <8 x i8>, ptr %112, align 1, !tbaa !9
  %114 = getelementptr inbounds [400 x [500 x i8]], ptr %2, i64 0, i64 %83, i64 480
  %115 = load <8 x i8>, ptr %114, align 1, !tbaa !9
  store <8 x i8> %115, ptr %112, align 1, !tbaa !9
  %116 = getelementptr inbounds [400 x [500 x i8]], ptr %1, i64 0, i64 %83, i64 488
  %117 = load <8 x i8>, ptr %116, align 1, !tbaa !9
  %118 = getelementptr inbounds [400 x [500 x i8]], ptr %2, i64 0, i64 %83, i64 488
  %119 = load <8 x i8>, ptr %118, align 1, !tbaa !9
  store <8 x i8> %119, ptr %116, align 1, !tbaa !9
  %120 = icmp eq <8 x i8> %119, zeroinitializer
  %121 = icmp eq <8 x i8> %115, zeroinitializer
  %122 = select <8 x i1> %120, <8 x i1> %121, <8 x i1> zeroinitializer
  %123 = icmp ne <16 x i32> %107, %85
  %124 = icmp ne <16 x i32> %108, %85
  %125 = select <16 x i1> %123, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i1> %124
  %126 = bitcast <16 x i1> %125 to i16
  %127 = icmp eq i16 %126, 0
  %128 = extractelement <2 x i32> %84, i64 0
  %129 = select i1 %127, i32 %128, i32 1
  %130 = insertelement <8 x i32> poison, i32 %129, i64 0
  %131 = shufflevector <8 x i32> %130, <8 x i32> poison, <8 x i32> zeroinitializer
  %132 = select <8 x i1> %122, <8 x i32> %131, <8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %133 = shufflevector <2 x i32> %84, <2 x i32> poison, <8 x i32> zeroinitializer
  %134 = icmp ne <8 x i32> %132, %133
  %135 = bitcast <8 x i1> %134 to i8
  %136 = insertelement <2 x i8> poison, i8 %135, i64 0
  %137 = icmp eq <8 x i8> %117, %119
  %138 = icmp eq <8 x i8> %113, %115
  %139 = select <8 x i1> %137, <8 x i1> %138, <8 x i1> zeroinitializer
  %140 = icmp ne <16 x i32> %103, %86
  %141 = icmp ne <16 x i32> %104, %86
  %142 = select <16 x i1> %140, <16 x i1> <i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true, i1 true>, <16 x i1> %141
  %143 = bitcast <16 x i1> %142 to i16
  %144 = icmp eq i16 %143, 0
  %145 = extractelement <2 x i32> %84, i64 1
  %146 = select i1 %144, i32 %145, i32 1
  %147 = insertelement <8 x i32> poison, i32 %146, i64 0
  %148 = shufflevector <8 x i32> %147, <8 x i32> poison, <8 x i32> zeroinitializer
  %149 = select <8 x i1> %139, <8 x i32> %148, <8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %150 = shufflevector <2 x i32> %84, <2 x i32> poison, <8 x i32> <i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1, i32 1>
  %151 = icmp ne <8 x i32> %149, %150
  %152 = bitcast <8 x i1> %151 to i8
  %153 = insertelement <2 x i8> %136, i8 %152, i64 1
  %154 = icmp eq <2 x i8> %153, zeroinitializer
  %155 = getelementptr inbounds [400 x [500 x i8]], ptr %1, i64 0, i64 %83, i64 496
  %156 = load i8, ptr %155, align 1, !tbaa !9
  %157 = getelementptr inbounds [400 x [500 x i8]], ptr %2, i64 0, i64 %83, i64 496
  %158 = load i8, ptr %157, align 1, !tbaa !9
  %159 = insertelement <2 x i8> poison, i8 %158, i64 0
  %160 = shufflevector <2 x i8> %159, <2 x i8> poison, <2 x i32> zeroinitializer
  %161 = insertelement <2 x i8> <i8 0, i8 poison>, i8 %156, i64 1
  %162 = icmp eq <2 x i8> %160, %161
  store i8 %158, ptr %155, align 1, !tbaa !9
  %163 = getelementptr inbounds [400 x [500 x i8]], ptr %1, i64 0, i64 %83, i64 497
  %164 = load i8, ptr %163, align 1, !tbaa !9
  %165 = getelementptr inbounds [400 x [500 x i8]], ptr %2, i64 0, i64 %83, i64 497
  %166 = load i8, ptr %165, align 1, !tbaa !9
  %167 = insertelement <2 x i8> poison, i8 %166, i64 0
  %168 = shufflevector <2 x i8> %167, <2 x i8> poison, <2 x i32> zeroinitializer
  %169 = insertelement <2 x i8> <i8 0, i8 poison>, i8 %164, i64 1
  %170 = icmp eq <2 x i8> %168, %169
  store i8 %166, ptr %163, align 1, !tbaa !9
  %171 = getelementptr inbounds [400 x [500 x i8]], ptr %1, i64 0, i64 %83, i64 498
  %172 = load i8, ptr %171, align 1, !tbaa !9
  %173 = getelementptr inbounds [400 x [500 x i8]], ptr %2, i64 0, i64 %83, i64 498
  %174 = load i8, ptr %173, align 1, !tbaa !9
  %175 = insertelement <2 x i8> poison, i8 %174, i64 0
  %176 = shufflevector <2 x i8> %175, <2 x i8> poison, <2 x i32> zeroinitializer
  %177 = insertelement <2 x i8> <i8 0, i8 poison>, i8 %172, i64 1
  %178 = icmp eq <2 x i8> %176, %177
  store i8 %174, ptr %171, align 1, !tbaa !9
  %179 = getelementptr inbounds [400 x [500 x i8]], ptr %1, i64 0, i64 %83, i64 499
  %180 = load i8, ptr %179, align 1, !tbaa !9
  %181 = getelementptr inbounds [400 x [500 x i8]], ptr %2, i64 0, i64 %83, i64 499
  %182 = load i8, ptr %181, align 1, !tbaa !9
  %183 = insertelement <2 x i8> poison, i8 %182, i64 0
  %184 = shufflevector <2 x i8> %183, <2 x i8> poison, <2 x i32> zeroinitializer
  %185 = insertelement <2 x i8> <i8 0, i8 poison>, i8 %180, i64 1
  %186 = icmp eq <2 x i8> %184, %185
  %187 = select <2 x i1> %186, <2 x i1> %178, <2 x i1> zeroinitializer
  %188 = select <2 x i1> %187, <2 x i1> %170, <2 x i1> zeroinitializer
  %189 = select <2 x i1> %188, <2 x i1> %162, <2 x i1> zeroinitializer
  %190 = select <2 x i1> %189, <2 x i1> %154, <2 x i1> zeroinitializer
  %191 = select <2 x i1> %190, <2 x i32> %84, <2 x i32> <i32 1, i32 1>
  store i8 %182, ptr %179, align 1, !tbaa !9
  %192 = add nuw nsw i64 %83, 1
  %193 = icmp eq i64 %192, 400
  br i1 %193, label %18, label %82, !llvm.loop !20

194:                                              ; preds = %18
  call void @llvm.lifetime.end.p0(i64 200000, ptr nonnull %2) #5
  call void @llvm.lifetime.end.p0(i64 200000, ptr nonnull %1) #5
  ret void
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #4

declare void @simFlush(...) local_unnamed_addr #3

attributes #0 = { nofree norecurse nosync nounwind ssp memory(argmem: read) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+jsconv,+lse,+neon,+pauth,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+jsconv,+lse,+neon,+pauth,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+jsconv,+lse,+neon,+pauth,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #5 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"uwtable", i32 1}
!3 = !{i32 7, !"frame-pointer", i32 1}
!4 = !{!"Homebrew clang version 18.1.8"}
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
