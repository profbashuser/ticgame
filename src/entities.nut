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

	x=0;
	y=0;

	name=null;
	type=null;
}

//// ENEMY ////

class Enemy extends BaseEntity {
	constructor(ename) {
		base.constructor(ename, "Enemy")
	}

	function tic() {
		spr(256,x-cx,y-cy,0,1);
	}
}
