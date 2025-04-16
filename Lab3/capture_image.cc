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


int main(void) {
    volatile unsigned int *video_in_dma = NULL;
    volatile unsigned short *video_mem = NULL;
    volatile unsigned short *key_ptr = NULL;
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

    // Map physical memory into virtual address space
    //Handles memory ogf image data
    virtual_base2 = mmap(NULL, IMAGE_SPAN, (PROT_READ | PROT_WRITE), MAP_SHARED, fd, FPGA_ONCHIP_BASE);
    if (virtual_base2 == MAP_FAILED) {
        printf("ERROR: mmap() failed...\n");
        close(fd);
        return 1;
    }

    // Calculate the virtual address where our image is mapped
    //video_in_dma = (unsigned int *)(virtual_base + (VIDEO_BASE));
    video_in_dma = (unsigned int *)(virtual_base + ((VIDEO_BASE) & (HW_REGS_MASK)));
    video_mem = (volatile unsigned short *)(virtual_base2 + (FPGA_ONCHIP_BASE & IMAGE_MASK));
    key_ptr = (unsigned short *)(virtual_base + ((PUSH_BASE) & (HW_REGS_MASK)));
 
    *(video_in_dma+3) = 0x4;

        while(1){
            if(*key_ptr < 7){
                break;
            }
        }
    *(video_in_dma+3) = 0x0; 
    //value = *(video_in_dma+3);

    //printf("enabled video:0x%x\n",value);

    const char* filename = "color_image.bmp";
    const char* filename1 = "bw_image.bmp"; 

    unsigned short colPixels[IMAGE_HEIGHT][IMAGE_WIDTH];
    unsigned char bwPixels[IMAGE_HEIGHT][IMAGE_WIDTH];

    for(int y = 0; y < IMAGE_HEIGHT; ++y){
        for(int x = 0; x<IMAGE_WIDTH; ++x){
            //bwPixels[x+y*IMAGE_WIDTH] = *(video_mem + (y<<9) + x);
            //colPixels[x][y] = *(video_mem + (y<<9) + x);
            colPixels[y][x] = video_mem[(y<<9) + x];
            bwPixels[y][x] = (char)video_mem[(y<<9) + x];

        }
    }

    saveImageShort(filename,&colPixels[0][0],320,240);
    saveImageGrayscale(filename1,&bwPixels[0][0],320,240)


    // Clean up
    if (munmap(virtual_base, HW_REGS_SPAN) != 0) {
        printf("ERROR: munmap() failed...\n");
        close(fd);
        return 1;
    }

    if (munmap(virtual_base2, IMAGE_SPAN) != 0) {
        printf("ERROR: munmap() failed...\n");
        close(fd);
        return 1;
    }

    close(fd);
    return 0;
}

//GRAVEYARD

    //char bwPixels[IMAGE_WIDTH][IMAGE_HEIGHT];
    //int colPixels[IMAGE_WIDTH][IMAGE_HEIGHT];

  
    //int value = *(video_in_dma+3);

    //printf("Video In DMA register updated at:0%x\n",(video_in_dma));

    //int value2 = *(video_mem+3);

    //printf("Video Memory register updated at:0%x\n",(video_mem));
    //*(video_in_dma + 3) = 0x0;

    // Modify the PIO register
    //*h2p_lw_led_addr = *h2p_lw_led_addr + 1;

    /*
    while (1) 
    {
        //int button_press = *PUSH_BASE;  

        //while (button_press == 0x1) 
        //{  
            *(video_in_dma + 3) = 0x0;

            saveImageShort(filename,&pixels[0][0],320,240);

            greyScale();            
            saveImageGrayscale(filename1,&pixels_bw[0][0],320,240);      
        //}
        
        //if (button_press == 0x2) 
        //{  
            *(Video_In_DMA_ptr + 3) = 0x4;
            break;  
        //}

    }
    */
    



    //change 
    //const char* filename = "final_image_color.bmp";

    // Saving image as color
    //saveImageShort(filename,&pixels[0][0],320,240);

    //const char* filename1 = "final_image_bw.bmp";
    //saving image as black and white
    //saveImageGrayscale(filename1,&pixels_bw[0][0],320,240);