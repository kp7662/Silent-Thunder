	.arch armv8-a
	.file	"decomment.c"
	.text
	.global	lineNum
	.data
	.align	2
	.type	lineNum, %object
	.size	lineNum, 4
lineNum:
	.word	1
	.global	commentStartLine
	.bss
	.align	2
	.type	commentStartLine, %object
	.size	commentStartLine, 4
commentStartLine:
	.zero	4
	.text
	.align	2
	.global	handleStartState
	.type	handleStartState, %function
handleStartState:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L2
	mov	w0, 1
	str	w0, [sp, 44]
	b	.L3
.L2:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L4
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 44]
	b	.L3
.L4:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L5
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 5
	str	w0, [sp, 44]
	b	.L3
.L5:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L6
	ldr	w0, [sp, 28]
	bl	putchar
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	ldr	w0, [x0]
	add	w1, w0, 1
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	str	w1, [x0]
	str	wzr, [sp, 44]
	b	.L3
.L6:
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
.L3:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	handleStartState, .-handleStartState
	.align	2
	.global	handleMaybeCommentState
	.type	handleMaybeCommentState, %function
handleMaybeCommentState:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L9
	mov	w0, 32
	bl	putchar
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	ldr	w1, [x0]
	adrp	x0, commentStartLine
	add	x0, x0, :lo12:commentStartLine
	str	w1, [x0]
	mov	w0, 2
	str	w0, [sp, 44]
	b	.L10
.L9:
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L11
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 1
	str	w0, [sp, 44]
	b	.L10
.L11:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L12
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 44]
	b	.L10
.L12:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L13
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 5
	str	w0, [sp, 44]
	b	.L10
.L13:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L14
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	ldr	w0, [x0]
	add	w1, w0, 1
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	str	w1, [x0]
	str	wzr, [sp, 44]
	b	.L10
.L14:
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
.L10:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	handleMaybeCommentState, .-handleMaybeCommentState
	.align	2
	.global	handleInCommentState
	.type	handleInCommentState, %function
handleInCommentState:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L17
	mov	w0, 3
	str	w0, [sp, 44]
	b	.L18
.L17:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L19
	ldr	w0, [sp, 28]
	bl	putchar
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	ldr	w0, [x0]
	add	w1, w0, 1
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	str	w1, [x0]
	mov	w0, 2
	str	w0, [sp, 44]
	b	.L18
.L19:
	mov	w0, 2
	str	w0, [sp, 44]
.L18:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	handleInCommentState, .-handleInCommentState
	.align	2
	.global	handleEndCommentState
	.type	handleEndCommentState, %function
handleEndCommentState:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L22
	str	wzr, [sp, 44]
	b	.L23
.L22:
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L24
	mov	w0, 3
	str	w0, [sp, 44]
	b	.L23
.L24:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L25
	ldr	w0, [sp, 28]
	bl	putchar
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	ldr	w0, [x0]
	add	w1, w0, 1
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	str	w1, [x0]
	mov	w0, 2
	str	w0, [sp, 44]
	b	.L23
.L25:
	mov	w0, 2
	str	w0, [sp, 44]
.L23:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	handleEndCommentState, .-handleEndCommentState
	.align	2
	.global	handleStringLiteralState
	.type	handleStringLiteralState, %function
handleStringLiteralState:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L28
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
	b	.L29
.L28:
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L30
	mov	w0, 6
	str	w0, [sp, 44]
	b	.L29
.L30:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L31
	ldr	w0, [sp, 28]
	bl	putchar
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	ldr	w0, [x0]
	add	w1, w0, 1
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	str	w1, [x0]
	mov	w0, 4
	str	w0, [sp, 44]
	b	.L29
.L31:
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 44]
.L29:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	handleStringLiteralState, .-handleStringLiteralState
	.align	2
	.global	handleStringEscapeState
	.type	handleStringEscapeState, %function
handleStringEscapeState:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L34
	ldr	w0, [sp, 28]
	bl	putchar
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	ldr	w0, [x0]
	add	w1, w0, 1
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	str	w1, [x0]
	mov	w0, 6
	str	w0, [sp, 44]
	b	.L35
.L34:
	mov	w0, 92
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 44]
.L35:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	handleStringEscapeState, .-handleStringEscapeState
	.align	2
	.global	handleCharLiteralState
	.type	handleCharLiteralState, %function
handleCharLiteralState:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L38
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
	b	.L39
.L38:
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L40
	mov	w0, 7
	str	w0, [sp, 44]
	b	.L39
.L40:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L41
	ldr	w0, [sp, 28]
	bl	putchar
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	ldr	w0, [x0]
	add	w1, w0, 1
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	str	w1, [x0]
	mov	w0, 5
	str	w0, [sp, 44]
	b	.L39
.L41:
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 5
	str	w0, [sp, 44]
.L39:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	handleCharLiteralState, .-handleCharLiteralState
	.align	2
	.global	handleCharEscapeState
	.type	handleCharEscapeState, %function
handleCharEscapeState:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L44
	ldr	w0, [sp, 28]
	bl	putchar
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	ldr	w0, [x0]
	add	w1, w0, 1
	adrp	x0, lineNum
	add	x0, x0, :lo12:lineNum
	str	w1, [x0]
	mov	w0, 7
	str	w0, [sp, 44]
	b	.L45
.L44:
	mov	w0, 92
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 5
	str	w0, [sp, 44]
.L45:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	handleCharEscapeState, .-handleCharEscapeState
	.section	.rodata
	.align	3
.LC0:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	wzr, [sp, 28]
	b	.L48
.L58:
	ldr	w0, [sp, 28]
	cmp	w0, 3
	beq	.L49
	ldr	w0, [sp, 28]
	cmp	w0, 3
	bhi	.L50
	ldr	w0, [sp, 28]
	cmp	w0, 1
	beq	.L51
	ldr	w0, [sp, 28]
	cmp	w0, 1
	bhi	.L52
	b	.L65
.L50:
	ldr	w0, [sp, 28]
	cmp	w0, 5
	beq	.L54
	ldr	w0, [sp, 28]
	cmp	w0, 5
	bcc	.L55
	ldr	w0, [sp, 28]
	cmp	w0, 6
	beq	.L56
	ldr	w0, [sp, 28]
	cmp	w0, 7
	beq	.L57
	b	.L48
.L65:
	ldr	w0, [sp, 24]
	bl	handleStartState
	str	w0, [sp, 28]
	b	.L48
.L51:
	ldr	w0, [sp, 24]
	bl	handleMaybeCommentState
	str	w0, [sp, 28]
	b	.L48
.L52:
	ldr	w0, [sp, 24]
	bl	handleInCommentState
	str	w0, [sp, 28]
	b	.L48
.L49:
	ldr	w0, [sp, 24]
	bl	handleEndCommentState
	str	w0, [sp, 28]
	b	.L48
.L55:
	ldr	w0, [sp, 24]
	bl	handleStringLiteralState
	str	w0, [sp, 28]
	b	.L48
.L56:
	ldr	w0, [sp, 24]
	bl	handleStringEscapeState
	str	w0, [sp, 28]
	b	.L48
.L54:
	ldr	w0, [sp, 24]
	bl	handleCharLiteralState
	str	w0, [sp, 28]
	b	.L48
.L57:
	ldr	w0, [sp, 24]
	bl	handleCharEscapeState
	str	w0, [sp, 28]
	nop
.L48:
	bl	getchar
	str	w0, [sp, 24]
	ldr	w0, [sp, 24]
	cmn	w0, #1
	bne	.L58
	ldr	w0, [sp, 28]
	cmp	w0, 1
	bne	.L59
	mov	w0, 47
	bl	putchar
	mov	w0, 0
	b	.L60
.L59:
	ldr	w0, [sp, 28]
	cmp	w0, 6
	bne	.L61
	mov	w0, 92
	bl	putchar
	mov	w0, 0
	b	.L60
.L61:
	ldr	w0, [sp, 28]
	cmp	w0, 7
	bne	.L62
	mov	w0, 92
	bl	putchar
	mov	w0, 0
	b	.L60
.L62:
	ldr	w0, [sp, 28]
	cmp	w0, 2
	beq	.L63
	ldr	w0, [sp, 28]
	cmp	w0, 3
	bne	.L64
.L63:
	adrp	x0, stderr
	add	x0, x0, :lo12:stderr
	ldr	x3, [x0]
	adrp	x0, commentStartLine
	add	x0, x0, :lo12:commentStartLine
	ldr	w0, [x0]
	mov	w2, w0
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x3
	bl	fprintf
	mov	w0, 1
	b	.L60
.L64:
	mov	w0, 0
.L60:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 8.5.0 20210514 (Red Hat 8.5.0-10)"
	.section	.note.GNU-stack,"",@progbits
