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
  %30 = getelementptr inbounds [500 x i32], ptr %0, i64 %28, i64 %29
  %31 = load i32, ptr %30, align 4, !tbaa !5
  %32 = icmp ne i32 %31, 0
  %33 = zext i1 %32 to i32
  %34 = add nuw nsw i32 %7, %33
  %35 = add nuw nsw i64 %6, 1
  %36 = icmp eq i64 %35, 8
  br i1 %36, label %4, label %5, !llvm.loop !9
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

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
  br i1 %7, label %4, label %2, !llvm.loop !11

8:                                                ; preds = %2, %15
  %9 = phi i64 [ 0, %2 ], [ %16, %15 ]
  %10 = tail call i32 @simRand() #7
  %11 = srem i32 %10, 5
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %8
  %14 = getelementptr inbounds [500 x i32], ptr %0, i64 %3, i64 %9
  store i32 1, ptr %14, align 4, !tbaa !5
  br label %15

15:                                               ; preds = %8, %13
  %16 = add nuw nsw i64 %9, 1
  %17 = icmp eq i64 %16, 500
  br i1 %17, label %5, label %8, !llvm.loop !12
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
  br i1 %12, label %6, label %3, !llvm.loop !13

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
  %38 = getelementptr inbounds [500 x i32], ptr %0, i64 %36, i64 %37
  %39 = load i32, ptr %38, align 4, !tbaa !5
  %40 = icmp ne i32 %39, 0
  %41 = zext i1 %40 to i32
  %42 = add nuw nsw i32 %15, %41
  %43 = add nuw nsw i64 %14, 1
  %44 = icmp eq i64 %43, 8
  br i1 %44, label %45, label %13, !llvm.loop !9

45:                                               ; preds = %34
  %46 = getelementptr inbounds [500 x i32], ptr %1, i64 %4, i64 %8
  %47 = load i32, ptr %46, align 4, !tbaa !5
  %48 = icmp eq i32 %47, 0
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
  %56 = phi i32 [ 0, %54 ], [ 1, %52 ], [ 1, %49 ]
  %57 = phi i32 [ 0, %54 ], [ 65280, %52 ], [ 65280, %49 ]
  store i32 %56, ptr %46, align 4, !tbaa !5
  tail call void @simPutPixel(i32 noundef %9, i32 noundef %5, i32 noundef %57) #7
  %58 = add nuw nsw i64 %8, 1
  %59 = icmp eq i64 %58, 500
  br i1 %59, label %10, label %7, !llvm.loop !14
}

declare void @simPutPixel(i32 noundef, i32 noundef, i32 noundef) local_unnamed_addr #3

; Function Attrs: noreturn nounwind ssp uwtable(sync)
define void @app() local_unnamed_addr #4 {
  %1 = alloca [400 x [500 x i32]], align 4
  %2 = alloca [400 x [500 x i32]], align 4
  call void @llvm.lifetime.start.p0(i64 800000, ptr nonnull %1) #7
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(800000) %1, i8 0, i64 800000, i1 false)
  call void @llvm.lifetime.start.p0(i64 800000, ptr nonnull %2) #7
  call void @llvm.memset.p0.i64(ptr noundef nonnull align 4 dereferenceable(800000) %2, i8 0, i64 800000, i1 false)
  br label %3

3:                                                ; preds = %5, %0
  %4 = phi i64 [ 0, %0 ], [ %6, %5 ]
  br label %8

5:                                                ; preds = %15
  %6 = add nuw nsw i64 %4, 1
  %7 = icmp eq i64 %6, 400
  br i1 %7, label %18, label %3, !llvm.loop !11

8:                                                ; preds = %15, %3
  %9 = phi i64 [ 0, %3 ], [ %16, %15 ]
  %10 = tail call i32 @simRand() #7
  %11 = srem i32 %10, 5
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

13:                                               ; preds = %8
  %14 = getelementptr inbounds [500 x i32], ptr %1, i64 %4, i64 %9
  store i32 1, ptr %14, align 4, !tbaa !5
  br label %15

15:                                               ; preds = %13, %8
  %16 = add nuw nsw i64 %9, 1
  %17 = icmp eq i64 %16, 500
  br i1 %17, label %5, label %8, !llvm.loop !12

18:                                               ; preds = %5, %27
  %19 = phi i64 [ %28, %27 ], [ 0, %5 ]
  %20 = trunc i64 %19 to i32
  br label %21

21:                                               ; preds = %71, %18
  %22 = phi i64 [ 0, %18 ], [ %74, %71 ]
  %23 = trunc i64 %22 to i32
  br label %29

24:                                               ; preds = %71
  %25 = add nuw nsw i64 %19, 1
  %26 = icmp eq i64 %25, 400
  br i1 %26, label %76, label %27

27:                                               ; preds = %24, %76
  %28 = phi i64 [ %25, %24 ], [ 0, %76 ]
  br label %18, !llvm.loop !15

29:                                               ; preds = %50, %21
  %30 = phi i64 [ %59, %50 ], [ 0, %21 ]
  %31 = phi i32 [ %58, %50 ], [ 0, %21 ]
  %32 = getelementptr inbounds [8 x [2 x i32]], ptr @get_neigbours_count.dirs, i64 0, i64 %30
  %33 = load i32, ptr %32, align 4, !tbaa !5
  %34 = add nsw i32 %33, %20
  %35 = icmp slt i32 %34, 0
  br i1 %35, label %36, label %38

36:                                               ; preds = %29
  %37 = add nsw i32 %34, 400
  br label %40

38:                                               ; preds = %29
  %39 = urem i32 %34, 400
  br label %40

40:                                               ; preds = %38, %36
  %41 = phi i32 [ %37, %36 ], [ %39, %38 ]
  %42 = getelementptr inbounds [8 x [2 x i32]], ptr @get_neigbours_count.dirs, i64 0, i64 %30, i64 1
  %43 = load i32, ptr %42, align 4, !tbaa !5
  %44 = add nsw i32 %43, %23
  %45 = icmp slt i32 %44, 0
  br i1 %45, label %46, label %48

46:                                               ; preds = %40
  %47 = add nsw i32 %44, 500
  br label %50

48:                                               ; preds = %40
  %49 = urem i32 %44, 500
  br label %50

50:                                               ; preds = %48, %46
  %51 = phi i32 [ %47, %46 ], [ %49, %48 ]
  %52 = sext i32 %41 to i64
  %53 = sext i32 %51 to i64
  %54 = getelementptr inbounds [500 x i32], ptr %1, i64 %52, i64 %53
  %55 = load i32, ptr %54, align 4, !tbaa !5
  %56 = icmp ne i32 %55, 0
  %57 = zext i1 %56 to i32
  %58 = add nuw nsw i32 %31, %57
  %59 = add nuw nsw i64 %30, 1
  %60 = icmp eq i64 %59, 8
  br i1 %60, label %61, label %29, !llvm.loop !9

61:                                               ; preds = %50
  %62 = getelementptr inbounds [500 x i32], ptr %2, i64 %19, i64 %22
  %63 = load i32, ptr %62, align 4, !tbaa !5
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %68, label %65

65:                                               ; preds = %61
  %66 = add nsw i32 %58, -4
  %67 = icmp ult i32 %66, -2
  br i1 %67, label %70, label %71

68:                                               ; preds = %61
  %69 = icmp eq i32 %58, 3
  br i1 %69, label %71, label %70

70:                                               ; preds = %68, %65
  br label %71

71:                                               ; preds = %70, %68, %65
  %72 = phi i32 [ 0, %70 ], [ 1, %68 ], [ 1, %65 ]
  %73 = phi i32 [ 0, %70 ], [ 65280, %68 ], [ 65280, %65 ]
  store i32 %72, ptr %62, align 4, !tbaa !5
  tail call void @simPutPixel(i32 noundef %23, i32 noundef %20, i32 noundef %73) #7
  %74 = add nuw nsw i64 %22, 1
  %75 = icmp eq i64 %74, 500
  br i1 %75, label %24, label %21, !llvm.loop !14

76:                                               ; preds = %24
  tail call void @simFlush() #7
  call void @llvm.memcpy.p0.p0.i64(ptr noundef nonnull align 4 dereferenceable(800000) %1, ptr noundef nonnull align 4 dereferenceable(800000) %2, i64 800000, i1 false), !tbaa !5
  br label %27
}

; Function Attrs: mustprogress nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #5

declare void @simFlush(...) local_unnamed_addr #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #6

attributes #0 = { nofree norecurse nosync nounwind ssp memory(argmem: read) uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+jsconv,+lse,+neon,+pauth,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+jsconv,+lse,+neon,+pauth,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+jsconv,+lse,+neon,+pauth,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { noreturn nounwind ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+complxnum,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+jsconv,+lse,+neon,+pauth,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #5 = { mustprogress nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #6 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #7 = { nounwind }

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
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.mustprogress"}
!11 = distinct !{!11, !10}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = distinct !{!14, !10}
!15 = distinct !{!15, !10}
