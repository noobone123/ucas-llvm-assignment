; ModuleID = 'test01.bc'
source_filename = "test01.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @plus(i32 %0, i32 %1) #0 !dbg !9 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !13, metadata !DIExpression()), !dbg !14
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !15, metadata !DIExpression()), !dbg !16
  %5 = load i32, i32* %3, align 4, !dbg !17
  %6 = load i32, i32* %4, align 4, !dbg !18
  %7 = add nsw i32 %5, %6, !dbg !19
  ret i32 %7, !dbg !20
}

; Function Attrs: nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @minus(i32 %0, i32 %1) #0 !dbg !21 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  call void @llvm.dbg.declare(metadata i32* %3, metadata !22, metadata !DIExpression()), !dbg !23
  store i32 %1, i32* %4, align 4
  call void @llvm.dbg.declare(metadata i32* %4, metadata !24, metadata !DIExpression()), !dbg !25
  %5 = load i32, i32* %3, align 4, !dbg !26
  %6 = load i32, i32* %4, align 4, !dbg !27
  %7 = sub nsw i32 %5, %6, !dbg !28
  ret i32 %7, !dbg !29
}

; Function Attrs: noinline nounwind uwtable
define dso_local i32 @clever(i32 %0) #0 !dbg !30 {
  %2 = alloca i32, align 4
  %3 = alloca i32 (i32, i32)*, align 8
  %4 = alloca i32 (i32, i32)*, align 8
  %5 = alloca i32 (i32, i32)*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  call void @llvm.dbg.declare(metadata i32* %2, metadata !33, metadata !DIExpression()), !dbg !34
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %3, metadata !35, metadata !DIExpression()), !dbg !37
  store i32 (i32, i32)* @plus, i32 (i32, i32)** %3, align 8, !dbg !37
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %4, metadata !38, metadata !DIExpression()), !dbg !39
  store i32 (i32, i32)* @minus, i32 (i32, i32)** %4, align 8, !dbg !39
  call void @llvm.dbg.declare(metadata i32 (i32, i32)** %5, metadata !40, metadata !DIExpression()), !dbg !41
  store i32 (i32, i32)* null, i32 (i32, i32)** %5, align 8, !dbg !41
  call void @llvm.dbg.declare(metadata i32* %6, metadata !42, metadata !DIExpression()), !dbg !43
  store i32 1, i32* %6, align 4, !dbg !43
  call void @llvm.dbg.declare(metadata i32* %7, metadata !44, metadata !DIExpression()), !dbg !45
  store i32 2, i32* %7, align 4, !dbg !45
  %9 = load i32, i32* %2, align 4, !dbg !46
  %10 = icmp eq i32 %9, 3, !dbg !48
  br i1 %10, label %11, label %13, !dbg !49

11:                                               ; preds = %1
  %12 = load i32 (i32, i32)*, i32 (i32, i32)** %3, align 8, !dbg !50
  store i32 (i32, i32)* %12, i32 (i32, i32)** %5, align 8, !dbg !52
  br label %13, !dbg !53

13:                                               ; preds = %11, %1
  %14 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !54
  %15 = icmp ne i32 (i32, i32)* %14, null, !dbg !56
  br i1 %15, label %16, label %21, !dbg !57

16:                                               ; preds = %13
  call void @llvm.dbg.declare(metadata i32* %8, metadata !58, metadata !DIExpression()), !dbg !61
  %17 = load i32 (i32, i32)*, i32 (i32, i32)** %5, align 8, !dbg !62
  %18 = load i32, i32* %6, align 4, !dbg !63
  %19 = load i32, i32* %7, align 4, !dbg !64
  %20 = call i32 %17(i32 %18, i32 %19), !dbg !62
  store i32 %20, i32* %8, align 4, !dbg !61
  br label %21, !dbg !65

21:                                               ; preds = %16, %13
  ret i32 0, !dbg !66
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "frame-pointer"="all" "less-precise-fpmad"="false" "min-legal-vector-width"="0" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, enums: !2, retainedTypes: !3, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "test01.c", directory: "/home/hikonaka/compiler_2021/hw_2/assign2/test")
!2 = !{}
!3 = !{!4}
!4 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!5 = !{i32 7, !"Dwarf Version", i32 4}
!6 = !{i32 2, !"Debug Info Version", i32 3}
!7 = !{i32 1, !"wchar_size", i32 4}
!8 = !{!"clang version 11.0.0 (https://github.com/llvm/llvm-project.git 0160ad802e899c2922bc9b29564080c22eb0908c)"}
!9 = distinct !DISubprogram(name: "plus", scope: !1, file: !1, line: 2, type: !10, scopeLine: 2, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !12, !12}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DILocalVariable(name: "a", arg: 1, scope: !9, file: !1, line: 2, type: !12)
!14 = !DILocation(line: 2, column: 14, scope: !9)
!15 = !DILocalVariable(name: "b", arg: 2, scope: !9, file: !1, line: 2, type: !12)
!16 = !DILocation(line: 2, column: 21, scope: !9)
!17 = !DILocation(line: 3, column: 11, scope: !9)
!18 = !DILocation(line: 3, column: 13, scope: !9)
!19 = !DILocation(line: 3, column: 12, scope: !9)
!20 = !DILocation(line: 3, column: 4, scope: !9)
!21 = distinct !DISubprogram(name: "minus", scope: !1, file: !1, line: 6, type: !10, scopeLine: 6, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!22 = !DILocalVariable(name: "a", arg: 1, scope: !21, file: !1, line: 6, type: !12)
!23 = !DILocation(line: 6, column: 15, scope: !21)
!24 = !DILocalVariable(name: "b", arg: 2, scope: !21, file: !1, line: 6, type: !12)
!25 = !DILocation(line: 6, column: 22, scope: !21)
!26 = !DILocation(line: 7, column: 11, scope: !21)
!27 = !DILocation(line: 7, column: 13, scope: !21)
!28 = !DILocation(line: 7, column: 12, scope: !21)
!29 = !DILocation(line: 7, column: 4, scope: !21)
!30 = distinct !DISubprogram(name: "clever", scope: !1, file: !1, line: 10, type: !31, scopeLine: 10, flags: DIFlagPrototyped, spFlags: DISPFlagDefinition, unit: !0, retainedNodes: !2)
!31 = !DISubroutineType(types: !32)
!32 = !{!12, !12}
!33 = !DILocalVariable(name: "x", arg: 1, scope: !30, file: !1, line: 10, type: !12)
!34 = !DILocation(line: 10, column: 16, scope: !30)
!35 = !DILocalVariable(name: "a_fptr", scope: !30, file: !1, line: 11, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !10, size: 64)
!37 = !DILocation(line: 11, column: 11, scope: !30)
!38 = !DILocalVariable(name: "s_fptr", scope: !30, file: !1, line: 12, type: !36)
!39 = !DILocation(line: 12, column: 11, scope: !30)
!40 = !DILocalVariable(name: "t_fptr", scope: !30, file: !1, line: 13, type: !36)
!41 = !DILocation(line: 13, column: 11, scope: !30)
!42 = !DILocalVariable(name: "op1", scope: !30, file: !1, line: 15, type: !12)
!43 = !DILocation(line: 15, column: 9, scope: !30)
!44 = !DILocalVariable(name: "op2", scope: !30, file: !1, line: 15, type: !12)
!45 = !DILocation(line: 15, column: 16, scope: !30)
!46 = !DILocation(line: 17, column: 9, scope: !47)
!47 = distinct !DILexicalBlock(scope: !30, file: !1, line: 17, column: 9)
!48 = !DILocation(line: 17, column: 11, scope: !47)
!49 = !DILocation(line: 17, column: 9, scope: !30)
!50 = !DILocation(line: 18, column: 17, scope: !51)
!51 = distinct !DILexicalBlock(scope: !47, file: !1, line: 17, column: 17)
!52 = !DILocation(line: 18, column: 15, scope: !51)
!53 = !DILocation(line: 19, column: 5, scope: !51)
!54 = !DILocation(line: 21, column: 9, scope: !55)
!55 = distinct !DILexicalBlock(scope: !30, file: !1, line: 21, column: 9)
!56 = !DILocation(line: 21, column: 16, scope: !55)
!57 = !DILocation(line: 21, column: 9, scope: !30)
!58 = !DILocalVariable(name: "result", scope: !59, file: !1, line: 22, type: !60)
!59 = distinct !DILexicalBlock(scope: !55, file: !1, line: 21, column: 25)
!60 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!61 = !DILocation(line: 22, column: 17, scope: !59)
!62 = !DILocation(line: 22, column: 26, scope: !59)
!63 = !DILocation(line: 22, column: 33, scope: !59)
!64 = !DILocation(line: 22, column: 38, scope: !59)
!65 = !DILocation(line: 23, column: 5, scope: !59)
!66 = !DILocation(line: 24, column: 4, scope: !30)
