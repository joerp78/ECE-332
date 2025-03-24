
/* This program demonstrates the use of the D5M camera with the DE1-SoC Board
 * It performs the following: 
 * 	1. Capture one frame of video when any key is pressed.
 * 	2. Display the captured frame when any key is pressed.		  
*/
/* Note: Set the switches SW1 and SW2 to high and rest of the switches to low for correct exposure timing while compiling and the loading the program in the Altera Monitor program.
*/

#include <stdio.h>
#include <time.h>


#define KEY_BASE              0xFF200050
#define VIDEO_IN_BASE         0xFF203060
#define FPGA_ONCHIP_BASE      0xC8000000
#define CHAR_BUFFER_BASE 	  0xC9000000

volatile char *char_buffer = (char *)CHAR_BUFFER_BASE;
volatile int *KEY_ptr = (int *)KEY_BASE;
volatile int *Video_In_DMA_ptr = (int *)VIDEO_IN_BASE;
volatile short *Video_Mem_ptr = (short *)FPGA_ONCHIP_BASE;

void overlay_timestamp(int image_count) {
    time_t now;
    struct tm *time_info;
    char timestamp[20];  
    char image_count_str[10];
	int i; 


    time(&now);
    time_info = localtime(&now);
	time_info->tm_hour = time_info->tm_hour - 4;  
    sprintf(timestamp, "%02d:%02d:%02d", time_info->tm_hour, time_info->tm_min, time_info->tm_sec);

    sprintf(image_count_str, "Image: %d", image_count);


    int row = 5, col = 10;
    volatile char *char_ptr = char_buffer + (row << 7) + col;

    for (i = 0; timestamp[i] != '\0'; i++) {
        *(char_ptr + i) = timestamp[i];
    }

    row = 6; 
    char_ptr = char_buffer + (row << 7) + col;

    for (i = 0; image_count_str[i] != '\0'; i++) {
        *(char_ptr + i) = image_count_str[i];
    }
}

void greyScale() {
	int x, y;
    short pixel;
	short grayscale; 

	for (y = 0; y < 240; y++) {
        for (x = 0; x < 320; x++) {
            pixel = *(Video_Mem_ptr + (y << 9) + x);

            short red = (pixel >> 11) & 0x1F;
            short green = (pixel >> 5) & 0x3F;
            short blue = pixel & 0x1F;
            grayscale = (red + green + blue) / 3;

            short bw = (grayscale > 16) ? 0xFFFF : 0x0000;

            *(Video_Mem_ptr + (y << 9) + x) = bw;
        }
    }

}

void invert(){
    int x, y;
    short pixel;
    short grayscale, inverted; 
    
    for (y = 0; y < 240; y++) {
        for (x = 0; x < 320; x++) {
            pixel = *(Video_Mem_ptr + (y << 9) + x);
    
            short red = (pixel >> 11) & 0x1F;
            short green = (pixel >> 5) & 0x3F;
            short blue = pixel & 0x1F;
            grayscale = (red + green + blue) / 3;
    
            short bw = (grayscale > 16) ? 0xFFFF : 0x0000;
    
            inverted = ~bw;
    
            *(Video_Mem_ptr + (y << 9) + x) = inverted;
            }
        }
    
    }

void mirror() {
	int x, y;

	for (y = 0; y < 240; y++) {
        for (x = 0; x < 160; x++) {
            short temp = *(Video_Mem_ptr + (y << 9) + x);
            *(Video_Mem_ptr + (y << 9) + x) = *(Video_Mem_ptr + (y << 9) + (319 - x));
            *(Video_Mem_ptr + (y << 9) + (319 - x)) = temp;
        }
    }
}

void flip() {
	int x, y;

	for (y = 0; y < 120; y++) {
        for (x = 0; x < 320; x++) {
            short temp = *(Video_Mem_ptr + (y << 9) + x);
            *(Video_Mem_ptr + (y << 9) + x) = *(Video_Mem_ptr + ((239 - y) << 9) + x);
            *(Video_Mem_ptr + ((239 - y) << 9) + x) = temp;
        }
    }
}

int main(void) 
{
	int counter = 1;
    int image_count = 0;   
    *(Video_In_DMA_ptr + 3) = 0x4;  

    while (1) 
    {
        int button_press = *KEY_ptr;  

        while (button_press == 0x1) 
        {  
            *(Video_In_DMA_ptr + 3) = 0x0;
            overlay_timestamp(image_count);

            if (counter == 1) 
            {
				flip();
                counter++;
                image_count++;
                break; 
            }

            else if (counter == 2) 
            {
                mirror();
                counter++;
                image_count++;
                break;
            }

            else if (counter == 3) 
            {
                greyScale();
                counter++;
                image_count++;
                break;
            }

            else if (counter == 4) 
            {
                invert();
                counter = 1;
                image_count++;
                break;
            }
        }
        
        if (button_press == 0x2) 
        {  
            *(Video_In_DMA_ptr + 3) = 0x4;  
            //counter = 1; 
        }

        //while (*KEY_ptr != 0); 
    }
	return 0; 


		/*
    *(Video_In_DMA_ptr + 3) = 0x4;  // Enable the video
	

	while(1){
		while (1) {
			if (*KEY_ptr != 0) {
				*(Video_In_DMA_ptr + 3) = 0x0;  // Disable video to capture a frame
				while (*KEY_ptr != 0);
				break;
			}
		}

		//greyScale(); 
		//mirror();
		//flip();
	
		while (1) {	

			if ((*KEY_ptr + 4) != 0) {
				*(Video_In_DMA_ptr + 3) = 0x4; 
				while ((*KEY_ptr + 4) != 0);
				break;
			}
		}
						//overlay_timestamp();

	}

	*/ 

}
