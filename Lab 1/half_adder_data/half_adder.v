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
