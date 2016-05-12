module mersenned.PrimeSieve;

class PrimeSieve {
	
	public static uint[] getPrimeSieve(uint min, uint max) {
		uint[] ret = new uint[0];
		uint[] tmp = new uint[1];
	    
	    bool[] sieve = new bool[max];
	    sieve[0] = sieve[1] = true;
	    foreach(i; 2 .. max) {
	        if(sieve[i])
	            continue;
            for(int j = i + i; j < max; j += i)
                sieve[j] = true;
	    }
	    
	    foreach(i; 0 .. max) {
	        if(sieve[i])
	            continue;
            tmp[0] = i;
            ret ~= tmp;
	    }
	    
	    return ret;
	}
	
}
