int duty;
void main() {

    TRISB = 0x00;        //Set portB as output
    PORTB = 0x00;        //PortB initialization

    TRISC = 0x00;       //Set portC as output
    PORTC = 0x00;       //Portc initialization

    TRISD = 0xff;       //Set portC as intput

    PWM1_Init(2000);    // Initialize PWM1 module at 5KHz
    duty = 0;

    PWM1_Start();                       // start PWM1
    PWM1_Set_Duty(duty);        // Set current duty for PWM1
    portc.f2=1;
    portc.f1=1;
    portb.f0=1;
    portb.f1=0;

    while(1)
    {
         if(portd.f0==1)
         {
             delay_ms(100);
             if(portd.f0==1)
             {
                  if(duty<=240)
                     duty=duty+10;
                  PWM1_Set_Duty(duty);        // Set current duty for PWM1
             }
         }
         if(portd.f1==1)
         {
             delay_ms(100);
             if(portd.f1==1)
             {
                  if(duty>=10)
                     duty=duty-10;
                  PWM1_Set_duty(duty);
             }
         }

    }
}