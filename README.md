<br> 
<!-- PROJECT LOGO -->
<div align="center">
  <img src="https://img.shields.io/badge/Python-2496ED?style=for-the-badge&logo=Python&logoColor=white" alt="Python">
  
  <h3 align="center">Mini Python Interpreter</h3>

  <p align="center">
    A intricate Python interpreter using CLI to process Python syntax.
  </p>
</div>

<!-- ABOUT THE PROJECT -->

## About The Project

This mini interpreter is capable of intaking Python syntax and producing a relatively similar response to Python. Utilizing `"flex & bison"` authored by John R. Levine, I converted its original implementation to match more of Python syntax rather then a calculator. The major challenge of creating this interpreter is using Flex and Bison in parallel with the abstract syntax tree. No references exist in the implementation without AST.

<!-- GETTING STARTED -->

## Getting Started

Installing and configuring Flex and Bison using Docker.

### Prerequisites

_Have Docker pre-installed into your operating system._

- Using [CLI Command](https://docs.docker.com/engine/install/ubuntu/) for Ubuntu
  ```
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  ```

### Installation

_Below is an example of how you download this project and start using Docker._

1. Clone the repo
   ```
   git clone <repo_url>
   ```
2. Go into the Project Repository
   ```
   cd /path/to/repository
   ```
3. Build Image
   ```
   sudo docker build -t compiler-image .
   ```
4. Run Container
   ```
   sudo docker run -it compiler-image
   ```
5. Run Test inside Container
   ```
   $ make
   $ ./interpreter <source_file>
   ```

<!-- USAGE EXAMPLES -->

## Usage

_Test arithmetic, flow control, or trig operations by inputting Python syntax._

```
$ make
$ ./compiler
$ >>> <insert valid Python syntax>
```

_Remove all generated files._

```
make clean
```

## Usage Example

_Example of arithmetic operations._

```
$ >>> print(4 + 7)
$ = 11
$ >>> print(20 - 7)
$ = 13
$ >>> print(4 + 1 - 6 * 100 / 70)
$ = -3.571
```

_Example of flow control operations._

```
$ >>> def addition(a, b): print(a + b)
$ Defined addition
$ >>> addition(1, 2)
$ = 3
```

```
$ >>> i = 5
$ >>> b = 6
$ if (i == b): print(i) else: print(b)
$ = 6
```

```
$ >>> i = 5
$ while (i > 0): print(i) i = i - 1
$ = 5
$ = 4
$ = 3
$ = 2
$ = 1
```

_Example of trig operations._

```
$ >>> print(math.sqrt(16))
$ = 4
$ >>> print(math.exp(8))
$ = 2981
$ >>> print(math.log(20))
$ = 2.996
$ >>> print(math.sin(100))
$ = -0.5064
$ >>> print(math.cos(100))
$ = 0.8623
$ >>> print(math.tan(100))
$ = -0.5872
```
