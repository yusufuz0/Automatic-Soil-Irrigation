
_main:

;CicekSulama.c,16 :: 		void main() {
;CicekSulama.c,19 :: 		kapA = 0;
	CLRF       main_kapA_L0+0
	CLRF       main_kapA_L0+1
;CicekSulama.c,20 :: 		kapB = 0;
	CLRF       main_kapB_L0+0
	CLRF       main_kapB_L0+1
;CicekSulama.c,21 :: 		toprak = 0;
	CLRF       main_toprak_L0+0
	CLRF       main_toprak_L0+1
;CicekSulama.c,22 :: 		ED = 0;
	CLRF       main_ED_L0+0
	CLRF       main_ED_L0+1
;CicekSulama.c,26 :: 		ANSEL = 0b0000011;
	MOVLW      3
	MOVWF      ANSEL+0
;CicekSulama.c,27 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;CicekSulama.c,30 :: 		TRISC = 0x00;
	CLRF       TRISC+0
;CicekSulama.c,31 :: 		PORTC = 0x00;
	CLRF       PORTC+0
;CicekSulama.c,33 :: 		TRISE.B1 = 0;
	BCF        TRISE+0, 1
;CicekSulama.c,34 :: 		PORTE.B1 = 0;
	BCF        PORTE+0, 1
;CicekSulama.c,36 :: 		TRISE.B2 = 0;
	BCF        TRISE+0, 2
;CicekSulama.c,37 :: 		PORTE.B2 = 0;
	BCF        PORTE+0, 2
;CicekSulama.c,40 :: 		TRISB = 0b00010100;
	MOVLW      20
	MOVWF      TRISB+0
;CicekSulama.c,41 :: 		T1CON = 0x10;
	MOVLW      16
	MOVWF      T1CON+0
;CicekSulama.c,43 :: 		ADC_Init();
	CALL       _ADC_Init+0
;CicekSulama.c,44 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;CicekSulama.c,45 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CicekSulama.c,46 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CicekSulama.c,48 :: 		Lcd_Out(1, 1, " Akilli Sulama ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,49 :: 		Lcd_Out(2, 4, " Sistemi ");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,50 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;CicekSulama.c,51 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CicekSulama.c,54 :: 		while(1) {
L_main1:
;CicekSulama.c,57 :: 		ED = Adc_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      main_ED_L0+0
	MOVF       R0+1, 0
	MOVWF      main_ED_L0+1
;CicekSulama.c,58 :: 		ED = ED /10-2;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVLW      2
	SUBWF      R0+0, 0
	MOVWF      R2+0
	MOVLW      0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      R0+1, 0
	MOVWF      R2+1
	MOVF       R2+0, 0
	MOVWF      main_ED_L0+0
	MOVF       R2+1, 0
	MOVWF      main_ED_L0+1
;CicekSulama.c,60 :: 		if(ED == -2){
	MOVLW      255
	XORWF      R2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main45
	MOVLW      254
	XORWF      R2+0, 0
L__main45:
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;CicekSulama.c,61 :: 		ED = 0;
	CLRF       main_ED_L0+0
	CLRF       main_ED_L0+1
;CicekSulama.c,62 :: 		}
L_main3:
;CicekSulama.c,63 :: 		InttoStr(ED,txt);
	MOVF       main_ED_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_ED_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;CicekSulama.c,64 :: 		Lcd_Out(1,1,"Esik Deger: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,65 :: 		Lcd_Out(2,5,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,66 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
;CicekSulama.c,67 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CicekSulama.c,71 :: 		toprak = Adc_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      main_toprak_L0+0
	MOVF       R0+1, 0
	MOVWF      main_toprak_L0+1
;CicekSulama.c,72 :: 		toprak = toprak/10;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      main_toprak_L0+0
	MOVF       R0+1, 0
	MOVWF      main_toprak_L0+1
;CicekSulama.c,73 :: 		if(toprak > 100){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main46
	MOVF       R0+0, 0
	SUBLW      100
L__main46:
	BTFSC      STATUS+0, 0
	GOTO       L_main5
;CicekSulama.c,75 :: 		toprak = 100;
	MOVLW      100
	MOVWF      main_toprak_L0+0
	MOVLW      0
	MOVWF      main_toprak_L0+1
;CicekSulama.c,77 :: 		}
L_main5:
;CicekSulama.c,79 :: 		if(toprak<0){
	MOVLW      0
	SUBWF      main_toprak_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main47
	MOVLW      0
	SUBWF      main_toprak_L0+0, 0
L__main47:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;CicekSulama.c,81 :: 		toprak =0;
	CLRF       main_toprak_L0+0
	CLRF       main_toprak_L0+1
;CicekSulama.c,83 :: 		}
L_main6:
;CicekSulama.c,85 :: 		InttoStr(toprak,txt);
	MOVF       main_toprak_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_toprak_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;CicekSulama.c,86 :: 		Lcd_Out(1,1,"Toprak nemi: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,87 :: 		Lcd_Out(2,5,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,88 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	DECFSZ     R11+0, 1
	GOTO       L_main7
	NOP
;CicekSulama.c,89 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CicekSulama.c,91 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;CicekSulama.c,92 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;CicekSulama.c,94 :: 		PORTB.F1 = 1;
	BSF        PORTB+0, 1
;CicekSulama.c,95 :: 		Delay_us(10);
	MOVLW      6
	MOVWF      R13+0
L_main8:
	DECFSZ     R13+0, 1
	GOTO       L_main8
	NOP
;CicekSulama.c,96 :: 		PORTB.F1 = 0;
	BCF        PORTB+0, 1
;CicekSulama.c,98 :: 		while(!PORTB.F2);
L_main9:
	BTFSC      PORTB+0, 2
	GOTO       L_main10
	GOTO       L_main9
L_main10:
;CicekSulama.c,99 :: 		T1CON.F0 = 1;
	BSF        T1CON+0, 0
;CicekSulama.c,100 :: 		while(PORTB.F2);
L_main11:
	BTFSS      PORTB+0, 2
	GOTO       L_main12
	GOTO       L_main11
L_main12:
;CicekSulama.c,101 :: 		T1CON.F0 = 0;
	BCF        T1CON+0, 0
;CicekSulama.c,103 :: 		kapB = (TMR1L | (TMR1H<<8));
	MOVF       TMR1H+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       TMR1L+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      main_kapB_L0+0
	MOVF       R0+1, 0
	MOVWF      main_kapB_L0+1
;CicekSulama.c,104 :: 		kapB = kapB/80;
	MOVLW      80
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      main_kapB_L0+0
	MOVF       R0+1, 0
	MOVWF      main_kapB_L0+1
;CicekSulama.c,106 :: 		if(kapB>100){
	MOVF       R0+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main48
	MOVF       R0+0, 0
	SUBLW      100
L__main48:
	BTFSC      STATUS+0, 0
	GOTO       L_main13
;CicekSulama.c,107 :: 		kapB = 100;
	MOVLW      100
	MOVWF      main_kapB_L0+0
	MOVLW      0
	MOVWF      main_kapB_L0+1
;CicekSulama.c,108 :: 		}
L_main13:
;CicekSulama.c,110 :: 		if(kapB<0){
	MOVLW      0
	SUBWF      main_kapB_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main49
	MOVLW      0
	SUBWF      main_kapB_L0+0, 0
L__main49:
	BTFSC      STATUS+0, 0
	GOTO       L_main14
;CicekSulama.c,111 :: 		kapB = 0 ;
	CLRF       main_kapB_L0+0
	CLRF       main_kapB_L0+1
;CicekSulama.c,112 :: 		}
L_main14:
;CicekSulama.c,114 :: 		if(kapB == 0){
	MOVLW      0
	XORWF      main_kapB_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main50
	MOVLW      0
	XORWF      main_kapB_L0+0, 0
L__main50:
	BTFSS      STATUS+0, 2
	GOTO       L_main15
;CicekSulama.c,115 :: 		PORTE.B2 = 1;
	BSF        PORTE+0, 2
;CicekSulama.c,116 :: 		}
L_main15:
;CicekSulama.c,118 :: 		InttoStr(kapB,txt);
	MOVF       main_kapB_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_kapB_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;CicekSulama.c,119 :: 		Lcd_Out(1,1," B kabi degeri: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,120 :: 		Lcd_Out(2,5,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,121 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main16:
	DECFSZ     R13+0, 1
	GOTO       L_main16
	DECFSZ     R12+0, 1
	GOTO       L_main16
	DECFSZ     R11+0, 1
	GOTO       L_main16
	NOP
;CicekSulama.c,122 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CicekSulama.c,127 :: 		TMR1H = 0;
	CLRF       TMR1H+0
;CicekSulama.c,128 :: 		TMR1L = 0;
	CLRF       TMR1L+0
;CicekSulama.c,130 :: 		PORTB.F0 = 1;
	BSF        PORTB+0, 0
;CicekSulama.c,131 :: 		Delay_us(10);
	MOVLW      6
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	NOP
;CicekSulama.c,132 :: 		PORTB.F0 = 0;
	BCF        PORTB+0, 0
;CicekSulama.c,134 :: 		while(!PORTB.F4);
L_main18:
	BTFSC      PORTB+0, 4
	GOTO       L_main19
	GOTO       L_main18
L_main19:
;CicekSulama.c,135 :: 		T1CON.F0 = 1;
	BSF        T1CON+0, 0
;CicekSulama.c,136 :: 		while(PORTB.F4);
L_main20:
	BTFSS      PORTB+0, 4
	GOTO       L_main21
	GOTO       L_main20
L_main21:
;CicekSulama.c,137 :: 		T1CON.F0 = 0;
	BCF        T1CON+0, 0
;CicekSulama.c,139 :: 		kapA = (TMR1L | (TMR1H<<8));
	MOVF       TMR1H+0, 0
	MOVWF      R0+1
	CLRF       R0+0
	MOVF       TMR1L+0, 0
	IORWF      R0+0, 1
	MOVLW      0
	IORWF      R0+1, 1
	MOVF       R0+0, 0
	MOVWF      main_kapA_L0+0
	MOVF       R0+1, 0
	MOVWF      main_kapA_L0+1
;CicekSulama.c,140 :: 		kapA = kapA/80;
	MOVLW      80
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16X16_U+0
	MOVF       R0+0, 0
	MOVWF      main_kapA_L0+0
	MOVF       R0+1, 0
	MOVWF      main_kapA_L0+1
;CicekSulama.c,142 :: 		if(kapA == 101){
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main51
	MOVLW      101
	XORWF      R0+0, 0
L__main51:
	BTFSS      STATUS+0, 2
	GOTO       L_main22
;CicekSulama.c,144 :: 		kapA = 100;
	MOVLW      100
	MOVWF      main_kapA_L0+0
	MOVLW      0
	MOVWF      main_kapA_L0+1
;CicekSulama.c,145 :: 		}
L_main22:
;CicekSulama.c,147 :: 		if(kapA == 102 || kapA == 0){
	MOVLW      0
	XORWF      main_kapA_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main52
	MOVLW      102
	XORWF      main_kapA_L0+0, 0
L__main52:
	BTFSC      STATUS+0, 2
	GOTO       L__main43
	MOVLW      0
	XORWF      main_kapA_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main53
	MOVLW      0
	XORWF      main_kapA_L0+0, 0
L__main53:
	BTFSC      STATUS+0, 2
	GOTO       L__main43
	GOTO       L_main25
L__main43:
;CicekSulama.c,149 :: 		kapA = 0;
	CLRF       main_kapA_L0+0
	CLRF       main_kapA_L0+1
;CicekSulama.c,150 :: 		PORTE.B1 = 1;
	BSF        PORTE+0, 1
;CicekSulama.c,151 :: 		}
L_main25:
;CicekSulama.c,153 :: 		InttoStr(kapA,txt);
	MOVF       main_kapA_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_kapA_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;CicekSulama.c,154 :: 		Lcd_Out(1,1," A kabi degeri: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,155 :: 		Lcd_Out(2,5,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,156 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main26:
	DECFSZ     R13+0, 1
	GOTO       L_main26
	DECFSZ     R12+0, 1
	GOTO       L_main26
	DECFSZ     R11+0, 1
	GOTO       L_main26
	NOP
;CicekSulama.c,157 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CicekSulama.c,162 :: 		if(toprak < ED) {
	MOVF       main_ED_L0+1, 0
	SUBWF      main_toprak_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main54
	MOVF       main_ED_L0+0, 0
	SUBWF      main_toprak_L0+0, 0
L__main54:
	BTFSC      STATUS+0, 0
	GOTO       L_main27
;CicekSulama.c,164 :: 		if(kapA ==0 && kapB == 0){
	MOVLW      0
	XORWF      main_kapA_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main55
	MOVLW      0
	XORWF      main_kapA_L0+0, 0
L__main55:
	BTFSS      STATUS+0, 2
	GOTO       L_main30
	MOVLW      0
	XORWF      main_kapB_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main56
	MOVLW      0
	XORWF      main_kapB_L0+0, 0
L__main56:
	BTFSS      STATUS+0, 2
	GOTO       L_main30
L__main42:
;CicekSulama.c,165 :: 		continue;
	GOTO       L_main1
;CicekSulama.c,166 :: 		}
L_main30:
;CicekSulama.c,168 :: 		if(kapA == 0){
	MOVLW      0
	XORWF      main_kapA_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main57
	MOVLW      0
	XORWF      main_kapA_L0+0, 0
L__main57:
	BTFSS      STATUS+0, 2
	GOTO       L_main31
;CicekSulama.c,170 :: 		Lcd_Out(1,1,"Toprak kuru");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,171 :: 		Lcd_Out(2,1,"Motor Acik");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,172 :: 		PORTC = 0b11110111;
	MOVLW      247
	MOVWF      PORTC+0
;CicekSulama.c,173 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main32:
	DECFSZ     R13+0, 1
	GOTO       L_main32
	DECFSZ     R12+0, 1
	GOTO       L_main32
	DECFSZ     R11+0, 1
	GOTO       L_main32
	NOP
	NOP
;CicekSulama.c,174 :: 		PORTC = 0b00000000;
	CLRF       PORTC+0
;CicekSulama.c,175 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CicekSulama.c,176 :: 		kapB = kapB - ((ED - toprak) + 5);
	MOVF       main_toprak_L0+0, 0
	SUBWF      main_ED_L0+0, 0
	MOVWF      R0+0
	MOVF       main_toprak_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_ED_L0+1, 0
	MOVWF      R0+1
	MOVLW      5
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	SUBWF      main_kapB_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_kapB_L0+1, 1
	MOVF       R0+1, 0
	SUBWF      main_kapB_L0+1, 1
;CicekSulama.c,177 :: 		toprak = ED + 5 ;
	MOVLW      5
	ADDWF      main_ED_L0+0, 0
	MOVWF      R1+0
	MOVF       main_ED_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      main_toprak_L0+0
	MOVF       R1+1, 0
	MOVWF      main_toprak_L0+1
;CicekSulama.c,179 :: 		if(toprak >100){
	MOVF       R1+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main58
	MOVF       R1+0, 0
	SUBLW      100
L__main58:
	BTFSC      STATUS+0, 0
	GOTO       L_main33
;CicekSulama.c,180 :: 		toprak = 100;
	MOVLW      100
	MOVWF      main_toprak_L0+0
	MOVLW      0
	MOVWF      main_toprak_L0+1
;CicekSulama.c,182 :: 		}
L_main33:
;CicekSulama.c,184 :: 		if(kapB < 0){
	MOVLW      0
	SUBWF      main_kapB_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main59
	MOVLW      0
	SUBWF      main_kapB_L0+0, 0
L__main59:
	BTFSC      STATUS+0, 0
	GOTO       L_main34
;CicekSulama.c,185 :: 		kapA = 0;
	CLRF       main_kapA_L0+0
	CLRF       main_kapA_L0+1
;CicekSulama.c,187 :: 		}
L_main34:
;CicekSulama.c,189 :: 		InttoStr(toprak,txt);
	MOVF       main_toprak_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_toprak_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;CicekSulama.c,190 :: 		Lcd_Out(1,1,"Toprak nemi: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,191 :: 		Lcd_Out(2,5,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,192 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main35:
	DECFSZ     R13+0, 1
	GOTO       L_main35
	DECFSZ     R12+0, 1
	GOTO       L_main35
	DECFSZ     R11+0, 1
	GOTO       L_main35
	NOP
;CicekSulama.c,193 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CicekSulama.c,195 :: 		InttoStr(kapB,txt);
	MOVF       main_kapB_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_kapB_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;CicekSulama.c,196 :: 		Lcd_Out(1,1," B kabi degeri: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,197 :: 		Lcd_Out(2,5,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,198 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main36:
	DECFSZ     R13+0, 1
	GOTO       L_main36
	DECFSZ     R12+0, 1
	GOTO       L_main36
	DECFSZ     R11+0, 1
	GOTO       L_main36
	NOP
;CicekSulama.c,199 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CicekSulama.c,202 :: 		continue;
	GOTO       L_main1
;CicekSulama.c,204 :: 		}
L_main31:
;CicekSulama.c,206 :: 		Lcd_Out(1,1,"Toprak kuru");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,207 :: 		Lcd_Out(2,1,"Motor Acik");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,208 :: 		PORTC = 0b11111101;
	MOVLW      253
	MOVWF      PORTC+0
;CicekSulama.c,209 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_main37:
	DECFSZ     R13+0, 1
	GOTO       L_main37
	DECFSZ     R12+0, 1
	GOTO       L_main37
	DECFSZ     R11+0, 1
	GOTO       L_main37
	NOP
	NOP
;CicekSulama.c,210 :: 		PORTC = 0b00000000;
	CLRF       PORTC+0
;CicekSulama.c,211 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CicekSulama.c,212 :: 		kapA = kapA - ((ED - toprak) + 5);
	MOVF       main_toprak_L0+0, 0
	SUBWF      main_ED_L0+0, 0
	MOVWF      R0+0
	MOVF       main_toprak_L0+1, 0
	BTFSS      STATUS+0, 0
	ADDLW      1
	SUBWF      main_ED_L0+1, 0
	MOVWF      R0+1
	MOVLW      5
	ADDWF      R0+0, 1
	BTFSC      STATUS+0, 0
	INCF       R0+1, 1
	MOVF       R0+0, 0
	SUBWF      main_kapA_L0+0, 1
	BTFSS      STATUS+0, 0
	DECF       main_kapA_L0+1, 1
	MOVF       R0+1, 0
	SUBWF      main_kapA_L0+1, 1
;CicekSulama.c,213 :: 		toprak = ED + 5 ;
	MOVLW      5
	ADDWF      main_ED_L0+0, 0
	MOVWF      R1+0
	MOVF       main_ED_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	MOVWF      R1+1
	MOVF       R1+0, 0
	MOVWF      main_toprak_L0+0
	MOVF       R1+1, 0
	MOVWF      main_toprak_L0+1
;CicekSulama.c,215 :: 		if(toprak >100){
	MOVF       R1+1, 0
	SUBLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	MOVF       R1+0, 0
	SUBLW      100
L__main60:
	BTFSC      STATUS+0, 0
	GOTO       L_main38
;CicekSulama.c,216 :: 		toprak = 100;
	MOVLW      100
	MOVWF      main_toprak_L0+0
	MOVLW      0
	MOVWF      main_toprak_L0+1
;CicekSulama.c,218 :: 		}
L_main38:
;CicekSulama.c,220 :: 		if(kapA<0){
	MOVLW      0
	SUBWF      main_kapA_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVLW      0
	SUBWF      main_kapA_L0+0, 0
L__main61:
	BTFSC      STATUS+0, 0
	GOTO       L_main39
;CicekSulama.c,221 :: 		kapA = 0;
	CLRF       main_kapA_L0+0
	CLRF       main_kapA_L0+1
;CicekSulama.c,223 :: 		}
L_main39:
;CicekSulama.c,226 :: 		InttoStr(toprak,txt);
	MOVF       main_toprak_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_toprak_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;CicekSulama.c,227 :: 		Lcd_Out(1,1,"Toprak nemi: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,228 :: 		Lcd_Out(2,5,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,229 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main40:
	DECFSZ     R13+0, 1
	GOTO       L_main40
	DECFSZ     R12+0, 1
	GOTO       L_main40
	DECFSZ     R11+0, 1
	GOTO       L_main40
	NOP
;CicekSulama.c,230 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CicekSulama.c,232 :: 		InttoStr(kapA,txt);
	MOVF       main_kapA_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       main_kapA_L0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;CicekSulama.c,233 :: 		Lcd_Out(1,1," A kabi degeri: ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_CicekSulama+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,234 :: 		Lcd_Out(2,5,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;CicekSulama.c,235 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main41:
	DECFSZ     R13+0, 1
	GOTO       L_main41
	DECFSZ     R12+0, 1
	GOTO       L_main41
	DECFSZ     R11+0, 1
	GOTO       L_main41
	NOP
;CicekSulama.c,236 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;CicekSulama.c,239 :: 		}
L_main27:
;CicekSulama.c,245 :: 		}
	GOTO       L_main1
;CicekSulama.c,246 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
