//// BASE CLASSES ////

class BaseEntity {
	constructor(ename, etype) {
		name = ename;
		type = etype;
	}

	function move(newx, newy) {
		x = newx;
		y = newy;
	}

	function encollide(en2) {
		return (x < en2.x+en2.w &&
			en2.x < x+w &&
			y < en2.y+en2.h &&
			en2.y < y+h)
	}

	// Entity should have tic
	function tic() {}

	x=0;
	y=0;
	w=8;
	h=8;

	name=null;
	type=null;
}

//// ENEMY ////

class Enemy extends BaseEntity {
	constructor(ename) {
		base.constructor(ename, "Enemy")
		health=max_health
	}

	function tic() {
		::print(health,x-cx,y-cy, 1)
		if (health<=0) del=true
		spr(256,x-cx,y-cy,0,1);
	}

	del=false

	static max_health = 100
	health=null
}
