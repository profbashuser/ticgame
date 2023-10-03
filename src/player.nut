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
		bullettic();

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

	function bullettic() {
		// Direction
		if (!(btn(0) && btn(1) && btn(2) && btn(3))) {
			if (!(btn(0) && btn(1))) {
				if (btn(0)) dir="up";
				if (btn(1)) dir="down";
			}

			if (!(btn(2) && btn(3))) {
				if (btn(2)) dir="left";
				if (btn(3)) dir="right";
			}
		}

		if (frate>0)
			frate-=1
		else if (btn(4)) {
			bullets.append(Bullet("B",dir,x+2,y+2, 5))
			frate=10
		}

		foreach (i, val in bullets) {
			if (val.del) bullets.remove(i)
			val.tic();
		}
	}

	frate=0

	dx=0.0
	dy=0.0

	dir="up"
	bullets=[]

	speed = 0.5
}

class Bullet extends BaseEntity {
	constructor(ename,edir,px,py,ddmg) {
		base.constructor(ename, "bullet")
		dir = edir
		x=px
		y=py
		dmg=ddmg
	}

	function tic() {
		// Set dy based on direction
		switch(dir) {
			case "up": dy=-speed; break
			case "left": dx=-speed; break
			case "down": dy=speed; break
			case "right": dx=speed; break
			case "none": del=true; break
			default: throw "Directory not assigned :("; break;
		}

		x+=dx
		y+=dy

		t+=1
		if (t>lifespan) del=true

		rect(x-cx, y-cy, 2, 2, 4);
	}

	static lifespan=30
	static speed = 4

	dmg=5

	dx=0.0
	dy=0.0

	t=0
	del=false

	dir=null
}
