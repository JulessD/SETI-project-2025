; ModuleID = 'FIR.c'
source_filename = "FIR.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "riscv64-unknown-unknown"

@out = dso_local global i32 0, align 4
@FIR.val0 = internal global i32 0, align 4
@FIR.val1 = internal global i32 0, align 4
@FIR.val2 = internal global i32 0, align 4
@FIR.val3 = internal global i32 0, align 4
@FIR.val4 = internal global i32 0, align 4
@.str = private unnamed_addr constant [21 x i8] c"%03d %03d %03d %03d\0A\00", align 1

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @getData() #0 {
  ret i32 2
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @FIR(i32 noundef signext %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 1, ptr %3, align 4
  store i32 2, ptr %4, align 4
  store i32 4, ptr %5, align 4
  store i32 2, ptr %6, align 4
  store i32 1, ptr %7, align 4
  store i32 0, ptr %8, align 4
  %9 = load i32, ptr @FIR.val1, align 4
  store i32 %9, ptr @FIR.val0, align 4
  %10 = load i32, ptr @FIR.val2, align 4
  store i32 %10, ptr @FIR.val1, align 4
  %11 = load i32, ptr @FIR.val3, align 4
  store i32 %11, ptr @FIR.val2, align 4
  %12 = load i32, ptr @FIR.val4, align 4
  store i32 %12, ptr @FIR.val3, align 4
  %13 = load i32, ptr %2, align 4
  store i32 %13, ptr @FIR.val4, align 4
  %14 = load i32, ptr %3, align 4
  %15 = load i32, ptr @FIR.val0, align 4
  %16 = mul nsw i32 %14, %15
  %17 = load i32, ptr %8, align 4
  %18 = add nsw i32 %17, %16
  store i32 %18, ptr %8, align 4
  %19 = load i32, ptr %4, align 4
  %20 = load i32, ptr @FIR.val1, align 4
  %21 = mul nsw i32 %19, %20
  %22 = load i32, ptr %8, align 4
  %23 = add nsw i32 %22, %21
  store i32 %23, ptr %8, align 4
  %24 = load i32, ptr %5, align 4
  %25 = load i32, ptr @FIR.val2, align 4
  %26 = mul nsw i32 %24, %25
  %27 = load i32, ptr %8, align 4
  %28 = add nsw i32 %27, %26
  store i32 %28, ptr %8, align 4
  %29 = load i32, ptr %6, align 4
  %30 = load i32, ptr @FIR.val3, align 4
  %31 = mul nsw i32 %29, %30
  %32 = load i32, ptr %8, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, ptr %8, align 4
  %34 = load i32, ptr %7, align 4
  %35 = load i32, ptr @FIR.val4, align 4
  %36 = mul nsw i32 %34, %35
  %37 = load i32, ptr %8, align 4
  %38 = add nsw i32 %37, %36
  store i32 %38, ptr %8, align 4
  %39 = load i32, ptr %8, align 4
  ret i32 %39
}

; Function Attrs: noinline nounwind optnone
define dso_local void @trigger(i32 noundef signext %0) #0 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  %3 = load i32, ptr @out, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %5, label %9

5:                                                ; preds = %1
  %6 = load i32, ptr %2, align 4
  %7 = icmp sgt i32 %6, 50
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
  %14 = icmp slt i32 %13, 30
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
define dso_local void @pulse_area(i32 noundef signext %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 %0, ptr %2, align 4
  store i32 0, ptr %3, align 4
  store i32 0, ptr %4, align 4
  %5 = load i32, ptr @out, align 4
  %6 = icmp eq i32 %5, 1
  br i1 %6, label %7, label %15

7:                                                ; preds = %1
  %8 = load i32, ptr %4, align 4
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %11

10:                                               ; preds = %7
  store i32 1, ptr %4, align 4
  br label %11

11:                                               ; preds = %10, %7
  %12 = load i32, ptr %2, align 4
  %13 = load i32, ptr %3, align 4
  %14 = add nsw i32 %13, %12
  store i32 %14, ptr %3, align 4
  br label %20

15:                                               ; preds = %1
  %16 = load i32, ptr %4, align 4
  %17 = icmp ne i32 %16, 1
  br i1 %17, label %18, label %19

18:                                               ; preds = %15
  store i32 -1, ptr %4, align 4
  store i32 0, ptr %3, align 4
  br label %19

19:                                               ; preds = %18, %15
  br label %20

20:                                               ; preds = %19, %11
  ret void
}

; Function Attrs: noinline nounwind optnone
define dso_local signext i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i32 0, ptr %1, align 4
  store i32 0, ptr %4, align 4
  br label %5

5:                                                ; preds = %8, %0
  %6 = load i32, ptr %4, align 4
  %7 = icmp slt i32 %6, 70
  br i1 %7, label %8, label %19

8:                                                ; preds = %5
  %9 = call signext i32 @getData()
  store i32 %9, ptr %2, align 4
  %10 = load i32, ptr %2, align 4
  %11 = call signext i32 @FIR(i32 noundef signext %10)
  store i32 %11, ptr %3, align 4
  %12 = load i32, ptr %3, align 4
  call void @trigger(i32 noundef signext %12)
  %13 = load i32, ptr %3, align 4
  call void @pulse_area(i32 noundef signext %13)
  %14 = load i32, ptr %2, align 4
  %15 = load i32, ptr %3, align 4
  %16 = call signext i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef signext %14, i32 noundef signext %15, i32 noundef signext 0, i32 noundef signext 0)
  %17 = load i32, ptr %4, align 4
  %18 = add nsw i32 %17, 1
  store i32 %18, ptr %4, align 4
  br label %5, !llvm.loop !7

19:                                               ; preds = %5
  ret i32 0
}

declare dso_local signext i32 @printf(ptr noundef, ...) #1

attributes #0 = { noinline nounwind optnone "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+zicsr,+zifencei,+zmmul,-b,-e,-experimental-smmpm,-experimental-smnpm,-experimental-ssnpm,-experimental-sspm,-experimental-ssqosid,-experimental-supm,-experimental-zacas,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-h,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smepmp,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zaamo,-zabha,-zalrsc,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="generic-rv64" "target-features"="+64bit,+a,+c,+d,+f,+m,+relax,+zicsr,+zifencei,+zmmul,-b,-e,-experimental-smmpm,-experimental-smnpm,-experimental-ssnpm,-experimental-sspm,-experimental-ssqosid,-experimental-supm,-experimental-zacas,-experimental-zalasr,-experimental-zicfilp,-experimental-zicfiss,-h,-shcounterenw,-shgatpa,-shtvala,-shvsatpa,-shvstvala,-shvstvecd,-smaia,-smcdeleg,-smcsrind,-smepmp,-smstateen,-ssaia,-ssccfg,-ssccptr,-sscofpmf,-sscounterenw,-sscsrind,-ssstateen,-ssstrict,-sstc,-sstvala,-sstvecd,-ssu64xl,-svade,-svadu,-svbare,-svinval,-svnapot,-svpbmt,-v,-xcvalu,-xcvbi,-xcvbitmanip,-xcvelw,-xcvmac,-xcvmem,-xcvsimd,-xsfcease,-xsfvcp,-xsfvfnrclipxfqf,-xsfvfwmaccqqq,-xsfvqmaccdod,-xsfvqmaccqoq,-xsifivecdiscarddlone,-xsifivecflushdlone,-xtheadba,-xtheadbb,-xtheadbs,-xtheadcmo,-xtheadcondmov,-xtheadfmemidx,-xtheadmac,-xtheadmemidx,-xtheadmempair,-xtheadsync,-xtheadvdot,-xventanacondops,-xwchc,-za128rs,-za64rs,-zaamo,-zabha,-zalrsc,-zama16b,-zawrs,-zba,-zbb,-zbc,-zbkb,-zbkc,-zbkx,-zbs,-zca,-zcb,-zcd,-zce,-zcf,-zcmop,-zcmp,-zcmt,-zdinx,-zfa,-zfbfmin,-zfh,-zfhmin,-zfinx,-zhinx,-zhinxmin,-zic64b,-zicbom,-zicbop,-zicboz,-ziccamoa,-ziccif,-zicclsm,-ziccrse,-zicntr,-zicond,-zihintntl,-zihintpause,-zihpm,-zimop,-zk,-zkn,-zknd,-zkne,-zknh,-zkr,-zks,-zksed,-zksh,-zkt,-ztso,-zvbb,-zvbc,-zve32f,-zve32x,-zve64d,-zve64f,-zve64x,-zvfbfmin,-zvfbfwma,-zvfh,-zvfhmin,-zvkb,-zvkg,-zvkn,-zvknc,-zvkned,-zvkng,-zvknha,-zvknhb,-zvks,-zvksc,-zvksed,-zvksg,-zvksh,-zvkt,-zvl1024b,-zvl128b,-zvl16384b,-zvl2048b,-zvl256b,-zvl32768b,-zvl32b,-zvl4096b,-zvl512b,-zvl64b,-zvl65536b,-zvl8192b" }

!llvm.module.flags = !{!0, !1, !2, !4, !5}
!llvm.ident = !{!6}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 1, !"target-abi", !"lp64d"}
!2 = !{i32 6, !"riscv-isa", !3}
!3 = !{!"rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0"}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{i32 8, !"SmallDataLimit", i32 8}
!6 = !{!"clang version 19.1.7 (Fedora 19.1.7-2.fc41)"}
!7 = distinct !{!7, !8}
!8 = !{!"llvm.loop.mustprogress"}
