	.file	"acquisition.c"
	.text
.Ltext0:
	.type	ARV_IS_STREAM, @function
ARV_IS_STREAM:
.LFB352:
	.file 1 "/usr/include/aravis-0.8/arvstream.h"
	.loc 1 52 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
.LBB2:
	.loc 1 52 1
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	call	arv_stream_get_type@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L2
	.loc 1 52 1 is_stmt 0 discriminator 1
	movl	$0, -4(%rbp)
	jmp	.L3
.L2:
	.loc 1 52 1 discriminator 2
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L4
	.loc 1 52 1 discriminator 4
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	cmpq	%rax, -24(%rbp)
	jne	.L4
	.loc 1 52 1 discriminator 6
	movl	$1, -4(%rbp)
	jmp	.L3
.L4:
	.loc 1 52 1 discriminator 7
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_is_a@PLT
	movl	%eax, -4(%rbp)
.L3:
	.loc 1 52 1 discriminator 9
	movl	-4(%rbp), %eax
.LBE2:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE352:
	.size	ARV_IS_STREAM, .-ARV_IS_STREAM
	.type	ARV_IS_CAMERA, @function
ARV_IS_CAMERA:
.LFB1138:
	.file 2 "/usr/include/aravis-0.8/arvcamera.h"
	.loc 2 38 1 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
.LBB3:
	.loc 2 38 1
	movq	-40(%rbp), %rax
	movq	%rax, -16(%rbp)
	call	arv_camera_get_type@PLT
	movq	%rax, -24(%rbp)
	cmpq	$0, -16(%rbp)
	jne	.L7
	.loc 2 38 1 is_stmt 0 discriminator 1
	movl	$0, -4(%rbp)
	jmp	.L8
.L7:
	.loc 2 38 1 discriminator 2
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	testq	%rax, %rax
	je	.L9
	.loc 2 38 1 discriminator 4
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	movq	(%rax), %rax
	cmpq	%rax, -24(%rbp)
	jne	.L9
	.loc 2 38 1 discriminator 6
	movl	$1, -4(%rbp)
	jmp	.L8
.L9:
	.loc 2 38 1 discriminator 7
	movq	-24(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	g_type_check_instance_is_a@PLT
	movl	%eax, -4(%rbp)
.L8:
	.loc 2 38 1 discriminator 9
	movl	-4(%rbp), %eax
.LBE3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1138:
	.size	ARV_IS_CAMERA, .-ARV_IS_CAMERA
	.section	.rodata
.LC0:
	.string	"Acquired %d\303\227%d buffer\n"
.LC1:
	.string	"out/frame_%i.raw"
.LC2:
	.string	"w"
	.text
	.type	ACQ_NewFrame_CB, @function
ACQ_NewFrame_CB:
.LFB1824:
	.file 3 "src/acquisition.c"
	.loc 3 13 1 is_stmt 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -88(%rbp)
	movq	%rsi, -96(%rbp)
	.loc 3 15 12
	movq	-96(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 3 22 11
	movq	-88(%rbp), %rax
	movq	%rax, %rdi
	call	arv_stream_pop_buffer@PLT
	movq	%rax, -32(%rbp)
	.loc 3 25 2
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	arv_buffer_get_image_height@PLT
	movl	%eax, %ebx
	movq	-32(%rbp), %rax
	movq	%rax, %rdi
	call	arv_buffer_get_image_width@PLT
	movl	%ebx, %edx
	movl	%eax, %esi
	leaq	.LC0(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 3 29 2
	movq	-24(%rbp), %rax
	movl	8(%rax), %edx
	leaq	-80(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	sprintf@PLT
	.loc 3 30 7
	leaq	-80(%rbp), %rax
	leaq	.LC2(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -40(%rbp)
	.loc 3 31 2
	movq	-40(%rbp), %rdx
	movq	-32(%rbp), %rax
	movq	%rdx, %rcx
	movl	$15625, %edx
	movl	$1, %esi
	movq	%rax, %rdi
	call	fwrite@PLT
	.loc 3 32 2
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 3 35 2
	movq	-32(%rbp), %rdx
	movq	-88(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	arv_stream_push_buffer@PLT
	.loc 3 37 10
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	.loc 3 37 19
	leal	1(%rax), %edx
	movq	-24(%rbp), %rax
	movl	%edx, 8(%rax)
	.loc 3 39 14
	movq	-24(%rbp), %rax
	movl	8(%rax), %eax
	.loc 3 39 5
	cmpl	$3, %eax
	jne	.L13
	.loc 3 40 3
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	g_main_loop_quit@PLT
.L13:
	.loc 3 41 1
	nop
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1824:
	.size	ACQ_NewFrame_CB, .-ACQ_NewFrame_CB
	.section	.rodata
.LC3:
	.string	"Error: %s\n"
.LC4:
	.string	"Found camera '%s'\n"
.LC6:
	.string	"new-buffer"
	.text
	.globl	ACQ_Init_stream
	.type	ACQ_Init_stream, @function
ACQ_Init_stream:
.LFB1825:
	.loc 3 45 1
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$96, %rsp
	.loc 3 46 10
	movq	$0, -64(%rbp)
	.loc 3 52 11
	leaq	-64(%rbp), %rax
	movq	%rax, %rsi
	movl	$0, %edi
	call	arv_camera_new@PLT
	movq	%rax, -16(%rbp)
	.loc 3 53 6
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	ARV_IS_CAMERA
	.loc 3 53 4
	testl	%eax, %eax
	jne	.L15
	.loc 3 54 30
	movq	-64(%rbp), %rax
	.loc 3 54 3
	movq	8(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 3 55 10
	movl	$1, %eax
	jmp	.L26
.L15:
	.loc 3 57 2
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	arv_camera_get_model_name@PLT
	movq	%rax, %rsi
	leaq	.LC4(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 3 60 2
	leaq	-64(%rbp), %rdx
	movq	-16(%rbp), %rax
	movl	$17301505, %esi
	movq	%rax, %rdi
	call	arv_camera_set_pixel_format@PLT
	.loc 3 61 2
	leaq	-64(%rbp), %rcx
	movq	.LC5(%rip), %rdx
	movq	-16(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rdx, %xmm0
	movq	%rax, %rdi
	call	arv_camera_set_frame_rate@PLT
	.loc 3 62 2
	leaq	-64(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %r9
	movl	$125, %r8d
	movl	$125, %ecx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	arv_camera_set_region@PLT
	.loc 3 63 2
	leaq	-64(%rbp), %rdx
	movq	-16(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	arv_camera_set_acquisition_mode@PLT
	.loc 3 69 23
	movl	$0, %esi
	movl	$0, %edi
	call	g_main_loop_new@PLT
	.loc 3 69 21
	movq	%rax, -96(%rbp)
	.loc 3 70 19
	movl	$0, -88(%rbp)
	.loc 3 72 11
	leaq	-64(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rcx
	movl	$0, %edx
	movl	$0, %esi
	movq	%rax, %rdi
	call	arv_camera_create_stream@PLT
	.loc 3 72 9
	movq	%rax, -72(%rbp)
	.loc 3 73 6
	movq	-72(%rbp), %rax
	movq	%rax, %rdi
	call	ARV_IS_STREAM
	.loc 3 73 4
	testl	%eax, %eax
	jne	.L17
	.loc 3 74 30
	movq	-64(%rbp), %rax
	.loc 3 74 3
	movq	8(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
.LBB4:
	.loc 3 75 3
	leaq	-72(%rbp), %rax
	movq	%rax, -48(%rbp)
	movq	-48(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -56(%rbp)
	movq	-48(%rbp), %rax
	movq	$0, (%rax)
	cmpq	$0, -56(%rbp)
	je	.L18
	.loc 3 75 3 is_stmt 0 discriminator 1
	movq	-56(%rbp), %rax
	movq	%rax, %rdi
	call	g_object_unref@PLT
.L18:
.LBE4:
	.loc 3 76 10 is_stmt 1
	movl	$1, %eax
	jmp	.L26
.L17:
	.loc 3 80 12
	leaq	-64(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	arv_camera_get_payload@PLT
	.loc 3 80 10
	movl	%eax, %eax
	movq	%rax, -24(%rbp)
	.loc 3 81 12
	movq	-64(%rbp), %rax
	.loc 3 81 5
	testq	%rax, %rax
	jne	.L19
	.loc 3 82 10
	movl	$0, -4(%rbp)
	.loc 3 82 3
	jmp	.L20
.L21:
	.loc 3 83 4 discriminator 3
	movq	-24(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	arv_buffer_new@PLT
	movq	%rax, %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	arv_stream_push_buffer@PLT
	.loc 3 82 23 discriminator 3
	addl	$1, -4(%rbp)
.L20:
	.loc 3 82 3 discriminator 1
	cmpl	$4, -4(%rbp)
	jle	.L21
.L19:
	.loc 3 86 2
	movq	-72(%rbp), %rax
	leaq	-96(%rbp), %rdx
	movl	$0, %r9d
	movl	$0, %r8d
	movq	%rdx, %rcx
	leaq	ACQ_NewFrame_CB(%rip), %rdx
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rdi
	call	g_signal_connect_data@PLT
	.loc 3 87 2
	movq	-72(%rbp), %rax
	movl	$1, %esi
	movq	%rax, %rdi
	call	arv_stream_set_emit_signals@PLT
	.loc 3 89 11
	movq	-64(%rbp), %rax
	.loc 3 89 4
	testq	%rax, %rax
	jne	.L22
	.loc 3 90 3
	leaq	-64(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	arv_camera_start_acquisition@PLT
.L22:
	.loc 3 92 11
	movq	-64(%rbp), %rax
	.loc 3 92 4
	testq	%rax, %rax
	jne	.L23
	.loc 3 93 3
	movq	-96(%rbp), %rax
	movq	%rax, %rdi
	call	g_main_loop_run@PLT
.L23:
	.loc 3 95 11
	movq	-64(%rbp), %rax
	.loc 3 95 4
	testq	%rax, %rax
	jne	.L24
	.loc 3 96 3
	leaq	-64(%rbp), %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	arv_camera_stop_acquisition@PLT
.L24:
	.loc 3 98 2
	movq	-72(%rbp), %rax
	movl	$0, %esi
	movq	%rax, %rdi
	call	arv_stream_set_emit_signals@PLT
.LBB5:
	.loc 3 101 2
	leaq	-72(%rbp), %rax
	movq	%rax, -32(%rbp)
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -40(%rbp)
	movq	-32(%rbp), %rax
	movq	$0, (%rax)
	cmpq	$0, -40(%rbp)
	je	.L25
	.loc 3 101 2 is_stmt 0 discriminator 1
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	g_object_unref@PLT
.L25:
.LBE5:
	.loc 3 103 9 is_stmt 1
	movl	$0, %eax
.L26:
	.loc 3 104 1 discriminator 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1825:
	.size	ACQ_Init_stream, .-ACQ_Init_stream
	.section	.rodata
	.align 8
.LC5:
	.long	0
	.long	1078853632
	.text
.Letext0:
	.file 4 "/usr/lib/gcc/x86_64-linux-gnu/10/include/stddef.h"
	.file 5 "/usr/lib/x86_64-linux-gnu/glib-2.0/include/glibconfig.h"
	.file 6 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 7 "/usr/include/glib-2.0/glib/gtypes.h"
	.file 8 "/usr/include/glib-2.0/glib/gquark.h"
	.file 9 "/usr/include/glib-2.0/glib/gerror.h"
	.file 10 "/usr/include/glib-2.0/glib/gdataset.h"
	.file 11 "/usr/include/glib-2.0/glib/gmain.h"
	.file 12 "/usr/include/glib-2.0/gobject/gtype.h"
	.file 13 "/usr/include/glib-2.0/gobject/gclosure.h"
	.file 14 "/usr/include/glib-2.0/gobject/gsignal.h"
	.file 15 "/usr/include/glib-2.0/gobject/gobject.h"
	.file 16 "/usr/include/aravis-0.8/arvenums.h"
	.file 17 "/usr/include/aravis-0.8/arvtypes.h"
	.file 18 "/usr/include/aravis-0.8/arvbuffer.h"
	.file 19 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 20 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x794
	.value	0x4
	.long	.Ldebug_abbrev0
	.byte	0x8
	.uleb128 0x1
	.long	.LASF109
	.byte	0xc
	.long	.LASF110
	.long	.LASF111
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF0
	.uleb128 0x3
	.long	.LASF8
	.byte	0x4
	.byte	0xd1
	.byte	0x17
	.long	0x40
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF1
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF2
	.uleb128 0x2
	.byte	0x10
	.byte	0x4
	.long	.LASF3
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF4
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF5
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.long	.LASF6
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF7
	.uleb128 0x3
	.long	.LASF9
	.byte	0x5
	.byte	0x34
	.byte	0x16
	.long	0x84
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF10
	.uleb128 0x3
	.long	.LASF11
	.byte	0x5
	.byte	0x4e
	.byte	0x17
	.long	0x40
	.uleb128 0x3
	.long	.LASF12
	.byte	0x6
	.byte	0x98
	.byte	0x19
	.long	0x2d
	.uleb128 0x3
	.long	.LASF13
	.byte	0x6
	.byte	0x99
	.byte	0x1b
	.long	0x2d
	.uleb128 0x5
	.byte	0x8
	.uleb128 0x6
	.byte	0x8
	.long	0xb7
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF14
	.uleb128 0x3
	.long	.LASF15
	.byte	0x7
	.byte	0x2e
	.byte	0x10
	.long	0xb7
	.uleb128 0x3
	.long	.LASF16
	.byte	0x7
	.byte	0x31
	.byte	0x10
	.long	0x47
	.uleb128 0x3
	.long	.LASF17
	.byte	0x7
	.byte	0x32
	.byte	0x10
	.long	0xca
	.uleb128 0x3
	.long	.LASF18
	.byte	0x7
	.byte	0x37
	.byte	0x19
	.long	0x84
	.uleb128 0x7
	.long	0xe2
	.uleb128 0x2
	.byte	0x4
	.byte	0x4
	.long	.LASF19
	.uleb128 0x2
	.byte	0x8
	.byte	0x4
	.long	.LASF20
	.uleb128 0x3
	.long	.LASF21
	.byte	0x7
	.byte	0x67
	.byte	0xf
	.long	0xaf
	.uleb128 0x6
	.byte	0x8
	.long	0xbe
	.uleb128 0x3
	.long	.LASF22
	.byte	0x8
	.byte	0x24
	.byte	0x11
	.long	0x78
	.uleb128 0x3
	.long	.LASF23
	.byte	0x9
	.byte	0x29
	.byte	0x18
	.long	0x12b
	.uleb128 0x8
	.long	.LASF34
	.byte	0x10
	.byte	0x9
	.byte	0x2b
	.byte	0x8
	.long	0x160
	.uleb128 0x9
	.long	.LASF24
	.byte	0x9
	.byte	0x2d
	.byte	0x10
	.long	0x113
	.byte	0
	.uleb128 0x9
	.long	.LASF25
	.byte	0x9
	.byte	0x2e
	.byte	0x10
	.long	0xca
	.byte	0x4
	.uleb128 0x9
	.long	.LASF26
	.byte	0x9
	.byte	0x2f
	.byte	0x10
	.long	0x10d
	.byte	0x8
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x166
	.uleb128 0xa
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF27
	.uleb128 0xb
	.long	0xb7
	.long	0x17e
	.uleb128 0xc
	.long	0x40
	.byte	0x1f
	.byte	0
	.uleb128 0x3
	.long	.LASF28
	.byte	0xa
	.byte	0x24
	.byte	0x21
	.long	0x18a
	.uleb128 0xd
	.long	.LASF30
	.uleb128 0x3
	.long	.LASF29
	.byte	0xb
	.byte	0x38
	.byte	0x29
	.long	0x19b
	.uleb128 0xd
	.long	.LASF31
	.uleb128 0x6
	.byte	0x8
	.long	0x11f
	.uleb128 0x6
	.byte	0x8
	.long	0x17e
	.uleb128 0x6
	.byte	0x8
	.long	0x18f
	.uleb128 0xe
	.long	.LASF32
	.byte	0xc
	.value	0x180
	.byte	0x29
	.long	0x8b
	.uleb128 0xe
	.long	.LASF33
	.byte	0xc
	.value	0x187
	.byte	0x29
	.long	0x1cc
	.uleb128 0xf
	.long	.LASF35
	.byte	0x8
	.byte	0xc
	.value	0x198
	.byte	0x8
	.long	0x1e9
	.uleb128 0x10
	.long	.LASF36
	.byte	0xc
	.value	0x19b
	.byte	0x9
	.long	0x1b2
	.byte	0
	.byte	0
	.uleb128 0xe
	.long	.LASF37
	.byte	0xc
	.value	0x189
	.byte	0x29
	.long	0x1f6
	.uleb128 0xf
	.long	.LASF38
	.byte	0x8
	.byte	0xc
	.value	0x1a2
	.byte	0x8
	.long	0x213
	.uleb128 0x10
	.long	.LASF39
	.byte	0xc
	.value	0x1a5
	.byte	0xf
	.long	0x213
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x1bf
	.uleb128 0x6
	.byte	0x8
	.long	0x1e9
	.uleb128 0x3
	.long	.LASF40
	.byte	0xd
	.byte	0x56
	.byte	0x11
	.long	0x160
	.uleb128 0x11
	.byte	0x7
	.byte	0x4
	.long	0x84
	.byte	0xe
	.byte	0x9c
	.byte	0x1
	.long	0x246
	.uleb128 0x12
	.long	.LASF41
	.byte	0x1
	.uleb128 0x12
	.long	.LASF42
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF43
	.byte	0xe
	.byte	0x9f
	.byte	0x3
	.long	0x22b
	.uleb128 0x3
	.long	.LASF44
	.byte	0xf
	.byte	0xbb
	.byte	0x2a
	.long	0x25e
	.uleb128 0x8
	.long	.LASF45
	.byte	0x18
	.byte	0xf
	.byte	0xf5
	.byte	0x9
	.long	0x293
	.uleb128 0x9
	.long	.LASF46
	.byte	0xf
	.byte	0xf7
	.byte	0x12
	.long	0x1e9
	.byte	0
	.uleb128 0x9
	.long	.LASF47
	.byte	0xf
	.byte	0xfa
	.byte	0x12
	.long	0xee
	.byte	0x8
	.uleb128 0x9
	.long	.LASF48
	.byte	0xf
	.byte	0xfb
	.byte	0x12
	.long	0x1a6
	.byte	0x10
	.byte	0
	.uleb128 0x11
	.byte	0x7
	.byte	0x4
	.long	0x84
	.byte	0x10
	.byte	0x39
	.byte	0xe
	.long	0x2b4
	.uleb128 0x12
	.long	.LASF49
	.byte	0
	.uleb128 0x12
	.long	.LASF50
	.byte	0x1
	.uleb128 0x12
	.long	.LASF51
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.long	.LASF52
	.byte	0x10
	.byte	0x48
	.byte	0x11
	.long	0x78
	.uleb128 0x3
	.long	.LASF53
	.byte	0x11
	.byte	0x23
	.byte	0x1d
	.long	0x2cc
	.uleb128 0x8
	.long	.LASF54
	.byte	0x18
	.byte	0x2
	.byte	0x26
	.byte	0x1
	.long	0x2e7
	.uleb128 0x9
	.long	.LASF55
	.byte	0x2
	.byte	0x26
	.byte	0x1
	.long	0x252
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF56
	.byte	0x11
	.byte	0x51
	.byte	0x1d
	.long	0x2f3
	.uleb128 0x8
	.long	.LASF57
	.byte	0x18
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.long	0x30e
	.uleb128 0x9
	.long	.LASF55
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.long	0x252
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	.LASF58
	.byte	0x12
	.byte	0x59
	.byte	0x1
	.long	0x31a
	.uleb128 0xd
	.long	.LASF59
	.uleb128 0x6
	.byte	0x8
	.long	0x30e
	.uleb128 0x6
	.byte	0x8
	.long	0x2e7
	.uleb128 0x6
	.byte	0x8
	.long	0x2c0
	.uleb128 0x8
	.long	.LASF60
	.byte	0xd8
	.byte	0x13
	.byte	0x31
	.byte	0x8
	.long	0x4b8
	.uleb128 0x9
	.long	.LASF61
	.byte	0x13
	.byte	0x33
	.byte	0x7
	.long	0x47
	.byte	0
	.uleb128 0x9
	.long	.LASF62
	.byte	0x13
	.byte	0x36
	.byte	0x9
	.long	0xb1
	.byte	0x8
	.uleb128 0x9
	.long	.LASF63
	.byte	0x13
	.byte	0x37
	.byte	0x9
	.long	0xb1
	.byte	0x10
	.uleb128 0x9
	.long	.LASF64
	.byte	0x13
	.byte	0x38
	.byte	0x9
	.long	0xb1
	.byte	0x18
	.uleb128 0x9
	.long	.LASF65
	.byte	0x13
	.byte	0x39
	.byte	0x9
	.long	0xb1
	.byte	0x20
	.uleb128 0x9
	.long	.LASF66
	.byte	0x13
	.byte	0x3a
	.byte	0x9
	.long	0xb1
	.byte	0x28
	.uleb128 0x9
	.long	.LASF67
	.byte	0x13
	.byte	0x3b
	.byte	0x9
	.long	0xb1
	.byte	0x30
	.uleb128 0x9
	.long	.LASF68
	.byte	0x13
	.byte	0x3c
	.byte	0x9
	.long	0xb1
	.byte	0x38
	.uleb128 0x9
	.long	.LASF69
	.byte	0x13
	.byte	0x3d
	.byte	0x9
	.long	0xb1
	.byte	0x40
	.uleb128 0x9
	.long	.LASF70
	.byte	0x13
	.byte	0x40
	.byte	0x9
	.long	0xb1
	.byte	0x48
	.uleb128 0x9
	.long	.LASF71
	.byte	0x13
	.byte	0x41
	.byte	0x9
	.long	0xb1
	.byte	0x50
	.uleb128 0x9
	.long	.LASF72
	.byte	0x13
	.byte	0x42
	.byte	0x9
	.long	0xb1
	.byte	0x58
	.uleb128 0x9
	.long	.LASF73
	.byte	0x13
	.byte	0x44
	.byte	0x16
	.long	0x4d1
	.byte	0x60
	.uleb128 0x9
	.long	.LASF74
	.byte	0x13
	.byte	0x46
	.byte	0x14
	.long	0x4d7
	.byte	0x68
	.uleb128 0x9
	.long	.LASF75
	.byte	0x13
	.byte	0x48
	.byte	0x7
	.long	0x47
	.byte	0x70
	.uleb128 0x9
	.long	.LASF76
	.byte	0x13
	.byte	0x49
	.byte	0x7
	.long	0x47
	.byte	0x74
	.uleb128 0x9
	.long	.LASF77
	.byte	0x13
	.byte	0x4a
	.byte	0xb
	.long	0x97
	.byte	0x78
	.uleb128 0x9
	.long	.LASF78
	.byte	0x13
	.byte	0x4d
	.byte	0x12
	.long	0x71
	.byte	0x80
	.uleb128 0x9
	.long	.LASF79
	.byte	0x13
	.byte	0x4e
	.byte	0xf
	.long	0x5c
	.byte	0x82
	.uleb128 0x9
	.long	.LASF80
	.byte	0x13
	.byte	0x4f
	.byte	0x8
	.long	0x4dd
	.byte	0x83
	.uleb128 0x9
	.long	.LASF81
	.byte	0x13
	.byte	0x51
	.byte	0xf
	.long	0x4ed
	.byte	0x88
	.uleb128 0x9
	.long	.LASF82
	.byte	0x13
	.byte	0x59
	.byte	0xd
	.long	0xa3
	.byte	0x90
	.uleb128 0x9
	.long	.LASF83
	.byte	0x13
	.byte	0x5b
	.byte	0x17
	.long	0x4f8
	.byte	0x98
	.uleb128 0x9
	.long	.LASF84
	.byte	0x13
	.byte	0x5c
	.byte	0x19
	.long	0x503
	.byte	0xa0
	.uleb128 0x9
	.long	.LASF85
	.byte	0x13
	.byte	0x5d
	.byte	0x14
	.long	0x4d7
	.byte	0xa8
	.uleb128 0x9
	.long	.LASF86
	.byte	0x13
	.byte	0x5e
	.byte	0x9
	.long	0xaf
	.byte	0xb0
	.uleb128 0x9
	.long	.LASF87
	.byte	0x13
	.byte	0x5f
	.byte	0xa
	.long	0x34
	.byte	0xb8
	.uleb128 0x9
	.long	.LASF88
	.byte	0x13
	.byte	0x60
	.byte	0x7
	.long	0x47
	.byte	0xc0
	.uleb128 0x9
	.long	.LASF89
	.byte	0x13
	.byte	0x62
	.byte	0x8
	.long	0x509
	.byte	0xc4
	.byte	0
	.uleb128 0x3
	.long	.LASF90
	.byte	0x14
	.byte	0x7
	.byte	0x19
	.long	0x331
	.uleb128 0x13
	.long	.LASF112
	.byte	0x13
	.byte	0x2b
	.byte	0xe
	.uleb128 0xd
	.long	.LASF91
	.uleb128 0x6
	.byte	0x8
	.long	0x4cc
	.uleb128 0x6
	.byte	0x8
	.long	0x331
	.uleb128 0xb
	.long	0xb7
	.long	0x4ed
	.uleb128 0xc
	.long	0x40
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x4c4
	.uleb128 0xd
	.long	.LASF92
	.uleb128 0x6
	.byte	0x8
	.long	0x4f3
	.uleb128 0xd
	.long	.LASF93
	.uleb128 0x6
	.byte	0x8
	.long	0x4fe
	.uleb128 0xb
	.long	0xb7
	.long	0x519
	.uleb128 0xc
	.long	0x40
	.byte	0x13
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x4b8
	.uleb128 0x14
	.byte	0x10
	.byte	0x3
	.byte	0x6
	.byte	0x9
	.long	0x543
	.uleb128 0x9
	.long	.LASF94
	.byte	0x3
	.byte	0x7
	.byte	0xd
	.long	0x1ac
	.byte	0
	.uleb128 0x9
	.long	.LASF95
	.byte	0x3
	.byte	0x8
	.byte	0xa
	.long	0x78
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	.LASF96
	.byte	0x3
	.byte	0x9
	.byte	0x3
	.long	0x51f
	.uleb128 0x15
	.long	.LASF113
	.byte	0x3
	.byte	0x2c
	.byte	0x5
	.long	0x47
	.quad	.LFB1825
	.quad	.LFE1825-.LFB1825
	.uleb128 0x1
	.byte	0x9c
	.long	0x632
	.uleb128 0x16
	.long	.LASF97
	.byte	0x3
	.byte	0x2e
	.byte	0xa
	.long	0x1a0
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0x16
	.long	.LASF98
	.byte	0x3
	.byte	0x2f
	.byte	0xd
	.long	0x32b
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x16
	.long	.LASF99
	.byte	0x3
	.byte	0x30
	.byte	0xd
	.long	0x325
	.uleb128 0x3
	.byte	0x91
	.sleb128 -88
	.uleb128 0x17
	.string	"i"
	.byte	0x3
	.byte	0x42
	.byte	0x6
	.long	0x47
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.long	.LASF100
	.byte	0x3
	.byte	0x43
	.byte	0x9
	.long	0x34
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x16
	.long	.LASF101
	.byte	0x3
	.byte	0x44
	.byte	0xb
	.long	0x543
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x18
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.long	0x601
	.uleb128 0x17
	.string	"_pp"
	.byte	0x3
	.byte	0x4b
	.byte	0x3
	.long	0x632
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x16
	.long	.LASF102
	.byte	0x3
	.byte	0x4b
	.byte	0x3
	.long	0x325
	.uleb128 0x3
	.byte	0x91
	.sleb128 -72
	.byte	0
	.uleb128 0x19
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x17
	.string	"_pp"
	.byte	0x3
	.byte	0x65
	.byte	0x2
	.long	0x632
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.long	.LASF102
	.byte	0x3
	.byte	0x65
	.byte	0x2
	.long	0x325
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.byte	0
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x325
	.uleb128 0x1a
	.long	.LASF107
	.byte	0x3
	.byte	0xc
	.byte	0xd
	.quad	.LFB1824
	.quad	.LFE1824-.LFB1824
	.uleb128 0x1
	.byte	0x9c
	.long	0x6b3
	.uleb128 0x1b
	.long	.LASF99
	.byte	0x3
	.byte	0xc
	.byte	0x29
	.long	0x325
	.uleb128 0x3
	.byte	0x91
	.sleb128 -104
	.uleb128 0x1b
	.long	.LASF103
	.byte	0x3
	.byte	0xc
	.byte	0x37
	.long	0xaf
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0x16
	.long	.LASF104
	.byte	0x3
	.byte	0xe
	.byte	0xd
	.long	0x31f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x16
	.long	.LASF101
	.byte	0x3
	.byte	0xf
	.byte	0xc
	.long	0x6b3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.string	"fp"
	.byte	0x3
	.byte	0x10
	.byte	0x8
	.long	0x519
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x16
	.long	.LASF105
	.byte	0x3
	.byte	0x11
	.byte	0x7
	.long	0x16e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -96
	.byte	0
	.uleb128 0x6
	.byte	0x8
	.long	0x543
	.uleb128 0x1c
	.long	.LASF114
	.byte	0x2
	.byte	0x26
	.byte	0x1
	.long	0xd6
	.quad	.LFB1138
	.quad	.LFE1138-.LFB1138
	.uleb128 0x1
	.byte	0x9c
	.long	0x72a
	.uleb128 0x1d
	.string	"ptr"
	.byte	0x2
	.byte	0x26
	.byte	0x1
	.long	0x101
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x19
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x16
	.long	.LASF106
	.byte	0x2
	.byte	0x26
	.byte	0x1
	.long	0x219
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.string	"__t"
	.byte	0x2
	.byte	0x26
	.byte	0x1
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.string	"__r"
	.byte	0x2
	.byte	0x26
	.byte	0x1
	.long	0xd6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x1e
	.long	.LASF108
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.long	0xd6
	.quad	.LFB352
	.quad	.LFE352-.LFB352
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x1d
	.string	"ptr"
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.long	0x101
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x19
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x16
	.long	.LASF106
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.long	0x219
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x17
	.string	"__t"
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.long	0x1b2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.string	"__r"
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.long	0xd6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x15
	.byte	0
	.uleb128 0x27
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x4
	.byte	0x1
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x28
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF32:
	.string	"GType"
.LASF44:
	.string	"GObject"
.LASF16:
	.string	"gint"
.LASF17:
	.string	"gboolean"
.LASF59:
	.string	"_ArvBuffer"
.LASF35:
	.string	"_GTypeClass"
.LASF53:
	.string	"ArvCamera"
.LASF67:
	.string	"_IO_write_end"
.LASF6:
	.string	"short int"
.LASF8:
	.string	"size_t"
.LASF49:
	.string	"ARV_ACQUISITION_MODE_CONTINUOUS"
.LASF82:
	.string	"_offset"
.LASF15:
	.string	"gchar"
.LASF85:
	.string	"_freeres_list"
.LASF66:
	.string	"_IO_write_ptr"
.LASF61:
	.string	"_flags"
.LASF108:
	.string	"ARV_IS_STREAM"
.LASF96:
	.string	"ACQ_data"
.LASF68:
	.string	"_IO_buf_base"
.LASF22:
	.string	"GQuark"
.LASF110:
	.string	"src/acquisition.c"
.LASF73:
	.string	"_markers"
.LASF63:
	.string	"_IO_read_end"
.LASF103:
	.string	"user_data"
.LASF86:
	.string	"_freeres_buf"
.LASF58:
	.string	"ArvBuffer"
.LASF36:
	.string	"g_type"
.LASF114:
	.string	"ARV_IS_CAMERA"
.LASF21:
	.string	"gpointer"
.LASF19:
	.string	"float"
.LASF24:
	.string	"domain"
.LASF30:
	.string	"_GData"
.LASF2:
	.string	"long long int"
.LASF41:
	.string	"G_CONNECT_AFTER"
.LASF111:
	.string	"/home/user/projects/Quasar/software"
.LASF33:
	.string	"GTypeClass"
.LASF55:
	.string	"parent_instance"
.LASF81:
	.string	"_lock"
.LASF0:
	.string	"long int"
.LASF39:
	.string	"g_class"
.LASF47:
	.string	"ref_count"
.LASF99:
	.string	"stream"
.LASF78:
	.string	"_cur_column"
.LASF23:
	.string	"GError"
.LASF54:
	.string	"_ArvCamera"
.LASF56:
	.string	"ArvStream"
.LASF77:
	.string	"_old_offset"
.LASF3:
	.string	"long double"
.LASF40:
	.string	"GCallback"
.LASF5:
	.string	"unsigned char"
.LASF95:
	.string	"counter"
.LASF4:
	.string	"signed char"
.LASF83:
	.string	"_codecvt"
.LASF27:
	.string	"long long unsigned int"
.LASF98:
	.string	"camera"
.LASF18:
	.string	"guint"
.LASF107:
	.string	"ACQ_NewFrame_CB"
.LASF29:
	.string	"GMainLoop"
.LASF91:
	.string	"_IO_marker"
.LASF80:
	.string	"_shortbuf"
.LASF25:
	.string	"code"
.LASF65:
	.string	"_IO_write_base"
.LASF89:
	.string	"_unused2"
.LASF34:
	.string	"_GError"
.LASF62:
	.string	"_IO_read_ptr"
.LASF69:
	.string	"_IO_buf_end"
.LASF94:
	.string	"main_loop"
.LASF26:
	.string	"message"
.LASF106:
	.string	"__inst"
.LASF14:
	.string	"char"
.LASF60:
	.string	"_IO_FILE"
.LASF84:
	.string	"_wide_data"
.LASF7:
	.string	"short unsigned int"
.LASF87:
	.string	"__pad5"
.LASF28:
	.string	"GData"
.LASF43:
	.string	"GConnectFlags"
.LASF48:
	.string	"qdata"
.LASF57:
	.string	"_ArvStream"
.LASF104:
	.string	"buffer"
.LASF92:
	.string	"_IO_codecvt"
.LASF102:
	.string	"_ptr"
.LASF1:
	.string	"long unsigned int"
.LASF42:
	.string	"G_CONNECT_SWAPPED"
.LASF72:
	.string	"_IO_save_end"
.LASF20:
	.string	"double"
.LASF13:
	.string	"__off64_t"
.LASF11:
	.string	"gsize"
.LASF12:
	.string	"__off_t"
.LASF74:
	.string	"_chain"
.LASF37:
	.string	"GTypeInstance"
.LASF93:
	.string	"_IO_wide_data"
.LASF9:
	.string	"guint32"
.LASF31:
	.string	"_GMainLoop"
.LASF71:
	.string	"_IO_backup_base"
.LASF113:
	.string	"ACQ_Init_stream"
.LASF45:
	.string	"_GObject"
.LASF76:
	.string	"_flags2"
.LASF88:
	.string	"_mode"
.LASF64:
	.string	"_IO_read_base"
.LASF101:
	.string	"app_data"
.LASF105:
	.string	"fileName"
.LASF46:
	.string	"g_type_instance"
.LASF79:
	.string	"_vtable_offset"
.LASF50:
	.string	"ARV_ACQUISITION_MODE_SINGLE_FRAME"
.LASF97:
	.string	"error"
.LASF70:
	.string	"_IO_save_base"
.LASF38:
	.string	"_GTypeInstance"
.LASF75:
	.string	"_fileno"
.LASF90:
	.string	"FILE"
.LASF109:
	.string	"GNU C17 10.2.1 20210110 -mtune=generic -march=x86-64 -ggdb -O0 -fasynchronous-unwind-tables"
.LASF10:
	.string	"unsigned int"
.LASF51:
	.string	"ARV_ACQUISITION_MODE_MULTI_FRAME"
.LASF100:
	.string	"payload"
.LASF112:
	.string	"_IO_lock_t"
.LASF52:
	.string	"ArvPixelFormat"
	.ident	"GCC: (Debian 10.2.1-6) 10.2.1 20210110"
	.section	.note.GNU-stack,"",@progbits
