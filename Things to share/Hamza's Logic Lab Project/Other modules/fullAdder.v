module fullAdder(x,y,z,s,c);
input x,y,z;
output s,c;
wire w1,w2,w3,w4,w5,w6,w7;

wire nx,ny,nz;
not n1(nx,x);
not n2(ny,y);
not n3(nz,z);
//Sum
and a1(w1,x,ny,nz);
and a2(w2,nx,y,nz);
and a3(w3,nx,ny,z);
and a4(w4,x,y,z);
or o1(s,w1,w2,w3,w4);
//Carry
and a5(w5,x,y);
and a6(w6,x,z);
and a7(w7,y,z);
or o2(c,w5,w6,w7);
endmodule