_ButonKesme:
;Quiz2_Cevap1.c,15 :: 		void ButonKesme() iv IVT_INT_EXTI0 ics ICS_AUTO{
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Quiz2_Cevap1.c,16 :: 		EXTI_PR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Quiz2_Cevap1.c,18 :: 		sayi=RNG_DR;    //RNG_DR registerýný sayi deðiþkenine yükle
MOVW	R0, #lo_addr(RNG_DR+0)
MOVT	R0, #hi_addr(RNG_DR+0)
LDR	R0, [R0, #0]
MOVW	R3, #lo_addr(_sayi+0)
MOVT	R3, #hi_addr(_sayi+0)
STR	R0, [R3, #0]
;Quiz2_Cevap1.c,19 :: 		sayi=sayi%6+1;
MOV	R0, R3
LDR	R2, [R0, #0]
MOVS	R1, #6
UDIV	R0, R2, R1
MLS	R0, R1, R0, R2
ADDS	R0, R0, #1
STR	R0, [R3, #0]
;Quiz2_Cevap1.c,21 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Quiz2_Cevap1.c,22 :: 		Lcd_Out(1,1,"Sayi Degeri");
MOVW	R0, #lo_addr(?lstr1_Quiz2_Cevap1+0)
MOVT	R0, #hi_addr(?lstr1_Quiz2_Cevap1+0)
MOV	R2, R0
MOVS	R1, #1
MOVS	R0, #1
BL	_Lcd_Out+0
;Quiz2_Cevap1.c,23 :: 		LongWordToStr(sayi,txt);
MOVW	R0, #lo_addr(_sayi+0)
MOVT	R0, #hi_addr(_sayi+0)
LDR	R0, [R0, #0]
MOVW	R1, #lo_addr(_txt+0)
MOVT	R1, #hi_addr(_txt+0)
BL	_LongWordToStr+0
;Quiz2_Cevap1.c,24 :: 		Lcd_Out(2,1,txt);
MOVW	R2, #lo_addr(_txt+0)
MOVT	R2, #hi_addr(_txt+0)
MOVS	R1, #1
MOVS	R0, #2
BL	_Lcd_Out+0
;Quiz2_Cevap1.c,25 :: 		}
L_end_ButonKesme:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _ButonKesme
_main:
;Quiz2_Cevap1.c,27 :: 		void main () {
;Quiz2_Cevap1.c,29 :: 		GPIO_Digital_Input(&GPIOA_IDR,  _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;Quiz2_Cevap1.c,30 :: 		GPIO_Digital_Output(&GPIOE_ODR, _GPIO_PINMASK_3);    //ChipSelect
MOVW	R1, #8
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
BL	_GPIO_Digital_Output+0
;Quiz2_Cevap1.c,32 :: 		RCC_AHB2ENR |= 0x40;
MOVW	R0, #lo_addr(RCC_AHB2ENR+0)
MOVT	R0, #hi_addr(RCC_AHB2ENR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, #64
MOVW	R0, #lo_addr(RCC_AHB2ENR+0)
MOVT	R0, #hi_addr(RCC_AHB2ENR+0)
STR	R1, [R0, #0]
;Quiz2_Cevap1.c,33 :: 		RNG_CR=0x04;
MOVS	R1, #4
MOVW	R0, #lo_addr(RNG_CR+0)
MOVT	R0, #hi_addr(RNG_CR+0)
STR	R1, [R0, #0]
;Quiz2_Cevap1.c,35 :: 		SYSCFG_EXTICR1=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(SYSCFG_EXTICR1+0)
MOVT	R0, #hi_addr(SYSCFG_EXTICR1+0)
STR	R1, [R0, #0]
;Quiz2_Cevap1.c,36 :: 		EXTI_PR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(EXTI_PR+0)
MOVT	R0, #hi_addr(EXTI_PR+0)
STR	R1, [R0, #0]
;Quiz2_Cevap1.c,37 :: 		EXTI_FTSR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(EXTI_FTSR+0)
MOVT	R0, #hi_addr(EXTI_FTSR+0)
STR	R1, [R0, #0]
;Quiz2_Cevap1.c,38 :: 		EXTI_RTSR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(EXTI_RTSR+0)
MOVT	R0, #hi_addr(EXTI_RTSR+0)
STR	R1, [R0, #0]
;Quiz2_Cevap1.c,39 :: 		EXTI_EMR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(EXTI_EMR+0)
MOVT	R0, #hi_addr(EXTI_EMR+0)
STR	R1, [R0, #0]
;Quiz2_Cevap1.c,40 :: 		EXTI_IMR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(EXTI_IMR+0)
MOVT	R0, #hi_addr(EXTI_IMR+0)
STR	R1, [R0, #0]
;Quiz2_Cevap1.c,41 :: 		NVIC_IntEnable(IVT_INT_EXTI0);
MOVW	R0, #22
BL	_NVIC_IntEnable+0
;Quiz2_Cevap1.c,43 :: 		Lcd_Init();
BL	_Lcd_Init+0
;Quiz2_Cevap1.c,44 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
MOVS	R0, #12
BL	_Lcd_Cmd+0
;Quiz2_Cevap1.c,45 :: 		Lcd_Cmd(_LCD_CLEAR);
MOVS	R0, #1
BL	_Lcd_Cmd+0
;Quiz2_Cevap1.c,47 :: 		while(1);
L_main0:
IT	AL
BAL	L_main0
;Quiz2_Cevap1.c,48 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
