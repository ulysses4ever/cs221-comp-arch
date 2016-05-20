# Вариант ассемблерного листинга для GNU Assembler под архитектуру i386-linux
# Знаковое расширение, как его выполняет GCC представлено в строках 66, 67 —
#    это обыкновенный арифметический сдвиг (см. demodiv-1.s из катлога ex1-...).
#
# Сассемблировать и получить исполняемый файл можно командой
#    gcc demodiv1.s

	.file	"demodiv.c"
	.intel_syntax noprefix
	.globl	a
	.data
	.align 4
	.type	a, @object
	.size	a, 16
a:
	.long	8
	.long	-3
	.long	6
	.long	1
	.text
	.globl	three
	.type	three, @function
three:
.LFB0:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	mov	eax, 3
	pop	ebp
	.cfi_restore 5
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE0:
	.size	three, .-three
	.section	.rodata
.LC0:
	.string	"%d\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB1:
	.cfi_startproc
	push	ebp
	.cfi_def_cfa_offset 8
	.cfi_offset 5, -8
	mov	ebp, esp
	.cfi_def_cfa_register 5
	push	ebx
	and	esp, -16
	sub	esp, 48
	.cfi_offset 3, -12
	mov	DWORD PTR [esp+40], 0
	mov	DWORD PTR [esp+44], OFFSET FLAT:a
	jmp	.L4
.L5:
	mov	eax, DWORD PTR [esp+44]
	mov	ebx, DWORD PTR [eax]
	call	three
	mov	DWORD PTR [esp+28], eax
	mov	eax, ebx
	mov	edx, eax
	sar	edx, 31
	idiv	DWORD PTR [esp+28]
	mov	DWORD PTR [esp+4], eax
	mov	DWORD PTR [esp], OFFSET FLAT:.LC0
	call	printf
	add	DWORD PTR [esp+40], 1
	add	DWORD PTR [esp+44], 4
.L4:
	cmp	DWORD PTR [esp+40], 3
	jle	.L5
	mov	ebx, DWORD PTR [ebp-4]
	leave
	.cfi_restore 5
	.cfi_restore 3
	.cfi_def_cfa 4, 4
	ret
	.cfi_endproc
.LFE1:
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 4.7.2-2ubuntu1) 4.7.2"
	.section	.note.GNU-stack,"",@progbits
