class Player extends BaseEntity {
	constructor(ename) {
		base.constructor(ename, "player")
	}

	function tic() {
		// Movement
		if (btn(0)) dy-=speed;
		if (btn(1)) dy+=speed;
		if (btn(2)) dx-=speed;
		if (btn(3)) dx+=speed;

		collisions();

		// Apply Friction
		dy=dy*0.8;
		dx=dx*0.8;

		// Apply Velocity
		y=y+dy;
		x=x+dx;

		// Draw
		spr(256,x-cx,y-cy, 0,1);

		// Debug
		local rc = 5
		if (solid(x,y+dy) || solid(x,y+7+dy) || solid(x+dx,y) || solid(x+7+dx,y)) rc=2
		rectb(floor(rtomul(x,8)-cx),floor(rtomul(y,8)-cy),8,8,rc);

		// Draw Velocity
		if (!(abs(dx)<0.1 && abs(dy)<0.1))
			line((x+4)-cx,(y+4)-cy,((x+4)+(dx*3))-cx,((y+4)+(dy*3))-cy,9);
	}

	function collisions() {
		// Collision
		// Y Collision
		if (solid(x+7,y+dy) || solid(x,y+7+dy))
			dy=0;

		// X Collision
		if (solid(x+dx,y) || solid(x+7+dx,y) ||
			solid(x,y+dy) || solid(x,y+7+dy))
			dx=0;

		// Fix
		if (solid(x+dx,y+dy) || solid(x+7+dx,y+dy))
			dy=0

		if (solid(x+dx,y+dy) || solid(x+7+dx,y+7+dy))
			dy=0
	}

	dx=0.0
	dy=0.0
	speed = 0.5
}
