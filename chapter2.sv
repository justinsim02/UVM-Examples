/*-----------------------------------------------------------------*/
// // Example 2-15 p35
/*-----------------------------------------------------------------*/

// module dynamic_arrays();
//   int dyn[], d2[];		// Empty dynamic Arrays

//   initial begin
//     dyn = new[5];			// Allocate 5 elements
//     foreach (dyn[j])
//       dyn[j] = j;
//     d2 = dyn;
//     d2[0] = 5;			// Modify the copy of dyn
//     $display(dyn[0],d2[0]);
//     dyn = new[20](dyn);	// expand and copy
//     $display(dyn);
//     dyn = new[100];
//     $display($size(dyn));
//     dyn.delete;
//   end
// endmodule 

/*-----------------------------------------------------------------*/
// Example 2-16 p35-36
/*-----------------------------------------------------------------*/

// module uncounted_list();
//   bit [7:0] mask[] =  '{8'b0000_0000, 8'b0000_0001,
// 						8'b0000_0011, 8'b0000_0111,
// 						8'b0000_1111, 8'b0001_1111,
// 						8'b0011_1111, 8'b0111_1111,
// 						8'b1111_1111};
//   initial begin
//     $display($size(mask));
//   end
// endmodule 

/*-----------------------------------------------------------------*/
// Example 2-17 p36
/*-----------------------------------------------------------------*/

// module queue();
//   int j=1,
//   b[$] = {3,4},
//   q[$] = {0,2,5};			// Initial Queue
  
//   initial begin
//     q.insert(1,j);			// {0,1,2,5} 		Insert j at index 1
//     //     q.insert(3,b);			// {0,1,2,3,4,5} 	Insert B at index 3 << does not work
//     q.delete(1); 			// {0,2,3,4,5} 		Delete elem. #1
//     q.push_front(6); 		// {6,0,2,3,4,5} 	Insert at front
// 	j = q.pop_back; 		// {6,0,2,3,4} 		j = 5
    
// 	q.push_back(8); 		// {6,0,2,3,4,8} 	Insert at back
// 	j = q.pop_front; 		// {0,2,3,4,8} 		j = 6
    
//     foreach (q[i]) $display(q[i]);
//   end
// endmodule

/*-----------------------------------------------------------------*/
// Example 2-19 Using an Associative array with string index
/*-----------------------------------------------------------------*/

// module associative_arrays();
//   int switch[string], min_address, max_address;
//   initial begin
//     int i, r, file;
//     string s;
//     file = $fopen("switch.txt", "r");	//"r" = read mode
//     while (!$feof(file)) begin	// feof = end of file
//       r = $fscanf(file, "%d %s", i, s);// fscanf = scan format: decimal>i, string>s
//       switch[s] = i;
//     end
//     $fclose(file);
    
//     // Get the min_address, default is 0
//     min_address = switch["min_address"];
//     // Get max address
//     if(switch.exists("max_address"))
//       max_address = switch["max_address"];
//     else
//       max_address = 1000;
    
//     $display("min_address %d", min_address);
//     $display("max_address %d", max_address);

//   end
                                          
// endmodule 

/*-----------------------------------------------------------------*/
// Example 2-20 Create the sum of an array
/*-----------------------------------------------------------------*/

// module sum_array();
//   bit on[10];	// Array of 10 seperate single bits
//   int summ;

//   initial begin
//     foreach (on[i]) begin
//       on[i] = i;
// //       summ += on[i];
//     end
	
//     // "adding values of a single bit array, result is a single bit
//     $display("on.sum = %0d", on.sum);	// on.sum = 1
    
//     // "if your store result in a 32 bit variable:
//     summ = on.sum;
//     $display("summ = %0d", summ);	// summ = 5
//*********ERROR HERE- summ = 1***************************************
//   end
// endmodule 

/*-----------------------------------------------------------------*/
// Example 2-21,22,23 Array Locator Methods
/*-----------------------------------------------------------------*/
// module array_locator_methods();
//   // min, max, unique
//   int f[6] = '{1,6,2,6,8,6};	// associative array init
//   int q[$] = '{1,3,5,7}, tq[$];	//[$] = unpacked dynamic array
//   initial begin
//   	tq = q.min;
//     $display("q.min: %d", q.min);
// //     tq = q.max;
// //     $display("q.max %d", tq);
// //     tq = f.unique;
// //     $display("q.unique %d", tq);
//   end
// //   $display(q.min);
// endmodule
