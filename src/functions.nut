function lerp(a,b,t) {
    return (a + t * (b-a));
}

function rtomul(n,m) {
	local res = n+m/2;
	res -= res % m;
	return res;
}

function solid(x,y) {
	return fget(mget(floor(x/8),floor(y/8)), 0);
}
