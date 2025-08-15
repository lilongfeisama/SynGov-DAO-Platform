### **SynGov DAO Platform** – *去中心化治理平台*

- **项目概述：** 为去中心化社区开发一套治理系统，支持提案发起、投票、延时执行等全流程链上治理操作。
- **技术亮点：**
  - 基于Compound Governor Bravo模型，集成OpenZeppelin Governor模块。
  - 实现了ERC20Votes投票权代理、治理提案阈值、投票延迟与执行延时。
  - 支持多角色治理（如：开发者、投资人）分权投票。
  - 引入Timelock机制增强治理操作安全性。
- **技术栈：** Solidity 0.8.x、Foundry、OpenZeppelin（Governor、TimelockController、ERC20Votes）、Web3.js。
- **本人职责：** 设计治理合约流程，定制扩展OpenZeppelin模块；实现提案生命周期管理（创建、投票、排队、执行），并进行治理模拟测试；编写脚本与前端对接，提高社区可用性。

## 使用说明
1. 安装 [Foundry](https://github.com/foundry-rs/foundry) 并执行 `forge install` 获取 OpenZeppelin 依赖。
2. 运行 `forge build` 编译合约，`forge test` 运行测试。
3. 部署脚本位于 `script/Deploy.s.sol`，可通过 `forge script` 执行。
