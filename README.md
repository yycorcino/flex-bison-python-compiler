## Challenges:

Using Flex is straight forward from matching regex patterns then returning a token. The token is then passed to Bison to match token of tokens to represent a syntax of the chosen language and in this case the Python syntax. Following, the first challenge is types in Bison. In Bison, some tokens and grammar rules require types, which I wasn't able to implement. The next challenge is re-looping and executing the body statement/s. Without the use of AST, I can only execute 1 statement, however the issue is that it didn't return to the loop and entered an idling state.

## Current State of Project:

The current state of this project is grammar syntax is being identified correctly, however the actions associated to the grammar is not set up properly. The current action of all grammar is hard coded to print the looping variable on every loop.

## To Run Project:

1. Link & Build of Flex and Bison

   `make`

2. Compile Source File

   `./compiler <source_file>`
   _Provided source files to use._

   1. `./compiler __test__/arithmeticOp.py `
   2. `./compiler __test__/flowControlOp.py `
   3. `./compiler __test__/trigonometricFunc.py `
