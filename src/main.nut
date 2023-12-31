player<-Player("PL");
player.move(8,8);
entities<-[];

enem<-Enemy("john");
enem.move(8,16);
entities.append(enem);

function TIC()
{
	cls();
	t=t+1;

	map(0,0,scsx*2,scsy,-cx,-cy);

	foreach (i, val in entities) {
		if (val.del) entities.remove(i);
		val.tic();
		foreach (bi,bv in player.bullets) {
			if (val.encollide(bv)) {
				val.health -= bv.dmg
				player.bullets.remove(bi)
			}
		}
	}

	player.tic();

	// Get Camera Position
	local cpx = player.x+4-(scsx/2);
	local cpy = player.y+4-(scsy/2);

	// Set camera position
	cx = lerp(cx,cpx,0.1);
	cy = lerp(cy,cpy,0.1);

	// Camera bounds
	local bounded = true
	if (bounded) {
		if (cx<=0)
			cx=0;
		if (cy<=0)
			cy=0;

		if (cx>scsx*1)
			cx=scsx*1;
		if (cy>scsy*1)
			cy=scsy*1;
	}
}
