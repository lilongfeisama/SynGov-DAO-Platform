# 合约接口文档

本文档描述了 SynGov DAO 平台中核心合约的接口。

## SynGovToken
基于 OpenZeppelin `ERC20Votes` 实现的治理代币，可委托投票权。

### 构造函数
`constructor(string name, string symbol)`
- 初始化代币名称与符号，同时启用 EIP-2612 Permit 功能。

### 外部函数
`mint(address to, uint256 amount)`
- 向指定地址铸造代币，用于演示或测试环境。

## SynGovernor
基于 OpenZeppelin Governor 模块的治理合约，结合 `TimelockController` 完成提案的投票与执行。

### 构造函数
`constructor(
    ERC20Votes token,
    TimelockController timelock,
    uint256 votingDelay,
    uint256 votingPeriod,
    uint256 proposalThreshold,
    uint256 quorumFraction
)`
- `token`：治理代币地址。
- `timelock`：用于延时执行的 Timelock 控制器。
- `votingDelay`：提案创建到投票开始的区块延迟。
- `votingPeriod`：投票持续的区块数。
- `proposalThreshold`：创建提案所需的最小投票权数量。
- `quorumFraction`：提案通过所需的法定人数比例（以百分比计算）。

### 主要外部函数
`votingDelay() -> uint256`
- 返回投票延迟。

`votingPeriod() -> uint256`
- 返回投票持续时间。

`quorum(uint256 blockNumber) -> uint256`
- 返回指定区块号的法定人数。

`getVotes(address account, uint256 blockNumber) -> uint256`
- 查询账户在指定区块的投票权数量。

`state(uint256 proposalId) -> ProposalState`
- 返回提案的当前状态。

`propose(address[] targets, uint256[] values, bytes[] calldatas, string description) -> uint256`
- 创建新提案，并返回提案 ID。

`supportsInterface(bytes4 interfaceId) -> bool`
- 检查合约是否支持某接口。

### 状态变量
`TimelockController public immutable timelock`
- 提案执行时使用的 Timelock 控制器。

