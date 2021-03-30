/**********************************
copyright@FPGA OPEN SOURCE STUDIO
微信公众号：FPGA开源工作室
***********************************/
`timescale 1ns / 1ps

`ifdef pix_1920_1080
    //----------------------------------------------------//
    // 1920*1080  60HZ pixel clock 148.5MHZ 
    //---------------------------------------------------//
    
    parameter H_Total		=	2200; 
    
    parameter H_Sync		=	44;  
    parameter H_Back		=	148; 
    parameter H_Active	    =	1920;          
    parameter H_Front		=	88;      
    
    parameter H_Start		=	192;//H_Sync+H_Back
    parameter H_End		    =	2112;//H_Sync+H_Back+H_Active
    //-------------------------------//
    // 1920*1080	60HZ  	
    //-------------------------------//
    parameter V_Total		=	1125;
    
    parameter V_Sync		=	5;
    parameter V_Back		=	36;
    parameter V_Active  	=	1080;
    parameter V_Front		=	4;
    
    parameter V_Start		=	41;//V_Sync+V_Back
    parameter V_End		    =	1120;//V_Sync+V_Back+V_Active
`endif

`ifdef pix_1280_768
    //---------------------------------//
    // 1280*768 60HZ  pixel clock 79.5MHZ
    //--------------------------------//
    parameter H_Total        =    1664; 
    
    parameter H_Sync        =    128;  
    parameter H_Back        =    192; 
    parameter H_Active        =   1280;          
    parameter H_Front        =    64;      
    
    parameter H_Start        =    320;//H_Sync+H_Back
    parameter H_End          =    1600;//H_Sync+H_Back+H_Active
    //-------------------------------//
    // 1280*768    60HZ      
    //-------------------------------//
    parameter V_Total       =    798;
    
    parameter V_Sync        =    7;
    parameter V_Back        =    20;
    parameter V_Active      =    768;
    parameter V_Front       =    3;
  
    parameter V_Start       =    27;//V_Sync+V_Back
    parameter V_End         =    795;//V_Sync+V_Back+V_Active
`endif

`ifdef pix_1280_720
        //---------------------------------//
        // 1280*720 60HZ  pixel clock 74.250MHZ
        //--------------------------------//
        parameter H_Total        =    1650; 
        
        parameter H_Sync        =    40;  
        parameter H_Back        =    220; 
        parameter H_Active        =   1280;          
        parameter H_Front        =    110;      
        
        parameter H_Start        =    260;//H_Sync+H_Back
        parameter H_End          =    1540;//H_Sync+H_Back+H_Active
        //-------------------------------//
        // 1280*720    60HZ      
        //-------------------------------//
        parameter V_Total       =    750;
        
        parameter V_Sync        =    5;
        parameter V_Back        =    20;
        parameter V_Active      =    720;
        parameter V_Front       =    5;
      
        parameter V_Start       =    25;//V_Sync+V_Back
        parameter V_End         =    745;//V_Sync+V_Back+V_Active
`endif

`ifdef pix_800_600
        //---------------------------------//
        // 800*600 60HZ  pixel clock 40.00MHZ
        //--------------------------------//
        parameter H_Total        =    1056; 
        
        parameter H_Sync        =    128;  
        parameter H_Back        =    88; 
        parameter H_Active        =  800;          
        parameter H_Front        =   40;      
        
        parameter H_Start        =    216;//H_Sync+H_Back
        parameter H_End          =    1016;//H_Sync+H_Back+H_Active
        //-------------------------------//
        // 800*600    60HZ      
        //-------------------------------//
        parameter V_Total       =    628;
        
        parameter V_Sync        =    4;
        parameter V_Back        =    23;
        parameter V_Active      =    600;
        parameter V_Front       =    1;
      
        parameter V_Start       =    27;//V_Sync+V_Back
        parameter V_End         =    627;//V_Sync+V_Back+V_Active
`endif

`ifdef pix_640_480
        //---------------------------------//
        // 640*480@60HZ  pixel clock 25.175MHZ
        //--------------------------------//
        parameter H_Total        =    800; 
        
        parameter H_Sync         =    96;  
        parameter H_Back         =    40; 
        parameter H_Active       =    640;          
        parameter H_Front        =    24;      
        
        parameter H_Start        =    136;//H_Sync+H_Back
        parameter H_End          =    776;//H_Sync+H_Back+H_Active
        //-------------------------------//
        // 640*480@60HZ      
        //-------------------------------//
        parameter V_Total       =    525;
        
        parameter V_Sync        =    2;
        parameter V_Back        =    25;
        parameter V_Active      =    480;
        parameter V_Front       =    16;
      
        parameter V_Start       =    27;//V_Sync+V_Back
        parameter V_End         =    507;//V_Sync+V_Back+V_Active
`endif



