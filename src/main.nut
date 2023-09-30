//// MAIN LOOP ////

player<-Player("player")
player.move(8,8)
entities<-[Enemy("touche")]
function TIC()
{
	cls()
	t=t+1

	map(0,0,scsx*2,scsy*2,-cx,-cy)

	local cpx = player.x+4-(scsx/2)
	local cpy = player.y+4-(scsy/2)

	cx = (cx + 0.5 * (cpx-cx));
	cy = (cy + 0.5 * (cpy-cy));

	if (cx<=0) {
		cx=0
	} if (cy<=0) {
		cy=0
	}

	foreach (i, val in entities) {
		val.tic();
	}

	player.tic();
}
