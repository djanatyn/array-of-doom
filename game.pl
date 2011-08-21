class Player {
    has $.xpos;
    has $.ypos;

    method walk {
	my $bump = 1;
	$_ = prompt '> ';
	if (/north/ && @map[$!ypos - 1][$!xpos] ne '+') { $!ypos--; $bump = 0; }
	if (/south/ && @map[$!ypos + 1][$!xpos] ne '+') { $!ypos++; $bump = 0; }
	if (/east/ && @map[$!ypos][$!xpos + 1] ne '+')  { $!xpos++; $bump = 0; }
	if (/west/ && @map[$!ypos][$!xpos - 1] ne '+')  { $!xpos--; $bump = 0; }
	say "Ouch! You bumped into a wall. (or I don't know what you said.)" if $bump == 1;
    }
    method display {
	$_ =  @map[$!ypos][$!xpos];
	say "You are currently located at ($!ypos,$!xpos) in the array of doom.";
	if (/\./) { say "You are on a floor.";  }
	if (/e/) { say "You found the exit!"; exit; }
    }
}

my @map = (
    [< + + + + + + + + + >], # + represents walls
    [< + . + . . . . . + >], # . represents floors
    [< + . . . + . + e + >], # e represents the exit
    [< + + + + + + + + + >]);

my $player = Player.new(
    xpos => 1,
    ypos => 1,
    );

say "JOURNEYS IN THE ARRAY OF DOOM";
say "-----------------------------";
while (1) {
    $player.display;
    $player.walk;
}
