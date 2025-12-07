module mux_2x1(A,B,S0,Y); //onoma module/ dhlwsh eisodwn/ejodwn
input A,B,S0; //eisodoi 
output reg Y; //ejodos(reg giati orizw thn timh tou mesa sto programma)

always @(*) begin  //kathe fora pou ekteleitai to programma kane ta parakatw
case({S0})  //analoga me thn timh tou arithmou S0(1 bit) dwse sto Y thn antistoixh timh
0 : Y=A;  //periptwsh 0
1 : Y=B; //periptwsh 1

endcase  
end  
endmodule 

