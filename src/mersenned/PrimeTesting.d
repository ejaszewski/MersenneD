module mersenned.PrimeTesting;

import std.bigint;

class PrimeTesting {
	
	public static bool lucasLehmer(int pr, BigInt m) {
		BigInt two = BigInt(2);
		BigInt p = BigInt(pr);
		BigInt s = BigInt(4);
		BigInt tp = BigInt(1) << pr;
		foreach(i; 0 .. (pr - 2)) {
			
//			// ~ 24% the speed
//			s = ((s * s) - two) % m;

//			// ~ 25$ the speed
//			s = (s * s) - two;
//			if(s > m)
//				s = s % m;

			// Tied for fastest? (uses no division modulus)
			s = (s * s);
			while(s > m)
				s = (s & m) + (s >> pr);
			if(s == m)
				s = 0;
			s -= two;
				
//			// Tied for fastest? (uses no division modulus)
//			s = (s * s) - two;
//			while(s > m)
//				s = (s & m) + (s >> pr);
//			if(s == m)
//				s = 0;
		
		}
		return s == BigInt(0);
	}
	
	public static bool trialDivision(int p, BigInt max) {
		return false;
	}
	
}