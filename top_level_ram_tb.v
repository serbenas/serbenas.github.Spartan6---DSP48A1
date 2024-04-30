module top_level_ram_tb();
 reg [17:0]a,b,d;
 reg [47:0]c;
 reg [7:0]opmode;
 reg CARRY_IN;
 reg CEA,CEB,CEM,CEP,CEC,CED,CECARRY_IN,CEOPMODE;
 reg [47:0]PCIN;
 reg [17:0] BCIN;
 reg RSTA,RSTB,RSTM,RSTP,RSTC,RSTD,RSTCARRY_IN,RSTOPMODE;
 reg d3;

 wire  [17:0]BCOUT;
 wire [47:0]PCOUT;
 wire  [47:0]P;
 wire [35:0]M;
 wire  CARRY_OUT;
 wire  CARRY_OUTF;



 integer i;
//instantiotion fot top module 
 top_level_ram z(.a(a),.b(b),.c(c),.d(d),
                .opmode(opmode),.CARRY_IN(CARRY_IN),.CEA(CEA),.CEB(CEB),.CEM(CEM),.CEP(CEP),.CEC(CEC),.CED(CED),.CECARRY_IN(CECARRY_IN),.CEOPMODE(CEOPMODE),
                .PCIN(PCIN),.BCIN(BCIN),.RSTA(RSTA),.RSTB(RSTB),.RSTM(RSTM),.RSTP(RSTP),.RSTC(RSTC),.RSTD(RSTD),.RSTCARRY_IN(RSTCARRY_IN),.RSTOPMODE(RSTOPMODE),
                .d3(d3),.BCOUT(BCOUT),.PCOUT(PCOUT),.P(P),.M(M),.CARRY_OUT(CARRY_OUT),.CARRY_OUTF(CARRY_OUTF)
               );

			   
			   
//clock generation
 initial begin
    CEA=0; forever #1 CEA=~CEA;
 end

 initial begin
    CEB=0; forever #1 CEB=~CEB;
 end

 initial begin
    CEC=0; forever #1 CEC=~CEC;
 end

 initial begin
    CED=0; forever #1 CED=~CED;
 end

 initial begin
    CEM=0; forever #1 CEM=~CEM;
 end

 initial begin
   CEP=0; forever #1 CEP=~CEP;
 end

 initial begin
   CECARRY_IN=0; forever #1 CECARRY_IN=~CECARRY_IN;
 end


initial begin
CEOPMODE=0; forever #1 CEOPMODE=~CEOPMODE;
end



 initial begin
  //direct teset to check funcionality
    a='b01;
    b='b10;
    d='b01;
    c='b10;
    opmode='b11000000;
    CARRY_IN=0;
    PCIN=$random;
    BCIN=$random;
    RSTA=0;
    RSTB=0;
    RSTM=0;
    RSTP=0;
    RSTC=0;
    RSTD=0;
    RSTCARRY_IN=0;
    RSTOPMODE=0;
    d3=0;
    #10;
 
    a=$random;
    b=$random;
    d=$random;
    c=$random;
    opmode='b01110101;
    CARRY_IN=0;
    PCIN=$random;
    BCIN=$random;
    RSTA=0;
    RSTB=0;
    RSTM=0;
    RSTP=0;
    RSTC=0;
    RSTD=0;
    RSTCARRY_IN=0;
    RSTOPMODE=0;
    d3=0;

    #10;
    a=$random;
    b=$random;
    d=$random;
    c=$random;
    opmode='b0000000;
    CARRY_IN=0;
    PCIN=$random;
    BCIN=$random;
    RSTA=0;
    RSTB=0;
    RSTM=0;
    RSTP=0;
    RSTC=0;
    RSTD=0;
    RSTCARRY_IN=0;
    RSTOPMODE=0;
    d3=0;
    #10;
//full random test
  for (i=0;i<6;i=i+1) begin
    a=$random;
    b=$random;
    d=$random;
    c=$random;
    opmode=$random;
    CARRY_IN=$random;
    PCIN=$random;
    BCIN=$random;
    RSTA=$random;
    RSTB=$random;
    RSTM=$random;
    RSTP=$random;
    RSTC=$random;
    RSTD=$random;
    RSTCARRY_IN=$random;
    RSTOPMODE=$random;
    d3=0;
    @(negedge CEA);
  end
 $stop;
 end
 endmodule

