/*
 * Generated by Digital. Don't modify this file!
 * Any changes will be lost if this file is regenerated.
 */

module half_adder (
  input a,
  input b,
  output sum,
  output cry
);
  assign sum = (a ^ b);
  assign cry = (b & a);
endmodule

module incrementer (
  input [3:0] a,
  input inc,
  output [3:0] y,
  output cry
);
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  wire s4;
  wire s5;
  wire s6;
  wire s7;
  wire s8;
  wire s9;
  wire s10;
  assign s7 = a[3];
  assign s0 = a[2];
  assign s4 = a[1];
  assign s9 = a[0];
  half_adder half_adder_i0 (
    .a( s9 ),
    .b( inc ),
    .sum( s10 ),
    .cry( s5 )
  );
  half_adder half_adder_i1 (
    .a( s4 ),
    .b( s5 ),
    .sum( s6 ),
    .cry( s1 )
  );
  half_adder half_adder_i2 (
    .a( s0 ),
    .b( s1 ),
    .sum( s2 ),
    .cry( s3 )
  );
  half_adder half_adder_i3 (
    .a( s7 ),
    .b( s3 ),
    .sum( s8 ),
    .cry( cry )
  );
  assign y[3] = s8;
  assign y[2] = s2;
  assign y[1] = s6;
  assign y[0] = s10;
endmodule

module not_neg (
  input [3:0] a,
  input invert,
  input neg,
  output [3:0] y,
  output cry
);
  wire [3:0] s0;
  wire s1;
  assign s1 = (invert & neg);
  assign s0[0] = (invert ^ a[0]);
  assign s0[1] = (invert ^ a[1]);
  assign s0[2] = (invert ^ a[2]);
  assign s0[3] = (invert ^ a[3]);
  incrementer incrementer_i0 (
    .a( s0 ),
    .inc( s1 ),
    .y( y ),
    .cry( cry )
  );
endmodule

module full_adder (
  input a,
  input b,
  input cin,
  output sum,
  output cout
);
  assign sum = (a ^ b ^ cin);
  assign cout = ((cin & a) | (cin & b) | (b & a));
endmodule

module four_bit_adder (
  input [3:0] a,
  input [3:0] b,
  input cin,
  output [3:0] y,
  output cout,
  output overfl
);
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  wire s4;
  wire s5;
  wire s6;
  wire s7;
  wire s8;
  wire s9;
  wire s10;
  wire s11;
  wire s12;
  wire cout_temp;
  wire s13;
  wire s14;
  assign s0 = a[3];
  assign s1 = a[2];
  assign s2 = a[1];
  assign s3 = a[0];
  assign s4 = b[3];
  assign s5 = b[2];
  assign s6 = b[1];
  assign s7 = b[0];
  full_adder full_adder_i0 (
    .a( s3 ),
    .b( s7 ),
    .cin( cin ),
    .sum( s11 ),
    .cout( s14 )
  );
  full_adder full_adder_i1 (
    .a( s2 ),
    .b( s6 ),
    .cin( s14 ),
    .sum( s10 ),
    .cout( s13 )
  );
  full_adder full_adder_i2 (
    .a( s1 ),
    .b( s5 ),
    .cin( s13 ),
    .sum( s9 ),
    .cout( s12 )
  );
  full_adder full_adder_i3 (
    .a( s0 ),
    .b( s4 ),
    .cin( s12 ),
    .sum( s8 ),
    .cout( cout_temp )
  );
  assign y[3] = s8;
  assign y[2] = s9;
  assign y[1] = s10;
  assign y[0] = s11;
  assign overfl = (cout_temp ^ s12);
  assign cout = cout_temp;
endmodule

module two_bit_mux (
  input a,
  input b,
  input s,
  output y
);
  assign y = ((a & ~ s) | (b & s));
endmodule

module four_bit_mux (
  input [3:0] a,
  input [3:0] b,
  input sel,
  output [3:0] y
);
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  wire s4;
  wire s5;
  wire s6;
  wire s7;
  wire s8;
  wire s9;
  wire s10;
  wire s11;
  assign s4 = a[3];
  assign s5 = a[2];
  assign s6 = a[1];
  assign s7 = a[0];
  assign s8 = b[3];
  assign s9 = b[2];
  assign s10 = b[1];
  assign s11 = b[0];
  two_bit_mux two_bit_mux_i0 (
    .a( s4 ),
    .b( s8 ),
    .s( sel ),
    .y( s0 )
  );
  two_bit_mux two_bit_mux_i1 (
    .a( s6 ),
    .b( s10 ),
    .s( sel ),
    .y( s2 )
  );
  two_bit_mux two_bit_mux_i2 (
    .a( s5 ),
    .b( s9 ),
    .s( sel ),
    .y( s1 )
  );
  two_bit_mux two_bit_mux_i3 (
    .a( s7 ),
    .b( s11 ),
    .s( sel ),
    .y( s3 )
  );
  assign y[3] = s0;
  assign y[2] = s1;
  assign y[1] = s2;
  assign y[0] = s3;
endmodule

module and_add (
  input [3:0] a,
  input [3:0] b,
  input add,
  input cin,
  input pass,
  output [3:0] y,
  output cout,
  output overfl
);
  wire [3:0] s0;
  wire [3:0] s1;
  wire [3:0] s2;
  assign s0[0] = (a[0] & b[0]);
  assign s0[1] = (a[1] & b[1]);
  assign s0[2] = (a[2] & b[2]);
  assign s0[3] = (a[3] & b[3]);
  four_bit_adder four_bit_adder_i0 (
    .a( a ),
    .b( b ),
    .cin( cin ),
    .y( s1 ),
    .cout( cout ),
    .overfl( overfl )
  );
  four_bit_mux four_bit_mux_i1 (
    .a( s0 ),
    .b( s1 ),
    .sel( add ),
    .y( s2 )
  );
  four_bit_mux four_bit_mux_i2 (
    .a( s2 ),
    .b( a ),
    .sel( pass ),
    .y( y )
  );
endmodule

module alu (
  input [3:0] a,
  input [3:0] b,
  input invert,
  input arith,
  input pass,
  input cin,
  output [3:0] y,
  output cout,
  output overfl
);
  wire [3:0] s0;
  not_neg not_neg_i0 (
    .a( a ),
    .invert( invert ),
    .neg( arith ),
    .y( s0 )
  );
  and_add and_add_i1 (
    .a( s0 ),
    .b( b ),
    .add( arith ),
    .cin( cin ),
    .pass( pass ),
    .y( y ),
    .cout( cout ),
    .overfl( overfl )
  );
endmodule

module DIG_D_FF_AS_1bit
#(
    parameter Default = 0
)
(
   input Set,
   input D,
   input C,
   input Clr,
   output Q,
   output \~Q
);
    reg state;

    assign Q = state;
    assign \~Q  = ~state;

    always @ (posedge C or posedge Clr or posedge Set)
    begin
        if (Set)
            state <= 1'b1;
        else if (Clr)
            state <= 'h0;
        else
            state <= D;
    end

    initial begin
        state = Default;
    end
endmodule

module four_bit_reg (
  input [3:0] d,
  input enable,
  input reset,
  input clk,
  output [3:0] q
);
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  wire s4;
  wire s5;
  wire s6;
  wire s7;
  wire [3:0] q_temp;
  wire [3:0] s8;
  DIG_D_FF_AS_1bit #(
    .Default(0)
  )
  DIG_D_FF_AS_1bit_i0 (
    .Set( 1'b0 ),
    .D( s0 ),
    .C( clk ),
    .Clr( reset ),
    .Q( s1 )
  );
  DIG_D_FF_AS_1bit #(
    .Default(0)
  )
  DIG_D_FF_AS_1bit_i1 (
    .Set( 1'b0 ),
    .D( s2 ),
    .C( clk ),
    .Clr( reset ),
    .Q( s3 )
  );
  DIG_D_FF_AS_1bit #(
    .Default(0)
  )
  DIG_D_FF_AS_1bit_i2 (
    .Set( 1'b0 ),
    .D( s4 ),
    .C( clk ),
    .Clr( reset ),
    .Q( s5 )
  );
  DIG_D_FF_AS_1bit #(
    .Default(0)
  )
  DIG_D_FF_AS_1bit_i3 (
    .Set( 1'b0 ),
    .D( s6 ),
    .C( clk ),
    .Clr( reset ),
    .Q( s7 )
  );
  four_bit_mux four_bit_mux_i4 (
    .a( q_temp ),
    .b( d ),
    .sel( enable ),
    .y( s8 )
  );
  assign q_temp[3] = s1;
  assign q_temp[2] = s3;
  assign q_temp[1] = s5;
  assign q_temp[0] = s7;
  assign s0 = s8[3];
  assign s2 = s8[2];
  assign s4 = s8[1];
  assign s6 = s8[0];
  assign q = q_temp;
endmodule
module DIG_RAMDualPort
#(
    parameter Bits = 8,
    parameter AddrBits = 4
)
(
  input [(AddrBits-1):0] A,
  input [(Bits-1):0] Din,
  input str,
  input C,
  input ld,
  output [(Bits-1):0] D
);
  reg [(Bits-1):0] memory[0:((1 << AddrBits) - 1)];

  assign D = ld? memory[A] : 'hz;

  always @ (posedge C) begin
    if (str)
      memory[A] <= Din;
  end

 initial
 begin
 $readmemh("./ram_vals.txt",memory);
 end
endmodule


module program_ram (
  input [3:0] addr,
  input [3:0] data_in,
  input clk,
  input write,
  output [3:0] data_out
);
  // program\_ram
  DIG_RAMDualPort #(
    .Bits(4),
    .AddrBits(4)
  )
  DIG_RAMDualPort_i0 (
    .A( addr ),
    .Din( data_in ),
    .str( write ),
    .C( clk ),
    .ld( 1'b1 ),
    .D( data_out )
  );
endmodule

module brainless (
  input [3:0] addr_bus,
  input [3:0] data_in,
  input arith,
  input invert,
  input pass,
  input load_acc,
  input acc_to_db,
  input read,
  input write,
  input clk,
  input reset,
  output [3:0] alu_out,
  output [3:0] accum,
  output [3:0] data_bus
);
  wire [3:0] data_bus_temp;
  wire [3:0] accum_temp;
  wire [3:0] alu_out_temp;
  wire [3:0] s0;
  wire [3:0] s1;
  alu alu_i0 (
    .a( data_bus_temp ),
    .b( accum_temp ),
    .invert( invert ),
    .arith( arith ),
    .pass( pass ),
    .cin( 1'b0 ),
    .y( alu_out_temp )
  );
  // accumulator
  four_bit_reg four_bit_reg_i1 (
    .d( alu_out_temp ),
    .enable( load_acc ),
    .reset( reset ),
    .clk( clk ),
    .q( accum_temp )
  );
  // accum\_mux
  four_bit_mux four_bit_mux_i2 (
    .a( s0 ),
    .b( accum_temp ),
    .sel( acc_to_db ),
    .y( data_bus_temp )
  );
  program_ram program_ram_i3 (
    .addr( addr_bus ),
    .data_in( data_bus_temp ),
    .clk( clk ),
    .write( write ),
    .data_out( s1 )
  );
  // data\_mux
  four_bit_mux four_bit_mux_i4 (
    .a( data_in ),
    .b( s1 ),
    .sel( read ),
    .y( s0 )
  );
  assign alu_out = alu_out_temp;
  assign accum = accum_temp;
  assign data_bus = data_bus_temp;
endmodule

module program_ctr (
  input enable,
  input reset,
  input clk,
  output [3:0] q
);
  wire [3:0] q_temp;
  wire [3:0] s0;
  four_bit_reg four_bit_reg_i0 (
    .d( s0 ),
    .enable( enable ),
    .reset( reset ),
    .clk( clk ),
    .q( q_temp )
  );
  incrementer incrementer_i1 (
    .a( q_temp ),
    .inc( 1'b1 ),
    .y( s0 )
  );
  assign q = q_temp;
endmodule

module addr_gen (
  input [3:0] data_bus,
  input clk,
  input reset,
  input use_pc,
  input load_mar,
  output [3:0] addr_bus
);
  wire [3:0] mar;
  wire [3:0] pc;
  wire s0;
  // MAR
  four_bit_reg four_bit_reg_i0 (
    .d( data_bus ),
    .enable( load_mar ),
    .reset( reset ),
    .clk( clk ),
    .q( mar )
  );
  program_ctr program_ctr_i1 (
    .enable( use_pc ),
    .reset( reset ),
    .clk( clk ),
    .q( pc )
  );
  assign s0 = ~ use_pc;
  four_bit_mux four_bit_mux_i2 (
    .a( pc ),
    .b( mar ),
    .sel( s0 ),
    .y( addr_bus )
  );
endmodule

module two_bit_bus_mux (
  input [1:0] a,
  input [1:0] b,
  input sel,
  output [1:0] y
);
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  wire s4;
  wire s5;
  assign s0 = a[1];
  assign s1 = a[0];
  assign s2 = b[1];
  assign s3 = b[0];
  two_bit_mux two_bit_mux_i0 (
    .a( s0 ),
    .b( s2 ),
    .s( sel ),
    .y( s4 )
  );
  two_bit_mux two_bit_mux_i1 (
    .a( s1 ),
    .b( s3 ),
    .s( sel ),
    .y( s5 )
  );
  assign y[1] = s4;
  assign y[0] = s5;
endmodule

module two_bit_reg (
  input [1:0] d,
  input enable,
  input reset,
  input clk,
  output [1:0] q
);
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  wire [1:0] s4;
  wire [1:0] q_temp;
  DIG_D_FF_AS_1bit #(
    .Default(0)
  )
  DIG_D_FF_AS_1bit_i0 (
    .Set( 1'b0 ),
    .D( s0 ),
    .C( clk ),
    .Clr( reset ),
    .Q( s1 )
  );
  DIG_D_FF_AS_1bit #(
    .Default(0)
  )
  DIG_D_FF_AS_1bit_i1 (
    .Set( 1'b0 ),
    .D( s2 ),
    .C( clk ),
    .Clr( reset ),
    .Q( s3 )
  );
  two_bit_bus_mux two_bit_bus_mux_i2 (
    .a( q_temp ),
    .b( d ),
    .sel( enable ),
    .y( s4 )
  );
  assign q_temp[1] = s1;
  assign q_temp[0] = s3;
  assign s0 = s4[1];
  assign s2 = s4[0];
  assign q = q_temp;
endmodule
module DIG_ROM_64X14_microcodeROM (
    input [5:0] A,
    input sel,
    output reg [13:0] D
);
    reg [13:0] my_rom [0:31];

    always @ (*) begin
        if (~sel)
            D = 14'hz;
        else if (A > 6'h1f)
            D = 14'h0;
        else
            D = my_rom[A];
    end

    initial begin
        my_rom[0] = 14'h1205;
        my_rom[1] = 14'h234;
        my_rom[2] = 14'h0;
        my_rom[3] = 14'h0;
        my_rom[4] = 14'h1205;
        my_rom[5] = 14'h294;
        my_rom[6] = 14'h0;
        my_rom[7] = 14'h0;
        my_rom[8] = 14'h1205;
        my_rom[9] = 14'h1000;
        my_rom[10] = 14'h0;
        my_rom[11] = 14'h0;
        my_rom[12] = 14'h1205;
        my_rom[13] = 14'h214;
        my_rom[14] = 14'h0;
        my_rom[15] = 14'h0;
        my_rom[16] = 14'h1205;
        my_rom[17] = 14'hd8;
        my_rom[18] = 14'h0;
        my_rom[19] = 14'h0;
        my_rom[20] = 14'h1205;
        my_rom[21] = 14'h2d4;
        my_rom[22] = 14'h0;
        my_rom[23] = 14'h0;
        my_rom[24] = 14'h1205;
        my_rom[25] = 14'h2304;
        my_rom[26] = 14'h300a;
        my_rom[27] = 14'h0;
        my_rom[28] = 14'h1205;
        my_rom[29] = 14'h98;
        my_rom[30] = 14'h0;
        my_rom[31] = 14'h3fff;
    end
endmodule


module controller (
  input clk,
  input reset,
  input [3:0] data_bus,
  input load_ir,
  output [9:0] controler
);
  wire [3:0] instr_reg;
  wire [5:0] s0;
  wire [13:0] rom_out;
  wire [1:0] step_reg;
  wire [1:0] s1;
  // Instruction Reg
  four_bit_reg four_bit_reg_i0 (
    .d( data_bus ),
    .enable( load_ir ),
    .reset( reset ),
    .clk( clk ),
    .q( instr_reg )
  );
  assign s0[5:2] = instr_reg;
  assign s0[1:0] = step_reg;
  // Step Reg
  two_bit_reg two_bit_reg_i1 (
    .d( s1 ),
    .enable( 1'b1 ),
    .reset( reset ),
    .clk( clk ),
    .q( step_reg )
  );
  // microcode ROM
  DIG_ROM_64X14_microcodeROM DIG_ROM_64X14_microcodeROM_i2 (
    .A( s0 ),
    .sel( 1'b1 ),
    .D( rom_out )
  );
  assign controler = rom_out[9:0];
  assign s1 = rom_out[13:12];
endmodule

module microprocessor (
  input clk,
  input [3:0] data_in,
  input reset,
  output [3:0] accum
);
  wire [3:0] s0;
  wire s1;
  wire s2;
  wire s3;
  wire s4;
  wire s5;
  wire s6;
  wire s7;
  wire [3:0] s8;
  wire s9;
  wire s10;
  wire [9:0] s11;
  wire s12;
  brainless brainless_i0 (
    .addr_bus( s0 ),
    .data_in( data_in ),
    .arith( s1 ),
    .invert( s2 ),
    .pass( s3 ),
    .load_acc( s4 ),
    .acc_to_db( s5 ),
    .read( s6 ),
    .write( s7 ),
    .clk( clk ),
    .reset( reset ),
    .accum( accum ),
    .data_bus( s8 )
  );
  addr_gen addr_gen_i1 (
    .data_bus( s8 ),
    .clk( clk ),
    .reset( reset ),
    .use_pc( s9 ),
    .load_mar( s10 ),
    .addr_bus( s0 )
  );
  controller controller_i2 (
    .clk( clk ),
    .reset( reset ),
    .data_bus( s8 ),
    .load_ir( s12 ),
    .controler( s11 )
  );
  assign s1 = s11[7];
  assign s2 = s11[6];
  assign s3 = s11[5];
  assign s4 = s11[4];
  assign s5 = s11[3];
  assign s6 = s11[2];
  assign s7 = s11[1];
  assign s9 = s11[9];
  assign s10 = s11[8];
  assign s12 = s11[0];
endmodule
