#line 1 "C:/Users/USER/Desktop/QuizCevaplar/Quiz2_Cevap1/Quiz2_Cevap1.c"




sbit LCD_RS at GPIOE_ODR.B8;
sbit LCD_EN at GPIOE_ODR.B10;
sbit LCD_D4 at GPIOE_ODR.B4;
sbit LCD_D5 at GPIOE_ODR.B5;
sbit LCD_D6 at GPIOE_ODR.B6;
sbit LCD_D7 at GPIOE_ODR.B7;

unsigned long sayi=0;
char txt[12];

void ButonKesme() iv IVT_INT_EXTI0 ics ICS_AUTO{
 EXTI_PR=1;

 sayi=RNG_DR;
 sayi=sayi%6+1;

 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"Sayi Degeri");
 LongWordToStr(sayi,txt);
 Lcd_Out(2,1,txt);
}

void main () {

 GPIO_Digital_Input(&GPIOA_IDR, _GPIO_PINMASK_0);
 GPIO_Digital_Output(&GPIOE_ODR, _GPIO_PINMASK_3);

 RCC_AHB2ENR |= 0x40;
 RNG_CR=0x04;

 SYSCFG_EXTICR1=0;
 EXTI_PR=1;
 EXTI_FTSR=0;
 EXTI_RTSR=1;
 EXTI_EMR=0;
 EXTI_IMR=1;
 NVIC_IntEnable(IVT_INT_EXTI0);

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);

 while(1);
}
