import std.stdio;
import std.string;
import std.bigint;
import std.datetime;
import mersenned.PrimeTesting;
import mersenned.PrimeSieve;

void main(string[] args) {
	uint[] ps = PrimeSieve.getPrimeSieve(0, 10000);
	int numMersennePrimes = 0;
	StopWatch totalTime;
	totalTime.start();
	foreach(p; ps) {
	    StopWatch sW;
	    sW.start();
	    BigInt m = (BigInt(1) << p) - 1;
	    if(PrimeTesting.lucasLehmer(p, m)) {
	        writefln("2^%d-1 = %d", p, m);
	        writefln("%d digits long", format("%d", m).length);
	        writefln("Found after %s computing. Individual test took %s.", formatTime(totalTime.peek().nsecs()), formatTime(sW.peek().nsecs()));
	        writeln();
	        numMersennePrimes++;
        }
	    sW.stop();
	}
	totalTime.stop();
	writefln("Found %d Mersenne Primes in %s.", numMersennePrimes, formatTime(totalTime.peek().nsecs()));
}

string formatTime(long nanoSec) {
    if(nanoSec / 1000 == 0) // If usec < 0 print nanosec
        return format("%d nsec", nanoSec);
    else if(nanoSec / 1000000 == 0) // If msec < 0 print usec
        return format("%.1f usec", nanoSec / 1000.0);
    else if(nanoSec / 1000000000 == 0) // If sec < 0 print msec
        return format("%.1f msec", nanoSec / 1000000.0);
    else // Print sec + 100s of msecs
        return format("%.1f sec", nanoSec / 1000000000.0);
}
