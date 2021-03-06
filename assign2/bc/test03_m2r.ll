; ModuleID = 'test03.ll'
source_filename = "test03.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !9 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !13, metadata !DIExpression()), !dbg !14
  call void @llvm.dbg.value(metadata i32 %1, metadata !15, metadata !DIExpression()), !dbg !14
  %3 = add nsw i32 %0, %1, !dbg !16
  ret i32 %3, !dbg !17
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !18 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !19, metadata !DIExpression()), !dbg !20
  call void @llvm.dbg.value(metadata i32 %1, metadata !21, metadata !DIExpression()), !dbg !20
  %3 = sub nsw i32 %0, %1, !dbg !22
  ret i32 %3, !dbg !23
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0) #0 !dbg !24 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !27, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !29, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !31, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !32, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 1, metadata !33, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32 2, metadata !34, metadata !DIExpression()), !dbg !28
  %2 = icmp eq i32 %0, 3, !dbg !35
  br i1 %2, label %3, label %4, !dbg !37

3:                                                ; preds = %1
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !32, metadata !DIExpression()), !dbg !28
  br label %4, !dbg !38

4:                                                ; preds = %3, %1
  %.0 = phi i32 (i32, i32)* [ @plus, %3 ], [ null, %1 ], !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.0, metadata !32, metadata !DIExpression()), !dbg !28
  %5 = icmp eq i32 %0, 4, !dbg !40
  br i1 %5, label %6, label %7, !dbg !42

6:                                                ; preds = %4
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !32, metadata !DIExpression()), !dbg !28
  br label %7, !dbg !43

7:                                                ; preds = %6, %4
  %.1 = phi i32 (i32, i32)* [ @minus, %6 ], [ %.0, %4 ], !dbg !28
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.1, metadata !32, metadata !DIExpression()), !dbg !28
  %8 = icmp ne i32 (i32, i32)* %.1, null, !dbg !45
  br i1 %8, label %9, label %11, !dbg !47

9:                                                ; preds = %7
  %10 = call i32 %.1(i32 1, i32 2), !dbg !48
  call void @llvm.dbg.value(metadata i32 %10, metadata !50, metadata !DIExpression()), !dbg !52
  br label %11, !dbg !53

11:                                               ; preds = %9, %7
  ret i32 0, !dbg !54
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test03.c", directory: "/home/hikonaka/compiler_2021/hw_2/assign2/test")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!9 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 3, type: !10, scopeLine: 3, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 3, type: !12)
!14 = !DILocation(line: 0, scope: !9)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 3, type: !12)
!16 = !DILocation(line: 4, column: 12, scope: !9)
!17 = !DILocation(line: 4, column: 4, scope: !9)
!18 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 7, type: !10, scopeLine: 7, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!19 = !DILocalVariable(name: "a", arg: 1, scope: !18, file: !1, line: 7, type: !12)
!20 = !DILocation(line: 0, scope: !18)
!21 = !DILocalVariable(name: "b", arg: 2, scope: !18, file: !1, line: 7, type: !12)
!22 = !DILocation(line: 8, column: 12, scope: !18)
!23 = !DILocation(line: 8, column: 4, scope: !18)
!24 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 11, type: !25, scopeLine: 11, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!25 = !DISubroutineType(types: !26)
!26 = !{!12, !12}
!27 = !DILocalVariable(name: "x", arg: 1, scope: !24, file: !1, line: 11, type: !12)
!28 = !DILocation(line: 0, scope: !24)
!29 = !DILocalVariable(name: "a_fptr", scope: !24, file: !1, line: 12, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!31 = !DILocalVariable(name: "s_fptr", scope: !24, file: !1, line: 13, type: !30)
!32 = !DILocalVariable(name: "t_fptr", scope: !24, file: !1, line: 14, type: !30)
!33 = !DILocalVariable(name: "op1", scope: !24, file: !1, line: 16, type: !12)
!34 = !DILocalVariable(name: "op2", scope: !24, file: !1, line: 16, type: !12)
!35 = !DILocation(line: 18, column: 11, scope: !36)
!36 = distinct !DILexicalBlock(scope: !24, file: !1, line: 18, column: 9)
!37 = !DILocation(line: 18, column: 9, scope: !24)
!38 = !DILocation(line: 20, column: 5, scope: !39)
!39 = distinct !DILexicalBlock(scope: !36, file: !1, line: 18, column: 17)
!40 = !DILocation(line: 21, column: 11, scope: !41)
!41 = distinct !DILexicalBlock(scope: !24, file: !1, line: 21, column: 9)
!42 = !DILocation(line: 21, column: 9, scope: !24)
!43 = !DILocation(line: 23, column: 5, scope: !44)
!44 = distinct !DILexicalBlock(scope: !41, file: !1, line: 21, column: 17)
!45 = !DILocation(line: 26, column: 16, scope: !46)
!46 = distinct !DILexicalBlock(scope: !24, file: !1, line: 26, column: 9)
!47 = !DILocation(line: 26, column: 9, scope: !24)
!48 = !DILocation(line: 27, column: 26, scope: !49)
!49 = distinct !DILexicalBlock(scope: !46, file: !1, line: 26, column: 25)
!50 = !DILocalVariable(name: "result", scope: !49, file: !1, line: 27, type: !51)
!51 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!52 = !DILocation(line: 0, scope: !49)
!53 = !DILocation(line: 28, column: 5, scope: !49)
!54 = !DILocation(line: 29, column: 4, scope: !24)
