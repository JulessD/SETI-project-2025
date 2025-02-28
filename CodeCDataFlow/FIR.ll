; ModuleID = 'FIR.c'
source_filename = "FIR.c"
target datalayout = "e-m:e-p:32:32-i64:64-n32-S128"
target triple = "riscv32-unknown-unknown"

@out = dso_local global i32 0, align 4
@area = dso_local global i32 0, align 4
@rddata = dso_local global [5 x i32] [i32 -1, i32 2, i32 1, i32 3, i32 1], align 4
@getData.count = internal global i32 0, align 4
@FIR.val0 = internal global i32 0, align 4
@FIR.val1 = internal global i32 0, align 4
@FIR.val2 = internal global i32 0, align 4
@FIR.val3 = internal global i32 0, align 4
@FIR.val4 = internal global i32 0, align 4
@pulse_area.start = internal global i32 0, align 4

; Function Attrs: noinline nounwind optnone
define dso_local i32 @getData() #0 {
  %1 = load i32, ptr @getData.count, align 4
  %2 = icmp eq i32 %1, 4
  br i1 %2, label %3, label %4

3:                                                ; preds = %0
  store i32 0, ptr @getData.count, align 4
  br label %7

4:                                                ; preds = %0
  %5 = load i32, ptr @getData.count, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, ptr @getData.count, align 4
  br label %7

7:                                                ; preds = %4, %3
  %8 = load i32, ptr @getData.count, align 4
  %9 = getelementptr inbounds [5 x i32], ptr @rddata, i32 0, i32 %8
  %10 = load i32, ptr %9, align 4
  ret i32 %10
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @FIR(i32 noundef %0) #0 {
 ; alloca removed --   %2 = alloca i32, align 4
 ; alloca removed --   %3 = alloca i32, align 4
 ; alloca removed --   %4 = alloca i32, align 4
 ; alloca removed --   %5 = alloca i32, align 4
 ; alloca removed --   %6 = alloca i32, align 4
 ; alloca removed --   %7 = alloca i32, align 4
 ; alloca removed --   %8 = alloca i32, align 4
 ; store removed --   store i32 %0, ptr %2, align 4
 ; store removed --   store i32 1, ptr %3, align 4
 ; store removed --   store i32 2, ptr %4, align 4
 ; store removed --   store i32 4, ptr %5, align 4
 ; store removed --   store i32 2, ptr %6, align 4
 ; store removed --   store i32 1, ptr %7, align 4
 ; store removed --   store i32 0, ptr %8, align 4
  %9 = load i32, ptr @FIR.val1, align 4
  store i32 %9, ptr @FIR.val0, align 4
  %10 = load i32, ptr @FIR.val2, align 4
  store i32 %10, ptr @FIR.val1, align 4
  %11 = load i32, ptr @FIR.val3, align 4
  store i32 %11, ptr @FIR.val2, align 4
  %12 = load i32, ptr @FIR.val4, align 4
  store i32 %12, ptr @FIR.val3, align 4
 ; load removed --   %13 = load i32, ptr %2, align 4
  store i32 %0, ptr @FIR.val4, align 4
 ; load removed --   %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr @FIR.val0, align 4
  %16 = mul nsw i32 1, %15
 ; load removed --   %17 = load i32, ptr %8, align 4
  %18 = add nsw i32 0, %16
 ; store removed --   store i32 %18, ptr %8, align 4
 ; load removed --   %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr @FIR.val1, align 4
  %21 = mul nsw i32 2, %20
 ; load removed --   %22 = load i32, ptr %8, align 4
  %23 = add nsw i32 %18, %21
 ; store removed --   store i32 %23, ptr %8, align 4
 ; load removed --   %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr @FIR.val2, align 4
  %26 = mul nsw i32 4, %25
 ; load removed --   %27 = load i32, ptr %8, align 4
  %28 = add nsw i32 %23, %26
 ; store removed --   store i32 %28, ptr %8, align 4
 ; load removed --   %29 = load i32, ptr %6, align 4
  %30 = load i32, ptr @FIR.val3, align 4
  %31 = mul nsw i32 2, %30
 ; load removed --   %32 = load i32, ptr %8, align 4
  %33 = add nsw i32 %28, %31
 ; store removed --   store i32 %33, ptr %8, align 4
 ; load removed --   %34 = load i32, ptr %7, align 4
  %35 = load i32, ptr @FIR.val4, align 4
  %36 = mul nsw i32 1, %35
 ; load removed --   %37 = load i32, ptr %8, align 4
  %38 = add nsw i32 %33, %36
 ; store removed --   store i32 %38, ptr %8, align 4
 ; load removed --   %39 = load i32, ptr %8, align 4
  ret i32 %38
}

; Function Attrs: noinline nounwind optnone
define dso_local void @trigger(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr @out, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %9

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4
  %7 = icmp sgt i32 %6, 12
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  store i32 1, ptr @out, align 4
  br label %17

9:                                                ; preds = %5, %1
  %10 = load i32, ptr @out, align 4
  %11 = icmp eq i32 %10, 1
  br i1 %11, label %12, label %16

12:                                               ; preds = %9
  %13 = load i32, ptr %2, align 4
  %14 = icmp slt i32 %13, 11
  br i1 %14, label %15, label %16

15:                                               ; preds = %12
  store i32 0, ptr @out, align 4
  br label %16

16:                                               ; preds = %15, %12, %9
  br label %17

17:                                               ; preds = %16, %8
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local void @pulse_area(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr @out, align 4
  %4 = icmp eq i32 %3, 1
  br i1 %4, label %5, label %13

5:                                                ; preds = %1
  %6 = load i32, ptr @pulse_area.start, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %9

8:                                                ; preds = %5
  store i32 1, ptr @pulse_area.start, align 4
  br label %9

9:                                                ; preds = %8, %5
  %10 = load i32, ptr %2, align 4
  %11 = load i32, ptr @area, align 4
  %12 = add nsw i32 %11, %10
  store i32 %12, ptr @area, align 4
  br label %18

13:                                               ; preds = %1
  %14 = load i32, ptr @pulse_area.start, align 4
  %15 = icmp ne i32 %14, 1
  br i1 %15, label %16, label %17

16:                                               ; preds = %13
  store i32 -1, ptr @pulse_area.start, align 4
  store i32 0, ptr @area, align 4
  br label %17

17:                                               ; preds = %16, %13
  br label %18

18:                                               ; preds = %17, %9
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %8, %0
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %6, 10000
  br i1 %7, label %8, label %16

8:                                                ; preds = %5
  %9 = call i32 @getData()
  store i32 %9, ptr %2, align 4
  %10 = load i32, ptr %2, align 4
  %11 = call i32 @FIR(i32 noundef %10)
  store i32 %11, ptr %3, align 4
  %12 = load i32, ptr %3, align 4
  call void @trigger(i32 noundef %12)
  %13 = load i32, ptr %3, align 4
  call void @pulse_area(i32 noundef %13)
  %14 = load i32, ptr %4, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, ptr %4, align 4
  br label %5, !llvm.loop !7

16:                                               ; preds = %5
  ret i32 0
}

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv32" "target-features"="+32bit,+a,+c,+d,+f,+m,+relax,+zicsr,+zifencei,+zmmul,-b,-e,-experimental-smmpm,-experimental-smnpm,-experimental-ssnpm,-experimental-sspm,-experimental-ssqosid,-experimental-supm,-experimental-zacas,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-h,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smepmp,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zaamo,-zabha,-zalrsc,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"ilp32d"}
!2 = !{i32 6, !"riscv-isa", !3}
!3 = !{!"rv32i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0"}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 8, !"SmallDataLimit", i32 8}
!6 = !{!"clang version 19.1.7 (Fedora 19.1.7-2.fc41)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
