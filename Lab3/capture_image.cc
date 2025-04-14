#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include <stdint.h>
#include "bmp_utility.h"

#define HW_REGS_BASE (0xff200000)
#define HW_REGS_SPAN (0x00200000)
#define HW_REGS_MASK (HW_REGS_SPAN - 1)
#define LED_BASE 0x1000
#define PUSH_BASE 0x3010
#define VIDEO_BASE 0x0000

#define IMAGE_WIDTH 320
#define IMAGE_HEIGHT 240


#define FPGA_ONCHIP_BASE     (0xC8000000)
#define IMAGE_SPAN (IMAGE_WIDTH * IMAGE_HEIGHT * 4)
#define IMAGE_MASK (IMAGE_SPAN - 1)


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



int main(void) {
    volatile unsigned int *video_in_dma = NULL;
    volatile unsigned int *key_ptr = NULL;
    volatile unsigned short *video_mem = NULL;
    void *virtual_base;
    void *virtual_base2;
    int fd;

    // Open /dev/mem
    if ((fd = open("/dev/mem", (O_RDWR | O_SYNC))) == -1) {
        printf("ERROR: could not open \"/dev/mem\"...\n");
        return 1;
    }

    // Map physical memory into virtual address space
    virtual_base = mmap(NULL, HW_REGS_SPAN, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, HW_REGS_BASE);
    if (virtual_base == MAP_FAILED) {
        printf("ERROR: mmap() failed...\n");
        close(fd);
        return 1;
    }

    // Calculate the virtual address where our device is mapped
    video_in_dma = (unsigned int *)(virtual_base + ((VIDEO_BASE) & (HW_REGS_MASK)));

    // Map physical memory into virtual address space
    //Handles memory ogf image data
    virtual_base2 = mmap(NULL, IMAGE_SPAN, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, FPGA_ONCHIP_BASE);
    if (virtual_base2 == MAP_FAILED) {
        printf("ERROR: mmap() failed...\n");
        close(fd);
        return 1;
    }

    // Calculate the virtual address where our image is mapped
    video_mem = (unsigned int *)(virtual_base2 + ((FPGA_ONCHIP_BASE) & (IMAGE_MASK)));
   

    int value = *(video_in_dma+3);

    printf("Video In DMA register updated at:0%x\n",(video_in_dma));

    int value2 = *(video_mem+3);

    printf("Video Memory register updated at:0%x\n",(video_mem));

    // Modify the PIO register
    *(video_in_dma+3) = 0x4;
    //*h2p_lw_led_addr = *h2p_lw_led_addr + 1;

    value = *(video_in_dma+3);

    printf("enabled video:0x%x\n",value);

    const char* filename = "final_image_color.bmp";
    const char* filename1 = "final_image_bw.bmp";

     

    while (1) 
    {
        int button_press = *KEY_ptr;  

        while (button_press == 0x1) 
        {  
            *(Video_In_DMA_ptr + 3) = 0x0;

            saveImageShort(filename,&pixels[0][0],320,240);

            greyScale();            
            saveImageGrayscale(filename1,&pixels_bw[0][0],320,240);      
        }
        
        if (button_press == 0x2) 
        {  
            *(Video_In_DMA_ptr + 3) = 0x4;
            break;  
        }

    }
    



    //change 
    //const char* filename = "final_image_color.bmp";

    // Saving image as color
    //saveImageShort(filename,&pixels[0][0],320,240);

    //const char* filename1 = "final_image_bw.bmp";
    //saving image as black and white
    //saveImageGrayscale(filename1,&pixels_bw[0][0],320,240);


    // Clean up
    if (munmap(video_base, IMAGE_SPAN) != 0) {
        printf("ERROR: munmap() failed...\n");
        close(fd);
        return 1;
    }



    close(fd);
    return 0;
}