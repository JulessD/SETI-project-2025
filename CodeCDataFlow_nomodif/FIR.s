	.text
	.attribute	4, 16
	.attribute	5, "rv32i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.file	"FIR.c"
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +zicsr, +zifencei, +zmmul
	.globl	getData                         # -- Begin function getData
	.p2align	1
	.type	getData,@function
getData:                                # @getData
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
	lui	a0, %hi(getData.count)
	lw	a0, %lo(getData.count)(a0)
	li	a1, 4
	bne	a0, a1, .LBB0_2
	j	.LBB0_1
.LBB0_1:
	lui	a0, %hi(getData.count)
	sw	zero, %lo(getData.count)(a0)
	j	.LBB0_3
.LBB0_2:
	lui	a0, %hi(getData.count)
	lw	a1, %lo(getData.count)(a0)
	addi	a1, a1, 1
	sw	a1, %lo(getData.count)(a0)
	j	.LBB0_3
.LBB0_3:
	lui	a0, %hi(getData.count)
	lw	a0, %lo(getData.count)(a0)
	slli	a0, a0, 2
	lui	a1, %hi(rddata)
	addi	a1, a1, %lo(rddata)
	add	a0, a0, a1
	lw	a0, 0(a0)
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end0:
	.size	getData, .Lfunc_end0-getData
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +zicsr, +zifencei, +zmmul
	.globl	FIR                             # -- Begin function FIR
	.p2align	1
	.type	FIR,@function
FIR:                                    # @FIR
# %bb.0:
	addi	sp, sp, -48
	sw	ra, 44(sp)                      # 4-byte Folded Spill
	sw	s0, 40(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 48
	sw	a0, -12(s0)
	li	a0, 1
	sw	a0, -16(s0)
	li	a1, 2
	sw	a1, -20(s0)
	li	a2, 4
	sw	a2, -24(s0)
	sw	a1, -28(s0)
	sw	a0, -32(s0)
	sw	zero, -36(s0)
	lui	a0, %hi(FIR.val1)
	lw	a1, %lo(FIR.val1)(a0)
	lui	a2, %hi(FIR.val0)
	sw	a1, %lo(FIR.val0)(a2)
	lui	a1, %hi(FIR.val2)
	lw	a3, %lo(FIR.val2)(a1)
	sw	a3, %lo(FIR.val1)(a0)
	lui	a3, %hi(FIR.val3)
	lw	a4, %lo(FIR.val3)(a3)
	sw	a4, %lo(FIR.val2)(a1)
	lui	a4, %hi(FIR.val4)
	lw	a5, %lo(FIR.val4)(a4)
	sw	a5, %lo(FIR.val3)(a3)
	lw	a5, -12(s0)
	sw	a5, %lo(FIR.val4)(a4)
	lw	a5, -16(s0)
	lw	a2, %lo(FIR.val0)(a2)
	mul	a2, a5, a2
	lw	a5, -36(s0)
	add	a2, a2, a5
	sw	a2, -36(s0)
	lw	a2, -20(s0)
	lw	a0, %lo(FIR.val1)(a0)
	mul	a0, a2, a0
	lw	a2, -36(s0)
	add	a0, a0, a2
	sw	a0, -36(s0)
	lw	a0, -24(s0)
	lw	a1, %lo(FIR.val2)(a1)
	mul	a0, a0, a1
	lw	a1, -36(s0)
	add	a0, a0, a1
	sw	a0, -36(s0)
	lw	a0, -28(s0)
	lw	a1, %lo(FIR.val3)(a3)
	mul	a0, a0, a1
	lw	a1, -36(s0)
	add	a0, a0, a1
	sw	a0, -36(s0)
	lw	a0, -32(s0)
	lw	a1, %lo(FIR.val4)(a4)
	mul	a0, a0, a1
	lw	a1, -36(s0)
	add	a0, a0, a1
	sw	a0, -36(s0)
	lw	a0, -36(s0)
	lw	ra, 44(sp)                      # 4-byte Folded Reload
	lw	s0, 40(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 48
	ret
.Lfunc_end1:
	.size	FIR, .Lfunc_end1-FIR
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +zicsr, +zifencei, +zmmul
	.globl	trigger                         # -- Begin function trigger
	.p2align	1
	.type	trigger,@function
trigger:                                # @trigger
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lui	a0, %hi(out)
	lw	a0, %lo(out)(a0)
	bnez	a0, .LBB2_3
	j	.LBB2_1
.LBB2_1:
	lw	a0, -12(s0)
	li	a1, 13
	blt	a0, a1, .LBB2_3
	j	.LBB2_2
.LBB2_2:
	lui	a0, %hi(out)
	li	a1, 1
	sw	a1, %lo(out)(a0)
	j	.LBB2_7
.LBB2_3:
	lui	a0, %hi(out)
	lw	a0, %lo(out)(a0)
	li	a1, 1
	bne	a0, a1, .LBB2_6
	j	.LBB2_4
.LBB2_4:
	lw	a0, -12(s0)
	li	a1, 10
	blt	a1, a0, .LBB2_6
	j	.LBB2_5
.LBB2_5:
	lui	a0, %hi(out)
	sw	zero, %lo(out)(a0)
	j	.LBB2_6
.LBB2_6:
	j	.LBB2_7
.LBB2_7:
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end2:
	.size	trigger, .Lfunc_end2-trigger
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +zicsr, +zifencei, +zmmul
	.globl	pulse_area                      # -- Begin function pulse_area
	.p2align	1
	.type	pulse_area,@function
pulse_area:                             # @pulse_area
# %bb.0:
	addi	sp, sp, -16
	sw	ra, 12(sp)                      # 4-byte Folded Spill
	sw	s0, 8(sp)                       # 4-byte Folded Spill
	addi	s0, sp, 16
	sw	a0, -12(s0)
	lui	a0, %hi(out)
	lw	a0, %lo(out)(a0)
	li	a1, 1
	bne	a0, a1, .LBB3_4
	j	.LBB3_1
.LBB3_1:
	lui	a0, %hi(pulse_area.start)
	lw	a0, %lo(pulse_area.start)(a0)
	bnez	a0, .LBB3_3
	j	.LBB3_2
.LBB3_2:
	lui	a0, %hi(pulse_area.start)
	li	a1, 1
	sw	a1, %lo(pulse_area.start)(a0)
	j	.LBB3_3
.LBB3_3:
	lw	a0, -12(s0)
	lui	a1, %hi(area)
	lw	a2, %lo(area)(a1)
	add	a0, a0, a2
	sw	a0, %lo(area)(a1)
	j	.LBB3_7
.LBB3_4:
	lui	a0, %hi(pulse_area.start)
	lw	a0, %lo(pulse_area.start)(a0)
	li	a1, 1
	beq	a0, a1, .LBB3_6
	j	.LBB3_5
.LBB3_5:
	lui	a0, %hi(pulse_area.start)
	li	a1, -1
	sw	a1, %lo(pulse_area.start)(a0)
	lui	a0, %hi(area)
	sw	zero, %lo(area)(a0)
	j	.LBB3_6
.LBB3_6:
	j	.LBB3_7
.LBB3_7:
	lw	ra, 12(sp)                      # 4-byte Folded Reload
	lw	s0, 8(sp)                       # 4-byte Folded Reload
	addi	sp, sp, 16
	ret
.Lfunc_end3:
	.size	pulse_area, .Lfunc_end3-pulse_area
                                        # -- End function
	.option	pop
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +zicsr, +zifencei, +zmmul
	.globl	main                            # -- Begin function main
	.p2align	1
	.type	main,@function
main:                                   # @main
# %bb.0:
	addi	sp, sp, -32
	sw	ra, 28(sp)                      # 4-byte Folded Spill
	sw	s0, 24(sp)                      # 4-byte Folded Spill
	addi	s0, sp, 32
	sw	zero, -12(s0)
	sw	zero, -24(s0)
	j	.LBB4_1
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	lw	a0, -24(s0)
	lui	a1, 2
	addi	a1, a1, 1807
	blt	a1, a0, .LBB4_3
	j	.LBB4_2
.LBB4_2:                                #   in Loop: Header=BB4_1 Depth=1
	call	getData
	sw	a0, -16(s0)
	lw	a0, -16(s0)
	call	FIR
	sw	a0, -20(s0)
	lw	a0, -20(s0)
	call	trigger
	lw	a0, -20(s0)
	call	pulse_area
	lw	a0, -24(s0)
	addi	a0, a0, 1
	sw	a0, -24(s0)
	j	.LBB4_1
.LBB4_3:
	li	a0, 0
	lw	ra, 28(sp)                      # 4-byte Folded Reload
	lw	s0, 24(sp)                      # 4-byte Folded Reload
	addi	sp, sp, 32
	ret
.Lfunc_end4:
	.size	main, .Lfunc_end4-main
                                        # -- End function
	.option	pop
	.type	out,@object                     # @out
	.section	.sbss,"aw",@nobits
	.globl	out
	.p2align	2, 0x0
out:
	.word	0                               # 0x0
	.size	out, 4

	.type	area,@object                    # @area
	.globl	area
	.p2align	2, 0x0
area:
	.word	0                               # 0x0
	.size	area, 4

	.type	rddata,@object                  # @rddata
	.data
	.globl	rddata
	.p2align	2, 0x0
rddata:
	.word	4294967295                      # 0xffffffff
	.word	2                               # 0x2
	.word	1                               # 0x1
	.word	3                               # 0x3
	.word	1                               # 0x1
	.size	rddata, 20

	.type	getData.count,@object           # @getData.count
	.section	.sbss,"aw",@nobits
	.p2align	2, 0x0
getData.count:
	.word	0                               # 0x0
	.size	getData.count, 4

	.type	FIR.val0,@object                # @FIR.val0
	.p2align	2, 0x0
FIR.val0:
	.word	0                               # 0x0
	.size	FIR.val0, 4

	.type	FIR.val1,@object                # @FIR.val1
	.p2align	2, 0x0
FIR.val1:
	.word	0                               # 0x0
	.size	FIR.val1, 4

	.type	FIR.val2,@object                # @FIR.val2
	.p2align	2, 0x0
FIR.val2:
	.word	0                               # 0x0
	.size	FIR.val2, 4

	.type	FIR.val3,@object                # @FIR.val3
	.p2align	2, 0x0
FIR.val3:
	.word	0                               # 0x0
	.size	FIR.val3, 4

	.type	FIR.val4,@object                # @FIR.val4
	.p2align	2, 0x0
FIR.val4:
	.word	0                               # 0x0
	.size	FIR.val4, 4

	.type	pulse_area.start,@object        # @pulse_area.start
	.p2align	2, 0x0
pulse_area.start:
	.word	0                               # 0x0
	.size	pulse_area.start, 4

	.ident	"clang version 19.1.7 (Fedora 19.1.7-2.fc41)"
	.section	".note.GNU-stack","",@progbits
