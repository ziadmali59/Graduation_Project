module Data_Provider_DMRS(
input    logic          [4:0] u,
input    logic          [1:0]sixTone_BaseSequence,
input    logic          [1:0]threeTone_BaseSequence,
input    logic          [3:0]i_Nsc,
output   logic signed   [15:0] phis_real[11:0],
output   logic signed   [15:0] phis_Imaginary[11:0] 
);

always_comb begin
case (i_Nsc) 
//Three subcarriers
4'b0011: begin
		case(threeTone_BaseSequence)
		     2'b0: begin
			  phis_real[0]=16'b0000101101010000;//0.7071067812 //1/root(2)   //0.7071067812
			  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//1/root(2)   //0.7071067812
					  case(u)
					  5'b0:begin
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b1:begin
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_real[2]=16'b0000101101010000;//0.7071067812//1/root(2) //
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b10:begin
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-1/root(2)  //
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//1/root(2)
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b11:begin
					  phis_real[1]=16'b0000101101010000;//0.7071067812//1/root(2)
					  phis_real[2]=16'b0000101101010000;//0.7071067812//1/root(2)  
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b100:begin
					  phis_real[1]=16'b0000101101010000;//0.7071067812//1/root(2)
					  phis_real[2]=16'b0000101101010000;//0.7071067812//1/root(2)  
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//1/root(2)
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b101:begin
					  phis_real[1]=16'b0000101101010000;//0.7071067812//1/root(2)
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-1/root(2)  
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					
					  end
					  5'b110: begin
					  phis_real[1]=16'b0000101101010000;//0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812 
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b111: begin
					  phis_real[1]=16'b0000101101010000;//0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1000: begin
					  phis_real[1]=16'b0000101101010000;//0.7071067812//1/root(2)
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-1/root(2)  
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//1/root(2)
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//1/root(2)
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1001: begin
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_real[2]=16'b0000101101010000;//0.7071067812//1/root(2)  
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//1/root(2)
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1010: begin
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_real[2]=16'b0000101101010000;//0.7071067812//1/root(2)  
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//1/root(2)
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//1/root(2)
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1011: begin
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-1/root(2)
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-1/root(2)  
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//1/root(2)
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//1/root(2)
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  default:begin
					  phis_real[1]=16'b0;
					  phis_real[2]=16'b0;
					  phis_Imaginary[1]=16'b0;
					  phis_Imaginary[2]=16'b0;
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  endcase
            end
		 2'b1: begin
		           phis_real[0]= 16'b0000101101010000;//0.7071067812//1/root(2)   //0.7071067812
			        phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//1/root(2)   //0.7071067812
					  case(u)
					  5'b0:begin
					  
					  phis_real[1]=16'b0000111101110100;//0.9659258263 //0.9659258263
					  phis_real[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b1:begin
					  phis_real[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b10:begin
					  phis_real[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b11:begin
					  phis_real[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b100:begin
					  phis_real[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[2]=16'b0000010000100100;// 0.258819045// 0.2588190451 
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b101:begin
					  phis_real[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[2]=16'b0000111101110100;//0.9659258263//  0.9659258263
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					
					  end
					  5'b110: begin
					  phis_real[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b111: begin
					  phis_real[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263  
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1000: begin
					  phis_real[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[2]=16'b0000111101110100;//0.9659258263//0.9659258263  
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1001: begin
					  phis_real[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1010: begin
					  phis_real[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[2]=16'b0000010000100100;// 0.258819045// 0.2588190451 
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1011: begin
					  phis_real[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451 
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  default:begin
					  phis_real[1]=16'b0;
					  phis_real[2]=16'b0;
					  phis_Imaginary[1]=16'b0;
					  phis_Imaginary[2]=16'b0;
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  endcase
				end
		2'b10:begin
           phis_real[0]=16'b0000101101010000;//0.7071067812 //1/root(2)   //0.7071067812
			  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//1/root(2)   //0.7071067812
					  case(u)
					  5'b0:begin///////////////////////
					  phis_real[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451 
					  phis_real[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b1:begin
					  phis_real[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451 
					  phis_real[2]=16'b0000010000100100;// 0.258819045//0.2588190451 
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b10:begin
					  phis_real[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451 
					  phis_real[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451 
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b11:begin
					  phis_real[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[2]=16'b0000010000100100;// 0.258819045// 0.2588190451
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451 
					  phis_Imaginary[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b100:begin
					  phis_real[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[2]=16'b1111000010001100;//-0.9659258263// -0.9659258263
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b101:begin
					  phis_real[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[2]=16'b1111101111011100;//-0.258819045 // -0.2588190451
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					
					  end
					  5'b110: begin
					  phis_real[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[2]=16'b0000111101110100;//0.9659258263// 0.9659258263 
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b111: begin
					  phis_real[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[2]=16'b0000010000100100;// 0.258819045//0.2588190451  
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1000: begin
					  phis_real[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451 
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1001: begin
					  phis_real[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[2]=16'b0000010000100100;// 0.258819045// 0.2588190451
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1010: begin
					  phis_real[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1011: begin
					  phis_real[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  default:begin
					  phis_real[1]=16'b0;
					  phis_real[2]=16'b0;
					  phis_Imaginary[1]=16'b0;
					  phis_Imaginary[2]=16'b0;
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  endcase



                end
					  default:begin
					  phis_real[0]=16'b0;
			        phis_Imaginary[0]=16'b0;
					  phis_real[1]=16'b0;
					  phis_real[2]=16'b0;
					  phis_Imaginary[0]=16'b0;
					  phis_Imaginary[1]=16'b0;
					  phis_Imaginary[2]=16'b0;
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					 
					 
					 endcase

end
//six Subcarriers
4'b0110: begin

	case(sixTone_BaseSequence)
	2'b0: begin
	     case(u)
		  
		           5'b0:begin
			        phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b1:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b10:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b11:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b100:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b101:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					
					  end
					  5'b110: begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b111: begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1000: begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1001: begin
				     phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1010: begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b1011: begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1100:begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b1101:begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  
					  default:begin
			        phis_real[0]=16'b0;
					  phis_real[1]=16'b0;
					  phis_real[2]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_Imaginary[0]=16'b0;
					  phis_Imaginary[1]=16'b0;
					  phis_Imaginary[2]=16'b0;
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  
					  
					  
					  
					  
					  
					  
					  
					  endcase
		           end

          2'b1: begin
	              case(u)
		  
		           5'b0:begin
			        phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[5]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b1:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[5]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[5]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b10:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[5]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b11:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[5]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b100:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[5]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[5]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b101:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[5]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[5]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					
					  end
					  5'b110: begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[5]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b111: begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[5]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1000: begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[5]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[5]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1001: begin
				     phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[5]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[5]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1010: begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[5]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[5]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1011: begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[5]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1100:begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[5]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b1101:begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[5]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  default:begin
			        phis_real[0]=16'b0;
					  phis_real[1]=16'b0;
					  phis_real[2]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_Imaginary[0]=16'b0;
					  phis_Imaginary[1]=16'b0;
					  phis_Imaginary[2]=16'b0;
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  endcase
		    end
				2'b10: begin
				
				 case(u)
		  
		           5'b0:begin
			        phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[5]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[5]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b1:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[5]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[5]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b10:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[5]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[5]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b11:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[5]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b100:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[5]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[5]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b101:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[5]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045//-0.2588190451
					  phis_Imaginary[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  
			        phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					
					  end
					  5'b110: begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[5]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b111: begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[5]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1000: begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000010000100100;// 0.2588190451//0.2588190451
					  phis_real[2]=16'b0000010000100100;// 0.2588190451//0.2588190451
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[5]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[5]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1001: begin
				     phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_real[5]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1010: begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[5]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[5]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1011: begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[5]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1100:begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_real[5]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_Imaginary[5]=16'b1111101111011100;//-0.258819045 //-0.258819045
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b1101:begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[2]=16'b1111101111011100;//-0.258819045 //-0.2588190451
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_real[5]=16'b1111101111011100;//-0.258819045//-0.2588190451
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263//-0.9659258263
					  phis_Imaginary[2]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000010000100100;// 0.258819045//0.2588190451
					  phis_Imaginary[5]=16'b0000111101110100;//0.9659258263//0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  default:begin
			        phis_real[0]=16'b0;
					  phis_real[1]=16'b0;
					  phis_real[2]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_Imaginary[0]=16'b0;
					  phis_Imaginary[1]=16'b0;
					  phis_Imaginary[2]=16'b0;
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  endcase
		           end
				
//////////////////////////////////////////////////////////////////				
     2'b11: begin
	     case(u)
		  
		           5'b0:begin
			        phis_real[0]=16'b0000101101010000;//0.7071067812
					  phis_real[1]=16'b0000010000100100;//0.258819045
					  phis_real[2]=16'b1111000010001100;//-0.9659258263
					  phis_real[3]=16'b0000101101010000;//0.7071067812
					  phis_real[4]=16'b0000111101110100;//0.9659258263
					  phis_real[5]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[2]=16'b0000010000100100;//0.258819045
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[4]=16'b0000010000100100;//0.258819045
					  phis_Imaginary[5]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b1:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812
					  phis_real[1]=16'b0000010000100100;//0.258819045
					  phis_real[2]=16'b1111101111011100;//-0.258819045
					  phis_real[3]=16'b0000101101010000;//0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045
					  phis_real[5]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[5]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b10:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812
					  phis_real[1]=16'b1111000010001100;//-0.9659258263
					  phis_real[2]=16'b0000010000100100;//0.258819045
					  phis_real[3]=16'b0000101101010000;//0.7071067812
					  phis_real[4]=16'b0000010000100100;//0.258819045
					  phis_real[5]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[2]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[4]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[5]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b11:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812
					  phis_real[1]=16'b1111000010001100;//-0.9659258263
					  phis_real[2]=16'b1111101111011100;//-0.258819045
					  phis_real[3]=16'b1111010010110000;//-0.7071067812
					  phis_real[4]=16'b1111000010001100;//-0.9659258263
					  phis_real[5]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[4]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[5]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b100:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812
					  phis_real[1]=16'b0000111101110100;   //0.9659258263
					  phis_real[2]=16'b1111000010001100;//-0.9659258263
					  phis_real[3]=16'b0000101101010000;//0.7071067812
					  phis_real[4]=16'b1111000010001100;//-0.9659258263
					  phis_real[5]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[4]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[5]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b101:begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812
					  phis_real[1]=16'b1111101111011100;//-0.258819045
					  phis_real[2]=16'b0000111101110100;//0.9659258263
					  phis_real[3]=16'b0000101101010000;//0.7071067812
					  phis_real[4]=16'b0000111101110100;//0.9659258263
					  phis_real[5]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[2]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[4]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[5]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					
					  end
					  5'b110: begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812
					  phis_real[1]=16'b1111000010001100;//-0.9659258263
					  phis_real[2]=16'b1111000010001100;//-0.9659258263
					  phis_real[3]=16'b1111010010110000;//-0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045
					  phis_real[5]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[5]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b111: begin
					  phis_real[0]=16'b0000101101010000;//0.7071067812
					  phis_real[1]=16'b1111000010001100;//-0.9659258263
					  phis_real[2]=16'b0000010000100100;// 0.258819045
					  phis_real[3]=16'b1111010010110000;//-0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045
					  phis_real[5]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[2]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[5]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1000: begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812
					  phis_real[1]=16'b1111000010001100;//-0.9659258263
					  phis_real[2]=16'b1111000010001100;//-0.9659258263
					  phis_real[3]=16'b1111010010110000;//-0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045
					  phis_real[5]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[2]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[5]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1001: begin
				     phis_real[0]=16'b1111010010110000;//-0.7071067812
					  phis_real[1]=16'b1111000010001100;//-0.9659258263
					  phis_real[2]=16'b1111101111011100;//-0.258819045
					  phis_real[3]=16'b1111010010110000;//-0.7071067812
					  phis_real[4]=16'b1111000010001100;//-0.9659258263
					  phis_real[5]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[1]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[4]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[5]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b1010: begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812
					  phis_real[1]=16'b1111101111011100;//-0.258819045
					  phis_real[2]=16'b1111101111011100;//-0.258819045
					  phis_real[3]=16'b0000101101010000;//0.7071067812
					  phis_real[4]=16'b0000111101110100;//0.9659258263
					  phis_real[5]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[1]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[4]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[5]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1011: begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812
					  phis_real[1]=16'b0000010000100100;// 0.258819045
					  phis_real[2]=16'b1111101111011100;//-0.258819045
					  phis_real[3]=16'b0000101101010000;//0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045
					  phis_real[5]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[2]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[5]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  
					  end
					  5'b1100:begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812
					  phis_real[1]=16'b0000010000100100;// 0.258819045
					  phis_real[2]=16'b0000111101110100;//0.9659258263
					  phis_real[3]=16'b1111010010110000;//-0.7071067812
					  phis_real[4]=16'b1111101111011100;//-0.258819045
					  phis_real[5]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[1]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[2]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[4]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[5]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  5'b1101:begin
					  phis_real[0]=16'b1111010010110000;//-0.7071067812
					  phis_real[1]=16'b0000111101110100;//0.9659258263
					  phis_real[2]=16'b0000111101110100;//0.9659258263
					  phis_real[3]=16'b0000101101010000;//0.7071067812
					  phis_real[4]=16'b0000010000100100;// 0.258819045
					  phis_real[5]=16'b0000111101110100;//0.9659258263
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812
					  phis_Imaginary[1]=16'b0000010000100100;// 0.258819045
					  phis_Imaginary[2]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812
					  phis_Imaginary[4]=16'b1111000010001100;//-0.9659258263
					  phis_Imaginary[5]=16'b1111101111011100;//-0.258819045
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  default:begin
			        phis_real[0]=16'b0;
					  phis_real[1]=16'b0;
					  phis_real[2]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_Imaginary[0]=16'b0;
					  phis_Imaginary[1]=16'b0;
					  phis_Imaginary[2]=16'b0;
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end
					  endcase
		           end				
				
				
  	  default:begin
			        phis_real[0]=16'b0;
					  phis_real[1]=16'b0;
					  phis_real[2]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_Imaginary[0]=16'b0;
					  phis_Imaginary[1]=16'b0;
					  phis_Imaginary[2]=16'b0;
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  end		
				
				
				
				
				




 


  endcase
  
end
//Twelve Subcarriers
4'b1100: begin
case(u)
5'b0:begin

		           phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812

end
5'b1:begin
                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end

5'b10:begin
                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812

end
5'b100:begin

                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end

//////////////
5'b101:begin

                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end

5'b110:begin

                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end



5'b111:begin


                 phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end


5'b1000:begin


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end
//////////////////////////////
5'b1001:begin


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end

5'b1010:begin


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
end

5'b1011:begin


                 phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812//
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end

5'b1100:begin


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812//
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end

5'b1101:begin


                 phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812//
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end

5'b1110:begin


                 phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812//
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end


5'b1111:begin


                 phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812//
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
end
5'b10000:begin


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
end

5'b10001:begin


                 phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812//
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812//
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
end

5'b10010:begin


                 phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812///
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812//
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
end

5'b10011:begin


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812//
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
end

5'b10100:begin


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
end

5'b10101:begin//21


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812//
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
end

5'b10110:begin//22


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end


5'b10111:begin//23 


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end




5'b11000:begin//24


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end

5'b11001:begin//25


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812//
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812//
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812//
					  phis_Imaginary[2]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b0000101101010000;//0.7071067812//0.7071067812
end


5'b11010:begin//26


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
end




5'b11011:begin//27


                 phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
end



5'b11100:begin//28


                 phis_real[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[1]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[8]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
end


5'b11101:begin//29


                 phis_real[0]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[3]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[4]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[6]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[7]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[9]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_real[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_real[11]=16'b0000101101010000;//0.7071067812//0.7071067812
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[1]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[2]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[3]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[4]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[5]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[6]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[7]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[8]=16'b1111010010110000;//-0.7071067812//-0.7071067812
					  phis_Imaginary[9]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[10]=16'b0000101101010000;//0.7071067812//0.7071067812
					  phis_Imaginary[11]=16'b1111010010110000;//-0.7071067812//-0.7071067812
end




/////////////////////////
default:begin


                 phis_real[0]=16'b0;
					  phis_real[1]=16'b0;
					  phis_real[2]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0;
					  phis_Imaginary[1]=16'b0;
					  phis_Imaginary[2]=16'b0;
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
end
















endcase




end
default:begin


                 phis_real[0]=16'b0;
					  phis_real[1]=16'b0;
					  phis_real[2]=16'b0;
					  phis_real[3]=16'b0;
					  phis_real[4]=16'b0;
					  phis_real[5]=16'b0;
					  phis_real[6]=16'b0;
					  phis_real[7]=16'b0;
					  phis_real[8]=16'b0;
					  phis_real[9]=16'b0;
					  phis_real[10]=16'b0;
					  phis_real[11]=16'b0;
					  /////////////////////////////
					  phis_Imaginary[0]=16'b0;
					  phis_Imaginary[1]=16'b0;
					  phis_Imaginary[2]=16'b0;
					  phis_Imaginary[3]=16'b0;
					  phis_Imaginary[4]=16'b0;
					  phis_Imaginary[5]=16'b0;
					  phis_Imaginary[6]=16'b0;
					  phis_Imaginary[7]=16'b0;
					  phis_Imaginary[8]=16'b0;
					  phis_Imaginary[9]=16'b0;
					  phis_Imaginary[10]=16'b0;
					  phis_Imaginary[11]=16'b0;
end

endcase
end
endmodule