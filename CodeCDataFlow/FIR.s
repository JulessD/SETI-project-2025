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
	addi	x2, x2, -16
	sd	x1, 8(x2)                       # 8-byte Folded Spill
	sd	x8, 0(x2)                       # 8-byte Folded Spill
	addi	x8, x2, 16
	lui	x10, %hi(getData.count)
	lw	x10, %lo(getData.count)(x10)
	li	x11, 4
	bne	x10, x11, .LBB0_2
	j	.LBB0_1
.LBB0_1:
	lui	x10, %hi(getData.count)
	sw	zero, %lo(getData.count)(x10)
	j	.LBB0_3
.LBB0_2:
	lui	x10, %hi(getData.count)
	lw	x11, %lo(getData.count)(x10)
	addiw	x11, x11, 1
	sw	x11, %lo(getData.count)(x10)
	j	.LBB0_3
.LBB0_3:
	lui	x10, %hi(getData.count)
	lw	x10, %lo(getData.count)(x10)
	slli	x10, x10, 2
	lui	x11, %hi(rddata)
	addi	x11, x11, %lo(rddata)
	add	x10, x10, x11
	lw	x10, 0(x10)
	ld	x1, 8(x2)                       # 8-byte Folded Reload
	ld	x8, 0(x2)                       # 8-byte Folded Reload
	addi	x2, x2, 16
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
	addi	x34, x34, -16
	sd	x33, 8(x34)                       # 8-byte Folded Spill
	sd	x40, 0(x34)                       # 8-byte Folded Spill
	addi	x40, x34, 16
	lui	x43, %hi(FIR.val1)
	lw	x44, %lo(FIR.val1)(x43)
	lui	x48, %hi(FIR.val0)
	sw	x44, %lo(FIR.val0)(x48)
	lui	x44, %hi(FIR.val2)
	lw	x46, %lo(FIR.val2)(x44)
	sw	x46, %lo(FIR.val1)(x43)
	lui	x46, %hi(FIR.val3)
	lw	x47, %lo(FIR.val3)(x46)
	sw	x47, %lo(FIR.val2)(x44)
	lui	x47, %hi(FIR.val4)
	lw	x45, %lo(FIR.val4)(x47)
	sw	x45, %lo(FIR.val3)(x46)
	sw	x42, %lo(FIR.val4)(x47)
	lw	x42, %lo(FIR.val0)(x48)
	lw	x43, %lo(FIR.val1)(x43)
	slliw	x43, x43, 1
	addw	x42, x42, x43
	lw	x43, %lo(FIR.val2)(x44)
	slliw	x43, x43, 2
	lw	x44, %lo(FIR.val3)(x46)
	slliw	x44, x44, 1
	addw	x43, x43, x44
	addw	x42, x42, x43
	lw	x43, %lo(FIR.val4)(x47)
	addw	x42, x42, x43
	ld	x33, 8(x34)                       # 8-byte Folded Reload
	ld	x40, 0(x34)                       # 8-byte Folded Reload
	addi	x34, x34, 16
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
	addi	x66, x66, -32
	sd	x65, 24(x66)                      # 8-byte Folded Spill
	sd	x72, 16(x66)                      # 8-byte Folded Spill
	addi	x72, x66, 32
	mv	x76, x74		             # replace --	sw	x74, -20(x72)
	lui	x74, %hi(out)
	lw	x74, %lo(out)(x74)
	bnez	x74, .LBB2_3
	j	.LBB2_1
.LBB2_1:
	mv	x74, x76		           # replace --	lw	x74, -20(x72)
	li	x75, 13
	blt	x74, x75, .LBB2_3
	j	.LBB2_2
.LBB2_2:
	lui	x74, %hi(out)
	li	x75, 1
	sw	x75, %lo(out)(x74)
	j	.LBB2_7
.LBB2_3:
	lui	x74, %hi(out)
	lw	x74, %lo(out)(x74)
	li	x75, 1
	bne	x74, x75, .LBB2_6
	j	.LBB2_4
.LBB2_4:
	mv	x74, x76		           # replace --	lw	x74, -20(x72)
	li	x75, 10
	blt	x75, x74, .LBB2_6
	j	.LBB2_5
.LBB2_5:
	lui	x74, %hi(out)
	sw	zero, %lo(out)(x74)
	j	.LBB2_6
.LBB2_6:
	j	.LBB2_7
.LBB2_7:
	ld	x65, 24(x66)                      # 8-byte Folded Reload
	ld	x72, 16(x66)                      # 8-byte Folded Reload
	addi	x66, x66, 32
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
	addi	x98, x98, -32
	sd	x97, 24(x98)                      # 8-byte Folded Spill
	sd	x104, 16(x98)                      # 8-byte Folded Spill
	addi	x104, x98, 32
	mv	x109, x106		             # replace --	sw	x106, -20(x104)
	lui	x106, %hi(out)
	lw	x106, %lo(out)(x106)
	li	x107, 1
	bne	x106, x107, .LBB3_4
	j	.LBB3_1
.LBB3_1:
	lui	x106, %hi(pulse_area.start)
	lw	x106, %lo(pulse_area.start)(x106)
	bnez	x106, .LBB3_3
	j	.LBB3_2
.LBB3_2:
	lui	x106, %hi(pulse_area.start)
	li	x107, 1
	sw	x107, %lo(pulse_area.start)(x106)
	j	.LBB3_3
.LBB3_3:
	mv	x106, x109		           # replace --	lw	x106, -20(x104)
	lui	x107, %hi(area)
	lw	x108, %lo(area)(x107)
	addw	x106, x106, x108
	sw	x106, %lo(area)(x107)
	j	.LBB3_7
.LBB3_4:
	lui	x106, %hi(pulse_area.start)
	lw	x106, %lo(pulse_area.start)(x106)
	li	x107, 1
	beq	x106, x107, .LBB3_6
	j	.LBB3_5
.LBB3_5:
	lui	x106, %hi(pulse_area.start)
	li	x107, -1
	sw	x107, %lo(pulse_area.start)(x106)
	lui	x106, %hi(area)
	sw	zero, %lo(area)(x106)
	j	.LBB3_6
.LBB3_6:
	j	.LBB3_7
.LBB3_7:
	ld	x97, 24(x98)                      # 8-byte Folded Reload
	ld	x104, 16(x98)                      # 8-byte Folded Reload
	addi	x98, x98, 32
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
	addi	x130, x130, -32
	sd	x129, 24(x130)                      # 8-byte Folded Spill
	sd	x136, 16(x130)                      # 8-byte Folded Spill
	addi	x136, x130, 32
	mv	x143, zero		             # replace --	sw	zero, -20(x136)
	mv	x144, zero		             # replace --	sw	zero, -32(x136)
	j	.LBB4_1
.LBB4_1:                                # =>This Inner Loop Header: Depth=1
	mv	x138, x144		           # replace --	lw	x138, -32(x136)
	li	x139, 69
	blt	x139, x138, .LBB4_3
	j	.LBB4_2
.LBB4_2:                                #   in Loop: Header=BB4_1 Depth=1
	call	getData
	mv	x145, x138		             # replace --	sw	x138, -24(x136)
	mv	x138, x145		           # replace --	lw	x138, -24(x136)
	call	FIR
	mv	x146, x138		             # replace --	sw	x138, -28(x136)
	mv	x138, x146		           # replace --	lw	x138, -28(x136)
	call	trigger
	mv	x138, x146		           # replace --	lw	x138, -28(x136)
	call	pulse_area
	mv	x139, x145		           # replace --	lw	x139, -24(x136)
	mv	x140, x146		           # replace --	lw	x140, -28(x136)
	lui	x138, %hi(out)
	lw	x141, %lo(out)(x138)
	lui	x138, %hi(area)
	lw	x142, %lo(area)(x138)
	lui	x138, %hi(.L.str)
	addi	x138, x138, %lo(.L.str)
	call	printf
	mv	x138, x144		           # replace --	lw	x138, -32(x136)
	addiw	x138, x138, 1
	mv	x144, x138		             # replace --	sw	x138, -32(x136)
	j	.LBB4_1
.LBB4_3:
	li	x138, 0
	ld	x129, 24(x130)                      # 8-byte Folded Reload
	ld	x136, 16(x130)                      # 8-byte Folded Reload
	addi	x130, x130, 32
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

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"%03d %03d %03d %03d\n"
	.size	.L.str, 21

	.ident	"clang version 19.1.7 (Fedora 19.1.7-2.fc41)"
	.section	".note.GNU-stack","",@progbits
