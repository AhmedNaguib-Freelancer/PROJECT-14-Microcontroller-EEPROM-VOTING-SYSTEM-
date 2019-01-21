
_main:

;EEPROM.c,18 :: 		void main() {
;EEPROM.c,19 :: 		unsigned short a=0, b=0, c=0, d=0;
	CLRF       main_a_L0+0
	CLRF       main_b_L0+0
	CLRF       main_c_L0+0
	CLRF       main_d_L0+0
;EEPROM.c,22 :: 		TRISD=1;
	MOVLW      1
	MOVWF      TRISD+0
;EEPROM.c,23 :: 		PORTD=0;
	CLRF       PORTD+0
;EEPROM.c,26 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;EEPROM.c,27 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,28 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,29 :: 		Lcd_Out(1,1,"HELLO EveryVoter");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,30 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;EEPROM.c,31 :: 		if (PORTD.F0==1)                                // start
	BTFSS      PORTD+0, 0
	GOTO       L_main3
;EEPROM.c,34 :: 		}
L_main3:
;EEPROM.c,35 :: 		while (PORTD==0)
L_main4:
	MOVF       PORTD+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_main5
;EEPROM.c,37 :: 		}
	GOTO       L_main4
L_main5:
;EEPROM.c,38 :: 		while (e=1)
L_main6:
;EEPROM.c,40 :: 		if (PORTD.F0==1)
	BTFSS      PORTD+0, 0
	GOTO       L_main8
;EEPROM.c,42 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,43 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,44 :: 		Lcd_Out(1,5,"START VOTING");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,45 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
;EEPROM.c,46 :: 		}
L_main8:
;EEPROM.c,47 :: 		if (PORTD.F1==1)                            //voter1
	BTFSS      PORTD+0, 1
	GOTO       L_main10
;EEPROM.c,49 :: 		a++;
	INCF       main_a_L0+0, 1
;EEPROM.c,51 :: 		eeprom_write(0x12,a);
	MOVLW      18
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       main_a_L0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;EEPROM.c,52 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,53 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,54 :: 		Lcd_Out(1,5,"success");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,55 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main11:
	DECFSZ     R13+0, 1
	GOTO       L_main11
	DECFSZ     R12+0, 1
	GOTO       L_main11
	DECFSZ     R11+0, 1
	GOTO       L_main11
	NOP
;EEPROM.c,56 :: 		}
L_main10:
;EEPROM.c,57 :: 		if (PORTD.F2==1)                            //voter2
	BTFSS      PORTD+0, 2
	GOTO       L_main12
;EEPROM.c,59 :: 		b++;
	INCF       main_b_L0+0, 1
;EEPROM.c,61 :: 		eeprom_write(0x23,b);
	MOVLW      35
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       main_b_L0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;EEPROM.c,62 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,63 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,64 :: 		Lcd_Out(1,5,"success2");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,65 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main13:
	DECFSZ     R13+0, 1
	GOTO       L_main13
	DECFSZ     R12+0, 1
	GOTO       L_main13
	DECFSZ     R11+0, 1
	GOTO       L_main13
	NOP
;EEPROM.c,66 :: 		}
L_main12:
;EEPROM.c,67 :: 		if (PORTD.F3==1)                            //voter3
	BTFSS      PORTD+0, 3
	GOTO       L_main14
;EEPROM.c,69 :: 		c++;
	INCF       main_c_L0+0, 1
;EEPROM.c,71 :: 		eeprom_write(0x34,c);
	MOVLW      52
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       main_c_L0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;EEPROM.c,72 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,73 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,74 :: 		Lcd_Out(1,5,"success");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr5_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,75 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main15:
	DECFSZ     R13+0, 1
	GOTO       L_main15
	DECFSZ     R12+0, 1
	GOTO       L_main15
	DECFSZ     R11+0, 1
	GOTO       L_main15
	NOP
;EEPROM.c,76 :: 		}
L_main14:
;EEPROM.c,77 :: 		if (PORTD.F4 ==1)                            //voter4
	BTFSS      PORTD+0, 4
	GOTO       L_main16
;EEPROM.c,79 :: 		d++;
	INCF       main_d_L0+0, 1
;EEPROM.c,81 :: 		eeprom_write(0x45,d);
	MOVLW      69
	MOVWF      FARG_EEPROM_Write_Address+0
	MOVF       main_d_L0+0, 0
	MOVWF      FARG_EEPROM_Write_data_+0
	CALL       _EEPROM_Write+0
;EEPROM.c,82 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,83 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,84 :: 		Lcd_Out(1,5,"success");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr6_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,85 :: 		Delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main17:
	DECFSZ     R13+0, 1
	GOTO       L_main17
	DECFSZ     R12+0, 1
	GOTO       L_main17
	DECFSZ     R11+0, 1
	GOTO       L_main17
	NOP
;EEPROM.c,86 :: 		}
L_main16:
;EEPROM.c,87 :: 		if (PORTD.F5==1)
	BTFSS      PORTD+0, 5
	GOTO       L_main18
;EEPROM.c,89 :: 		a=eeprom_read(0x12);
	MOVLW      18
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      main_a_L0+0
;EEPROM.c,90 :: 		b=eeprom_read(0x23);
	MOVLW      35
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      main_b_L0+0
;EEPROM.c,91 :: 		c=eeprom_read(0x34);
	MOVLW      52
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      main_c_L0+0
;EEPROM.c,92 :: 		d=eeprom_read(0x45);
	MOVLW      69
	MOVWF      FARG_EEPROM_Read_Address+0
	CALL       _EEPROM_Read+0
	MOVF       R0+0, 0
	MOVWF      main_d_L0+0
;EEPROM.c,93 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,94 :: 		inttostr(a,txt);
	MOVF       main_a_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	CLRF       FARG_IntToStr_input+1
	MOVLW      main_txt_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;EEPROM.c,95 :: 		inttostr(b,txt1);
	MOVF       main_b_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	CLRF       FARG_IntToStr_input+1
	MOVLW      main_txt1_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;EEPROM.c,96 :: 		inttostr(c,txt2);
	MOVF       main_c_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	CLRF       FARG_IntToStr_input+1
	MOVLW      main_txt2_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;EEPROM.c,97 :: 		inttostr(d,txt3);
	MOVF       main_d_L0+0, 0
	MOVWF      FARG_IntToStr_input+0
	CLRF       FARG_IntToStr_input+1
	MOVLW      main_txt3_L0+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;EEPROM.c,98 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
;EEPROM.c,99 :: 		lcd_out(1,1,"1:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr7_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,100 :: 		lcd_out(1,4,"txt");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr8_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,101 :: 		lcd_out(2,1,"2:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr9_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,102 :: 		lcd_out(2,4,"txt1");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,103 :: 		delay_ms(2000),
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
;EEPROM.c,104 :: 		lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;EEPROM.c,105 :: 		lcd_out(1,1,"3:");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,106 :: 		lcd_out(1,4,"txt2");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr12_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,107 :: 		lcd_out(2,1,"4:");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr13_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,108 :: 		lcd_out(2,4,"txt3");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr14_EEPROM+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;EEPROM.c,109 :: 		delay_ms(2000);
	MOVLW      21
	MOVWF      R11+0
	MOVLW      75
	MOVWF      R12+0
	MOVLW      190
	MOVWF      R13+0
L_main21:
	DECFSZ     R13+0, 1
	GOTO       L_main21
	DECFSZ     R12+0, 1
	GOTO       L_main21
	DECFSZ     R11+0, 1
	GOTO       L_main21
	NOP
;EEPROM.c,110 :: 		}
L_main18:
;EEPROM.c,111 :: 		}
	GOTO       L_main6
;EEPROM.c,113 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
