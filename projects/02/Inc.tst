// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/02/HalfAdder.tst

load Inc.hdl,
output-file inc.out,
compare-to inc.cmp,
output-list in%B3.1.3 sum%B3.1.3 carry%B3.1.3;

set in 0,
eval,
output;

set in 1,
eval,
output;
