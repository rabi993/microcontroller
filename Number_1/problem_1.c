//problem 1
char array[]= {0xC0, 0xF9, 0xA4, 0xB0, 0x99, 0x92, 0x82, 0xF8, 0x80, 0x90};
int  i=0, k=0, m=0, n=0, x=0, y=0, chk=0, leftDigit, rightDigit, mode_bit=0;
void digit_display(int left, int right)
{
    portc.f0=1;
    portb=array[left];
    delay_ms(10);
    portc.f0=0;

    portc.f1=1;
    portb=array[right];
    delay_ms(10);
    portc.f1=0;
}
void main()
{
    TRISB = 0x00;
    portb = 0x00;

    TRISC = 0x00;
    portc = 0x00;

    TRISD = 0xff;

    TRISE = 0x00;
    porte = 0x00;

    while(1)
    {
        if(portd.f0==1)
        {
            mode_bit = 0;
            porte.f0 = 0;
            if(i<100 && i>=0)
            {
                leftDigit = i/10;
                rightDigit = i%10;
            }
            digit_display(leftDigit, rightDigit);
            for(k=0; k<10; k++)
            {
                if(portd.f6 == 1)
                {
                    delay_ms(115);
                    if(portd.f6 == 1)
                        i++;
                    digit_display(leftDigit, rightDigit);
                }
                if(portd.f7 == 1)
                {
                    delay_ms(115);
                    if(portd.f7 == 1)
                        i--;
                    digit_display(leftDigit, rightDigit);
                }
            }
            if(mode_bit == 0)
                x=i, m=i;
            delay_ms(10);
            chk=x;
        }

        else
        {

            mode_bit = 1;

            if(y<100 && y>=0)
            {
                leftDigit = y/10;
                rightDigit = y%10;
            }
            digit_display(leftDigit, rightDigit);
            for(k=0; k<10; k++)
            {

                if(portd.f6 == 1)
                {
                    delay_ms(115);
                    if(portd.f6 == 1)
                        y++;
                    digit_display(leftDigit, rightDigit);
                }
                if(portd.f7 == 1)
                {
                    delay_ms(115);
                    if(portd.f7 == 1)
                        y--;
                    digit_display(leftDigit, rightDigit);
                }
            }

            if(mode_bit == 1)
                m=y, n=y;

            if(m==chk)
            {
                porte.f0 = 0;
                porte.f1 = 1;
                delay_ms(2000);
                porte.f1 = 0;
                porte.f2 = 1;
                delay_ms(2000);
                porte.f2 = 0;
                porte.f0 = 1;

            }
        }
    }
}