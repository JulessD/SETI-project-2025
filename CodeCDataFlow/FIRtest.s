	.text
	.attribute	4, 16
	.attribute	5, "rv64i2p1_m2p0_a2p1_f2p2_d2p2_c2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.file	"FIR.c"
	.option	push
	.option	arch, +a, +c, +d, +f, +m, +zicsr, +zifencei, +zmmul
	.globl	getData                         # -- Begin function getData
	.p2align	1
	.type	getData,@function
getData:                                # @getData
# %bb.0:
	addi	sp, sp, -16
	sd	ra, 8(sp)                       # 8-byte Folded Spill
	sd	s0, 0(sp)                       # 8-byte Folded Spill
	addi	s0, sp, 16
	li	a0, 0
	call	time
	sext.w	a0, a0
	call	srand
	call	rand
	lui	a1, 174763
	addiw	a1, a1, -1365
	mul	a1, a0, a1
	srli	a2, a1, 63
	srai	a1, a1, 34
	addw	a1, a1, a2
	slliw	a2, a1, 5
	slliw	a1, a1, 3
	subw	a1, a1, a2
	addw	a0, a0, a1
	addiw	a0, a0, -3
	ld	ra, 8(sp)                       # 8-byte Folded Reload
	ld	s0, 0(sp)                       # 8-byte Folded Reload
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
	sd	ra, 40(sp)                      # 8-byte Folded Spill
	sd	s0, 32(sp)                      # 8-byte Folded Spill
	addi	s0, sp, 48
	addw a6, a0, x0		             # replace --	sw	a0, -20(s0)
	li	a0, 1
	addw a7, a0, x0		             # replace --	sw	a0, -24(s0)
	li	a1, 2
	addw s2, a1, x0		             # replace --	sw	a1, -28(s0)
	li	a2, 4
	addw s3, a2, x0		             # replace --	sw	a2, -32(s0)
	addw s4, a1, x0		             # replace --	sw	a1, -36(s0)
	addw s5, a0, x0		             # replace --	sw	a0, -40(s0)
	addw s6, ro, x0		             # replace --	sw	zero, -44(s0)
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
	addw a5, a6, x0		           # replace --	lw	a5, -20(s0)
	sw	a5, %lo(FIR.val4)(a4)
	addw a5, a7, x0		           # replace --	lw	a5, -24(s0)
	lw	a2, %lo(FIR.val0)(a2)
	mulw	a2, a5, a2
	addw a5, s6, x0		           # replace --	lw	a5, -44(s0)
	addw	a2, a2, a5
	addw s6, a2, x0		             # replace --	sw	a2, -44(s0)
	addw a2, s2, x0		           # replace --	lw	a2, -28(s0)
	lw	a0, %lo(FIR.val1)(a0)
	mulw	a0, a2, a0
	addw a2, s6, x0		           # replace --	lw	a2, -44(s0)
	addw	a0, a0, a2
	addw s6, a0, x0		             # replace --	sw	a0, -44(s0)
	addw a0, s3, x0		           # replace --	lw	a0, -32(s0)
	lw	a1, %lo(FIR.val2)(a1)
	mulw	a0, a0, a1
	addw a1, s6, x0		           # replace --	lw	a1, -44(s0)
	addw	a0, a0, a1
	addw s6, a0, x0		             # replace --	sw	a0, -44(s0)
	addw a0, s4, x0		           # replace --	lw	a0, -36(s0)
	lw	a1, %lo(FIR.val3)(a3)
	mulw	a0, a0, a1
	addw a1, s6, x0		           # replace --	lw	a1, -44(s0)
	addw	a0, a0, a1
	addw s6, a0, x0		             # replace --	sw	a0, -44(s0)
	addw a0, s5, x0		           # replace --	lw	a0, -40(s0)
	lw	a1, %lo(FIR.val4)(a4)
	mulw	a0, a0, a1
	addw a1, s6, x0		           # replace --	lw	a1, -44(s0)
	addw	a0, a0, a1
	addw s6, a0, x0		             # replace --	sw	a0, -44(s0)
	addw a0, s6, x0		           # replace --	lw	a0, -44(s0)
	ld	ra, 40(sp)                      # 8-byte Folded Reload
	ld	s0, 32(sp)                      # 8-byte Folded Reload
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
	addi	sp, sp, -32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	addi	s0, sp, 32
	addw a2, a0, x0		             # replace --	sw	a0, -20(s0)
	lui	a0, %hi(out)
	lw	a0, %lo(out)(a0)
	bnez	a0, .LBB2_3
	j	.LBB2_1
.LBB2_1:
	addw a0, a2, x0		           # replace --	lw	a0, -20(s0)
	li	a1, 51
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
	addw a0, a2, x0		           # replace --	lw	a0, -20(s0)
	li	a1, 29
	blt	a1, a0, .LBB2_6
	j	.LBB2_5
.LBB2_5:
	lui	a0, %hi(out)
	sw	zero, %lo(out)(a0)
	j	.LBB2_6
.LBB2_6:
	j	.LBB2_7
.LBB2_7:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 32
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
	addi	sp, sp, -32
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	addi	s0, sp, 32
	addw a2, a0, x0		             # replace --	sw	a0, -20(s0)
	addw a3, ro, x0		             # replace --	sw	zero, -24(s0)
	addw a4, ro, x0		             # replace --	sw	zero, -28(s0)
	lui	a0, %hi(out)
	lw	a0, %lo(out)(a0)
	li	a1, 1
	bne	a0, a1, .LBB3_4
	j	.LBB3_1
.LBB3_1:
	addw a0, a4, x0		           # replace --	lw	a0, -28(s0)
	bnez	a0, .LBB3_3
	j	.LBB3_2
.LBB3_2:
	li	a0, 1
	addw a4, a0, x0		             # replace --	sw	a0, -28(s0)
	j	.LBB3_3
.LBB3_3:
	addw a0, a2, x0		           # replace --	lw	a0, -20(s0)
	addw a1, a3, x0		           # replace --	lw	a1, -24(s0)
	addw	a0, a0, a1
	addw a3, a0, x0		             # replace --	sw	a0, -24(s0)
	j	.LBB3_7
.LBB3_4:
	addw a0, a4, x0		           # replace --	lw	a0, -28(s0)
	li	a1, 1
	beq	a0, a1, .LBB3_6
	j	.LBB3_5
.LBB3_5:
	li	a0, -1
	addw a4, a0, x0		             # replace --	sw	a0, -28(s0)
	addw a3, ro, x0		             # replace --	sw	zero, -24(s0)
	j	.LBB3_6
.LBB3_6:
	j	.LBB3_7
.LBB3_7:
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
	addi	sp, sp, 32
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
	sd	ra, 24(sp)                      # 8-byte Folded Spill
	sd	s0, 16(sp)                      # 8-byte Folded Spill
	addi	s0, sp, 32
	addw a5, ro, x0		             # replace --	sw	zero, -20(s0)
	addw a6, ro, x0		             # replace --	sw	zero, -32(s0)
	j	.LBB4_1
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	addw a0, a6, x0		           # replace --	lw	a0, -32(s0)
	li	a1, 69
	blt	a1, a0, .LBB4_3
	j	.LBB4_2
.LBB4_2:                                #   in Loop: Header=BB4_1 Depth=1
	call	getData
	lui	a1, %hi(data)
	sw	a0, %lo(data)(a1)
	lw	a0, %lo(data)(a1)
	addw a7, a0, x0		             # replace --	sw	a0, -24(s0)
	addw a0, a7, x0		           # replace --	lw	a0, -24(s0)
	call	FIR
	addw s2, a0, x0		             # replace --	sw	a0, -28(s0)
	addw a0, s2, x0		           # replace --	lw	a0, -28(s0)
	call	trigger
	addw a0, s2, x0		           # replace --	lw	a0, -28(s0)
	call	pulse_area
	addw a1, a7, x0		           # replace --	lw	a1, -24(s0)
	addw a2, s2, x0		           # replace --	lw	a2, -28(s0)
	lui	a0, %hi(.L.str)
	addi	a0, a0, %lo(.L.str)
	li	a3, 0
	li	a4, 0
	call	printf
	addw a0, a6, x0		           # replace --	lw	a0, -32(s0)
	addiw	a0, a0, 1
	addw a6, a0, x0		             # replace --	sw	a0, -32(s0)
	j	.LBB4_1
.LBB4_3:
	li	a0, 0
	ld	ra, 24(sp)                      # 8-byte Folded Reload
	ld	s0, 16(sp)                      # 8-byte Folded Reload
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

	.type	data,@object                    # @data
	.globl	data
	.p2align	2, 0x0
data:
	.word	0                               # 0x0
	.size	data, 4

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%03d %03d %03d %03d\n"
	.size	.L.str, 21

	.ident	"clang version 19.1.7 (Fedora 19.1.7-2.fc41)"
	.section	".note.GNU-stack","",@progbits
