; ModuleID = 'test06.ll'
source_filename = "test06.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !7 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !11, metadata !DIExpression()), !dbg !12
  call void @llvm.dbg.value(metadata i32 %1, metadata !13, metadata !DIExpression()), !dbg !12
  %3 = add nsw i32 %0, %1, !dbg !14
  ret i32 %3, !dbg !15
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !16 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !17, metadata !DIExpression()), !dbg !18
  call void @llvm.dbg.value(metadata i32 %1, metadata !19, metadata !DIExpression()), !dbg !18
  %3 = sub nsw i32 %0, %1, !dbg !20
  ret i32 %3, !dbg !21
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0, i32 %1, i32 (i32, i32)* %2) #0 !dbg !22 {
  call void @llvm.dbg.value(metadata i32 %0, metadata !26, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 %1, metadata !28, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %2, metadata !29, metadata !DIExpression()), !dbg !27
  %4 = call i32 %2(i32 %0, i32 %1), !dbg !30
  ret i32 %4, !dbg !31
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @moo(i8 signext %0, i32 %1, i32 %2) #0 !dbg !32 {
  call void @llvm.dbg.value(metadata i8 %0, metadata !36, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.value(metadata i32 %1, metadata !38, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.value(metadata i32 %2, metadata !39, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !40, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !41, metadata !DIExpression()), !dbg !37
  call void @llvm.dbg.value(metadata i32 (i32, i32)* null, metadata !42, metadata !DIExpression()), !dbg !37
  %4 = sext i8 %0 to i32, !dbg !43
  %5 = icmp eq i32 %4, 43, !dbg !45
  br i1 %5, label %6, label %7, !dbg !46

6:                                                ; preds = %3
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @plus, metadata !42, metadata !DIExpression()), !dbg !37
  br label %7, !dbg !47

7:                                                ; preds = %6, %3
  %.0 = phi i32 (i32, i32)* [ @plus, %6 ], [ null, %3 ], !dbg !37
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.0, metadata !42, metadata !DIExpression()), !dbg !37
  %8 = sext i8 %0 to i32, !dbg !49
  %9 = icmp eq i32 %8, 45, !dbg !51
  br i1 %9, label %10, label %11, !dbg !52

10:                                               ; preds = %7
  call void @llvm.dbg.value(metadata i32 (i32, i32)* @minus, metadata !42, metadata !DIExpression()), !dbg !37
  br label %11, !dbg !53

11:                                               ; preds = %10, %7
  %.1 = phi i32 (i32, i32)* [ @minus, %10 ], [ %.0, %7 ], !dbg !37
  call void @llvm.dbg.value(metadata i32 (i32, i32)* %.1, metadata !42, metadata !DIExpression()), !dbg !37
  %12 = call i32 @clever(i32 %1, i32 %2, i32 (i32, i32)* %.1), !dbg !55
  call void @llvm.dbg.value(metadata i32 %12, metadata !56, metadata !DIExpression()), !dbg !37
  ret i32 0, !dbg !58
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!3, !4, !5}
!llvm.ident = !{!6}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test06.c", directory: "/home/hikonaka/compiler_2021/hw_2/assign2/test")
!2 = !{}
!3 = !{i32 7, !"Dwarf Version", i32 4}
!4 = !{i32 2, !"Debug Info Version", i32 3}
!5 = !{i32 1, !"wchar_size", i32 4}
!6 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!7 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 1, type: !8, scopeLine: 1, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!8 = !DISubroutineType(types: !9)
!9 = !{!10, !10, !10}
!10 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!11 = !DILocalVariable(name: "a", arg: 1, scope: !7, file: !1, line: 1, type: !10)
!12 = !DILocation(line: 0, scope: !7)
!13 = !DILocalVariable(name: "b", arg: 2, scope: !7, file: !1, line: 1, type: !10)
!14 = !DILocation(line: 2, column: 12, scope: !7)
!15 = !DILocation(line: 2, column: 4, scope: !7)
!16 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 5, type: !8, scopeLine: 5, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!17 = !DILocalVariable(name: "a", arg: 1, scope: !16, file: !1, line: 5, type: !10)
!18 = !DILocation(line: 0, scope: !16)
!19 = !DILocalVariable(name: "b", arg: 2, scope: !16, file: !1, line: 5, type: !10)
!20 = !DILocation(line: 6, column: 12, scope: !16)
!21 = !DILocation(line: 6, column: 4, scope: !16)
!22 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 9, type: !23, scopeLine: 9, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!23 = !DISubroutineType(types: !24)
!24 = !{!10, !10, !10, !25}
!25 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !8, size: 64)
!26 = !DILocalVariable(name: "a", arg: 1, scope: !22, file: !1, line: 9, type: !10)
!27 = !DILocation(line: 0, scope: !22)
!28 = !DILocalVariable(name: "b", arg: 2, scope: !22, file: !1, line: 9, type: !10)
!29 = !DILocalVariable(name: "a_fptr", arg: 3, scope: !22, file: !1, line: 9, type: !25)
!30 = !DILocation(line: 10, column: 12, scope: !22)
!31 = !DILocation(line: 10, column: 5, scope: !22)
!32 = distinct !DISubprogram(name: "moo", scope: !1, file: !1, line: 14, type: !33, scopeLine: 14, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!33 = !DISubroutineType(types: !34)
!34 = !{!10, !35, !10, !10}
!35 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!36 = !DILocalVariable(name: "x", arg: 1, scope: !32, file: !1, line: 14, type: !35)
!37 = !DILocation(line: 0, scope: !32)
!38 = !DILocalVariable(name: "op1", arg: 2, scope: !32, file: !1, line: 14, type: !10)
!39 = !DILocalVariable(name: "op2", arg: 3, scope: !32, file: !1, line: 14, type: !10)
!40 = !DILocalVariable(name: "a_fptr", scope: !32, file: !1, line: 15, type: !25)
!41 = !DILocalVariable(name: "s_fptr", scope: !32, file: !1, line: 16, type: !25)
!42 = !DILocalVariable(name: "t_fptr", scope: !32, file: !1, line: 17, type: !25)
!43 = !DILocation(line: 19, column: 9, scope: !44)
!44 = distinct !DILexicalBlock(scope: !32, file: !1, line: 19, column: 9)
!45 = !DILocation(line: 19, column: 11, scope: !44)
!46 = !DILocation(line: 19, column: 9, scope: !32)
!47 = !DILocation(line: 21, column: 5, scope: !48)
!48 = distinct !DILexicalBlock(scope: !44, file: !1, line: 19, column: 19)
!49 = !DILocation(line: 22, column: 9, scope: !50)
!50 = distinct !DILexicalBlock(scope: !32, file: !1, line: 22, column: 9)
!51 = !DILocation(line: 22, column: 11, scope: !50)
!52 = !DILocation(line: 22, column: 9, scope: !32)
!53 = !DILocation(line: 24, column: 5, scope: !54)
!54 = distinct !DILexicalBlock(scope: !50, file: !1, line: 22, column: 19)
!55 = !DILocation(line: 26, column: 23, scope: !32)
!56 = !DILocalVariable(name: "result", scope: !32, file: !1, line: 26, type: !57)
!57 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!58 = !DILocation(line: 27, column: 5, scope: !32)
