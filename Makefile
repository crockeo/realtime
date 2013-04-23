# The makefile

CC=ghc
SOURCES=Main.hs Game.hs GameState.hs Board.hs Tile.hs Direction.hs Math.hs
OUT=Realtime.exe
OUTDIR=out
FLAGS=-threaded -o $(OUT) -outputdir $(OUTDIR)

default:
	$(CC) $(FLAGS) $(SOURCES)

clean:
	rm -f *.hi *.o $(OUT)