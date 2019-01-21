#line 1 "C:/Users/only try/Desktop/PROJECT 14 Microcontroller (EEPROM)/PROGRAM/EEPROM.c"

sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;



void main() {
 unsigned short a=0, b=0, c=0, d=0;
 int e=0;
 char txt[7], txt1[7], txt2[7], txt3[7];
 TRISD=1;
 PORTD=0;
 while(1)
 {
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,1,"HELLO EveryVoter");
 Delay_ms(2000);
 if (PORTD.F0==1)
 {
 e=1;
 }
 while (PORTD==0)
 {
 }
 while (e=1)
 {
 if (PORTD.F0==1)
 {
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,5,"START VOTING");
 Delay_ms(2000);
 }
 if (PORTD.F1==1)
 {
 a++;
 e=0;
 eeprom_write(0x12,a);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,5,"success");
 Delay_ms(2000);
 }
 if (PORTD.F2==1)
 {
 b++;
 e=0;
 eeprom_write(0x23,b);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,5,"success2");
 Delay_ms(2000);
 }
 if (PORTD.F3==1)
 {
 c++;
 e=0;
 eeprom_write(0x34,c);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,5,"success");
 Delay_ms(2000);
 }
 if (PORTD.F4 ==1)
 {
 d++;
 e=0;
 eeprom_write(0x45,d);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Out(1,5,"success");
 Delay_ms(2000);
 }
 if (PORTD.F5==1)
 {
 a=eeprom_read(0x12);
 b=eeprom_read(0x23);
 c=eeprom_read(0x34);
 d=eeprom_read(0x45);
 Lcd_Cmd(_LCD_CLEAR);
 inttostr(a,txt);
 inttostr(b,txt1);
 inttostr(c,txt2);
 inttostr(d,txt3);
 delay_ms(500);
 lcd_out(1,1,"1:");
 lcd_out(1,4,"txt");
 lcd_out(2,1,"2:");
 lcd_out(2,4,"txt1");
 delay_ms(2000),
 lcd_Cmd(_LCD_CLEAR);
 lcd_out(1,1,"3:");
 lcd_out(1,4,"txt2");
 lcd_out(2,1,"4:");
 lcd_out(2,4,"txt3");
 delay_ms(2000);
 }
 }
 }
}
