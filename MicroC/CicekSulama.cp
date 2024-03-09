#line 1 "C:/Users/Huawei/OneDrive/Masaüstü/MicroC/CicekSulama.c"
 sbit LCD_RS at RD0_bit;
 sbit LCD_EN at RD1_bit;
 sbit LCD_D4 at RD2_bit;
 sbit LCD_D5 at RD3_bit;
 sbit LCD_D6 at RD4_bit;
 sbit LCD_D7 at RD5_bit;
 sbit LCD_RS_Direction at TRISD0_bit;
 sbit LCD_EN_Direction at TRISD1_bit;
 sbit LCD_D4_Direction at TRISD2_bit;
 sbit LCD_D5_Direction at TRISD3_bit;
 sbit LCD_D6_Direction at TRISD4_bit;
 sbit LCD_D7_Direction at TRISD5_bit;

 char txt[7];

void main() {

 unsigned int kapA, kapB, toprak,ED,x;
 kapA = 0;
 kapB = 0;
 toprak = 0;
 ED = 0;
 x= 0;


 ANSEL = 0b0000011;
 ANSELH = 0;


 TRISC = 0x00;
 PORTC = 0x00;

 TRISE.B1 = 0;
 PORTE.B1 = 0;

 TRISE.B2 = 0;
 PORTE.B2 = 0;


 TRISB = 0b00010100;
 T1CON = 0x10;

 ADC_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);

 Lcd_Out(1, 1, " Akilli Sulama ");
 Lcd_Out(2, 4, " Sistemi ");
 delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);


 while(1) {


 ED = Adc_Read(1);
 ED = ED /10-2;

 if(ED == -2){
 ED = 0;
 }
 InttoStr(ED,txt);
 Lcd_Out(1,1,"Esik Deger: ");
 Lcd_Out(2,5,txt);
 delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);



 toprak = Adc_Read(0);
 toprak = toprak/10;
 if(toprak > 100){

 toprak = 100;

 }

 if(toprak<0){

 toprak =0;

 }

 InttoStr(toprak,txt);
 Lcd_Out(1,1,"Toprak nemi: ");
 Lcd_Out(2,5,txt);
 delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);

 TMR1H = 0;
 TMR1L = 0;

 PORTB.F1 = 1;
 Delay_us(10);
 PORTB.F1 = 0;

 while(!PORTB.F2);
 T1CON.F0 = 1;
 while(PORTB.F2);
 T1CON.F0 = 0;

 kapB = (TMR1L | (TMR1H<<8));
 kapB = kapB/80;

 if(kapB>100){
 kapB = 100;
 }

 if(kapB<0){
 kapB = 0 ;
 }

 if(kapB == 0){
 PORTE.B2 = 1;
 }

 InttoStr(kapB,txt);
 Lcd_Out(1,1," B kabi degeri: ");
 Lcd_Out(2,5,txt);
 delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);




 TMR1H = 0;
 TMR1L = 0;

 PORTB.F0 = 1;
 Delay_us(10);
 PORTB.F0 = 0;

 while(!PORTB.F4);
 T1CON.F0 = 1;
 while(PORTB.F4);
 T1CON.F0 = 0;

 kapA = (TMR1L | (TMR1H<<8));
 kapA = kapA/80;

 if(kapA == 101){

 kapA = 100;
 }

 if(kapA == 102 || kapA == 0){

 kapA = 0;
 PORTE.B1 = 1;
 }

 InttoStr(kapA,txt);
 Lcd_Out(1,1," A kabi degeri: ");
 Lcd_Out(2,5,txt);
 delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);




 if(toprak < ED) {

 if(kapA ==0 && kapB == 0){
 continue;
 }

 if(kapA == 0){

 Lcd_Out(1,1,"Toprak kuru");
 Lcd_Out(2,1,"Motor Acik");
 PORTC = 0b11110111;
 delay_ms(300);
 PORTC = 0b00000000;
 Lcd_Cmd(_LCD_CLEAR);
 kapB = kapB - ((ED - toprak) + 5);
 toprak = ED + 5 ;

 if(toprak >100){
 toprak = 100;

 }

 if(kapB < 0){
 kapA = 0;

 }

 InttoStr(toprak,txt);
 Lcd_Out(1,1,"Toprak nemi: ");
 Lcd_Out(2,5,txt);
 delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);

 InttoStr(kapB,txt);
 Lcd_Out(1,1," B kabi degeri: ");
 Lcd_Out(2,5,txt);
 delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);


 continue;

 }

 Lcd_Out(1,1,"Toprak kuru");
 Lcd_Out(2,1,"Motor Acik");
 PORTC = 0b11111101;
 delay_ms(300);
 PORTC = 0b00000000;
 Lcd_Cmd(_LCD_CLEAR);
 kapA = kapA - ((ED - toprak) + 5);
 toprak = ED + 5 ;

 if(toprak >100){
 toprak = 100;

 }

 if(kapA<0){
 kapA = 0;

 }


 InttoStr(toprak,txt);
 Lcd_Out(1,1,"Toprak nemi: ");
 Lcd_Out(2,5,txt);
 delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);

 InttoStr(kapA,txt);
 Lcd_Out(1,1," A kabi degeri: ");
 Lcd_Out(2,5,txt);
 delay_ms(100);
 Lcd_Cmd(_LCD_CLEAR);


 }





 }
}
