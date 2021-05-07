## Warnings [how to run]

branch `mathc-v1` utilize `vyper 0.2.12`

If pip can't find 0.2.12, just git clone then `python setup.py install` locally.

Env:

    mac
    python3.6

## I'm in 2021, Why I upgrade uniswap that was written in 2019 ?

Because:

    Old toolchain not compile, 1.x vyper has lots of bugs, missing types when run..

    My mac won't install old version 0.1.x vyper...

    There is not easy sandbox to test contract in python DSL (vyper...)

    I can practice rewriting ERC20, Uniswap a bit like I did here !

## Why v1 is bad

In whitepaper,

"Uniswap can be frontrun to some extent. This is bounded by user set minimum/maximum values and transaction deadlines"


## Future

read pdf in root dir

[VB original idea](./amm.md) with my comments.

[whitepaper](https://hackmd.io/C-DvwDSfSxuh-Gd4WKE_ig) has more examples

[reading](https://consensys.net/blog/developers/solidity-best-practices-for-smart-contract-security/) best sol practice

[formal-verification](https://github.com/runtimeverification/verified-smart-contracts/blob/uniswap/uniswap/x-y-k.pdf) proof, math

----

* Website: [uniswap.io/](https://uniswap.io/)
* Docs: [docs.uniswap.io/](https://docs.uniswap.io/)
* Twitter: [@UniswapExchange](https://twitter.com/UniswapExchange)
* Reddit: [/r/Uniswap/](https://www.reddit.com/r/UniSwap/)
* Email: [contact@uniswap.io](mailto:contact@uniswap.io)
* Slack: [uni-swap.slack.com/](https://join.slack.com/t/uni-swap/shared_invite/enQtNDYwMjg1ODc5ODA4LWEyYmU0OGU1ZGQ3NjE4YzhmNzcxMDAyM2ExNzNkZjZjZjcxYTkwNzU0MGE3M2JkNzMxOTA2MzE2ZWM0YWQwNjU)
* Whitepaper: [Link](https://hackmd.io/C-DvwDSfSxuh-Gd4WKE_ig)

## Installation:

#### Requires [Python 3](https://www.python.org/download/releases/3.0/)

1) Clone Uniswap
```
$ git clone https://github.com/Uniswap/contracts-vyper
$ cd contracts-vyper
```

2) Setup virtual environment
```
$ pip3 install virtualenv
$ virtualenv -p python3 env
$ source env/bin/activate
```

3) Install dependencies
```
pip install -r requirements.txt
```

4) (Optional) Switch Vyper compiler to version used in Uniswap [verification](https://github.com/runtimeverification/verified-smart-contracts/tree/uniswap/uniswap)
```
cd vyper
git reset --hard 35038d20bd9946a35261c4c4fbcb27fe61e65f78
cd ..
```

5) Run tests
```
$ pytest -v tests/
```
