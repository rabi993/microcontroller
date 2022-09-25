void main() {
 TRISB = 0x00;  //PORTB as output (all the 6 pin)

 while(1) {

 PORTB = 0XFF;    //On ; non case-sensetative;   portb = 0xff;
 delay_ms(100);  //wait for 1 second
 PORTB = 0x00;   // Off;
 delay_ms(100); //wait for 1 second
 }

}