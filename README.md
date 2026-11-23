# integrin-adhesion-review

整合素与白细胞多步黏附级联综述论文 + Lean 4 形式化核验骨架。

本仓库沉淀「Timothy Springer 与整合素免疫黏附受体」课题的
研究内容、结论与可机器核验的形式化命题，按语义化版本持续维护。

## 目录结构

```
integrin-adhesion-review/
├── paper/
│   └── integrin_adhesion_review.md   # 完整综述论文
├── IntegrinAdhesion.lean              # Lean 库根模块
├── IntegrinAdhesion/
│   ├── Basic.lean
│   └── Proofs.lean                    # 家族计数 / 五步级联 / 代表性异二聚体
├── lakefile.toml
├── lean-toolchain
├── lake-manifest.json
├── .github/workflows/                 # Lean CI
├── CHANGELOG.md
└── README.md
```

## 论文要点

- **原理**：白细胞在血流剪切力下，通过选择素滚动 → 趋化因子激活 → 整合素高亲和力结合 ICAM/VCAM → 牢固黏附 → 游出，五步级联进入炎症组织。
- **里程碑**：1982 鉴定 LFA-1；1984 LAD-I 患者缺 β2（CD18）；1986–87 克隆 LFA-1，确立整合素家族；1994 Springer 提出多步黏附级联范式。
- **家族**：人基因组编码 18 个 α 亚基 + 8 个 β 亚基，理论配对 144 种，实际表达 24 种异二聚体。
- **代表整合素**：LFA-1 (αLβ2)、Mac-1 (αMβ2)、VLA-4 (α4β1)、GPIIb/IIIa (αIIbβ3)。
- **临床转化**：那他珠单抗（Tysabri，抗 α4）治疗多发性硬化与克罗恩病；阿昔单抗（ReoPro，抗 GPIIb/IIIa）抗血小板。
- **人类遗传学**：LAD-I（ITGB2 突变）使 4 种 β2 整合素全部失活，反复细菌感染。
- **奖项**：2027 年诺贝尔生理学或医学奖候选方向，核心人物 Timothy A. Springer。

## Lean 形式化工程

工具链：`leanprover/lean4:v4.36.0`，仅依赖核心库，**无 Mathlib**。

构建：

```bash
lake build
```

形式化只覆盖论文中**可数值判定**的陈述：

1. 家族计数：18 × 8 = 144 种理论配对；24 种实际异二聚体是其子集；
2. 五步级联枚举 `ExtravasationStep` 与 `allSteps.length = 5`；
3. 代表整合素定义：LFA-1 = αLβ2、Mac-1 = αMβ2、VLA-4 = α4β1；
4. 牢固黏附步由整合素介导；
5. LAD-I 缺失 4 种 β2 整合素；
6. 那他珠单抗靶向 α4。

> 免疫学生物学机制与临床结论以同行评审文献为准；本工程不把
> 病理机制当作可由算术证明的命题。工程内 `sorry` / `admit` /
> `axiom` 数量为 0。

## 版本维护

- 遵循语义化版本（SemVer）：`MAJOR.MINOR.PATCH`。
- 所有显著变更记录于 [`CHANGELOG.md`](CHANGELOG.md)。
- `main` 为主干分支；论文修订、形式化补充、依赖升级分别提交，提交信息
  采用 Conventional Commits（`feat:` / `docs:` / `fix:` / `chore:` 等）。
- 每个发布基线打 Git tag：`vX.Y.Z`。

## 参考文献

见论文末尾「参考文献」一节。
