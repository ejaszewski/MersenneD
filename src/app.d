import std.stdio;
import std.string;
import std.bigint;
import std.datetime;
import mersenned.PrimeTesting;
import mersenned.PrimeSieve;

void main(string[] args) {
	uint[] ps = PrimeSieve.getPrimeSieve(0, 10000);
	
	foreach(p; ps) {
	    StopWatch sW;
	    sW.start();
	    BigInt m = (BigInt(1) << p) - 1;
	    if(PrimeTesting.lucasLehmer(p, m)) {
	        writefln("2^%d-1 = %d", p, m);
	        writefln("%d digits long", format("%d", m).length);
	        printSmart(sW.peek().nsecs());
        }
	    sW.stop();
	}
	
}

void printSmart(long nanoSec) {
    if(nanoSec / 1000 == 0)
        writefln("%d nsec", nanoSec);
    else if(nanoSec / 1000000 == 0)
        writefln("%.1f usec", nanoSec / 1000.0);
    else if(nanoSec / 1000000000 == 0)
        writefln("%.1f msec", nanoSec / 1000000.0);
    else
        writefln("%.3f sec", nanoSec / 1000000000.0);
}
