class Player extends BaseEntity {
	constructor(ename) {
		base.constructor(ename, "player")
	}

	function tic() {
		if (btn(0)) dy=dy-speed;
		if (btn(1)) dy=dy+speed;
		if (btn(2)) dx=dx-speed;
		if (btn(3)) dx=dx+speed;

		y=y+dy;
		x=x+dx;

		dy=dy*0.8;
		dx=dx*0.8;

		spr(256,x-cx,y-cy, 0,1);
	}

	dx=0.0
	dy=0.0
	speed = 0.5
}
