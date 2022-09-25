#line 1 "C:/Users/rabiu/OneDrive/Desktop/microcontroller4-2/test.c"
void main() {
 TRISB = 0x00;

 while(1) {

 PORTB = 0XFF;
 delay_ms(100);
 PORTB = 0x00;
 delay_ms(100);
 }

}
