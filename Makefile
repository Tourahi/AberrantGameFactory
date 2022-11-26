
LOVE = love
MOON = moonc
SOURCE_PATH = ./src

all: compile_moon agf


agf:
	${LOVE} ${SOURCE_PATH}

compile_moon:
	@find ${SOURCE_PATH} -name '*.moon' | xargs ${MOON}

clean:
	@find ${SOURCE_PATH} -name '*.lua' | xargs rm
