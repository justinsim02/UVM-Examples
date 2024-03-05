module chapter_4();
/*-----------------------------------------------------------------*/
// Example 4-1 Simple BusTran Class: Intro to Classes
/*-----------------------------------------------------------------*/

// class BusTran; 
//   bit [31:0] addr, crc, data[8];
//   // display the contect of packet
//   function void display;		
//     $display("BusTran: %h", addr);	//%h = hex
//   endfunction: display				// use end labels for large projects
  
//   function void calc_crc;			// void = no return value
//     crc = addr ^ data.xor;			// ^ = XOR
//   endfunction : calc_crc
// endclass : BusTran

/*-----------------------------------------------------------------*/
// Example 4-2 Intro to Object and Handle
/*-----------------------------------------------------------------*/
//   //   new;						// Allocate a BusTran object
//   BusTran b;						// Declare a handle b for new BusTran object
  
/*-----------------------------------------------------------------*/
// Example 4-3 function new
/*-----------------------------------------------------------------*/
//   class BusTran; logic [31:0]
//   addr, crc, data[8];
  
//   // returns object of the same type of class
//   function new;
//     addr = 3;
//     foreach (data[i])
//       data[i] = 5;
//   endfunction
  
/*-----------------------------------------------------------------*/
// Example 4-4 function new with arguments
/*-----------------------------------------------------------------*/
//   class BusTran; logic [31:0]
//     addr, crc, data[8];
//     function new(logic [31:0] addr=3,d=5);
//       this.addr = addr;
//       foreach (data[i])
//         data[i] = d;
//     endfunction 
//   endclass
  
//   initial begin
//     BusTran b;
//     b = new(10);
//     $display("b: ", b);
//   end
  
/*-----------------------------------------------------------------*/
// Example 4-5 Calling the Right new function
/*-----------------------------------------------------------------*/
//   class BusTran; logic [31:0]
//    addr, crc, data[8];
    
//    	function void display;
//       $display("BusTran: %h", addr);
//     endfunction: display
    
//     function new(logic [31:0] addr=3,d=5);
//       this.addr = addr;
//       foreach (data[i])
//         data[i] = d;
//     endfunction 
    
//   endclass : BusTran
  
//   class Driver;
//     BusTran bt; //handle name: bt for class BusTran
    
//     function new();	// calls thew new function within BusTran!
//       bt = new();
//     endfunction
    
//   endclass : Driver
  /* Test Driver Classs*/
//   initial begin Driver q; q = new(); $display("q: ",q); end
  
/*-----------------------------------------------------------------*/
// Example 4-6 Allocating Multiple Objects Using BusTrain
/*-----------------------------------------------------------------*/
//   initial begin
//     BusTran b1, b2;
//     b1 = new;
//     b2 = b1;
//     b1 = new;
//     $display("b1 ",b1);
//     $display("b2 ",b2);
//   end
  
/*-----------------------------------------------------------------*/
// Example 4-8 Using Variables and routines in an object
/*-----------------------------------------------------------------*/
//   initial begin
//     BusTran b;			// Declare a handle to a BusTran
//     b = new;			// Construct a BusTran object
//     b.addr = 32'h42;	// Set the value of a variable
//     b.display();		// Call a routine
//   end
  
/*-----------------------------------------------------------------*/
// Example 4-9 Class with a static variable
/*-----------------------------------------------------------------*/
//   class BusTran;
//     static int count = 0;	// number of objects created
//     int id;
//     function new;
//       id = count++;
//     endfunction
//   endclass
  
//   BusTran b1,b2;
//   initial begin
//     b1 = new;
//     b2 = new;
//     $display("Second id=%d, count=%b", b2.id, b2.count);
//     $display("First id=%d, count=%b", b1.id, b1.count);
//   end

/*-----------------------------------------------------------------*/
// Example 4-10 Initializing a static variable in a task
/*-----------------------------------------------------------------*/
//   class MyStatic; 
//     static int count;
    
//     task initialize(int val);
//       count = val;
//     endtask
//   endclass
  
//   MyStatic s;
//   initial s.initialize(42);
  
/*-----------------------------------------------------------------*/
// Example 4-11 Routines in a Class
/*-----------------------------------------------------------------*/
//   class BusTran;
//     bit [31:0] addr, crc, data[8];
//     function void display();
//       $display("BusTran addr=%h, crc=%h",
//                addr, crc);
//       $write("\tdata[0-7]=");
//       foreach (data[i]) $write(data[i]);	// write each element of data
//       $display();
//     endfunction
//   endclass 
  
//   class PCI_Tran;
//     bit [31:0] addr, data;
//     function void display();
//       $display("PCI: addr=%h, data=%h",
//                addr, data);
//     endfunction
//   endclass
  
//   BusTran b;
//   PCI_Tran pc;
//   initial begin
//     b = new();
//     b.addr = 32'h10;
//     b.display();
//     pc = new();
//     pc.display();
//   end
  
/*-----------------------------------------------------------------*/
// Example 4-18 Using One Class Inside Another
/*-----------------------------------------------------------------*/
//   class Statistics;
//     time startT, stopT;		// Transaction Time
//     static int ntrans = 0;	// Transaction count
//     static time total_elapsed_time = 0;
    
//     function time how_long;
//       how_long = stopT - startT;
//       ntrans++;
//       total_elapsed_time += how_long;
//     endfunction
    
//     function void start; 
//       startT = $time;
//     endfunction
//   endclass
  
//   class BusTran;
//     bit [31:0] addr, crc, data[8];
//     Statistics stats;
//     function new();
//     	stats = new();
//     endfunction
//     task create_packet();
//       // Fill packet with data
//       stats.start();
//       //Transmit packet
//     endtask
//   endclass

/*-----------------------------------------------------------------*/
// Example 4-23 use ref to modify a handle in a task
/*-----------------------------------------------------------------*/
//   task automatic create_packet(ref BusTran bt);
//     bt = new();
//     bt.addr = 42;
//   endtask
  
//   BusTran b;
//   initial begin
//     create_packet(b);
//     $display(b.addr);
//   end
  
/*-----------------------------------------------------------------*/
// Example 4-26 Using an Array of Handles
/*-----------------------------------------------------------------*/
//   task generator();
//     BusTran barray[10];
//     foreach(barray[i])
//       begin
//         barray[i] = new();
//         barray[i].addr = $random();
//         $display("barray address: %h @i: %h", barray[i].addr,i);
//       end
//   endtask 
// endmodule // chapter_4
  
