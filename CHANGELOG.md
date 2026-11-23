# Changelog

本仓库所有显著变更均记录于此。格式遵循
[Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)，
版本号遵循 [Semantic Versioning](https://semver.org/lang/zh-CN/)。
All notable changes are recorded here; format follows
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
versioning follows [Semantic Versioning](https://semver.org/).

## [0.2.0] - 2026-11-24

### Added

- 英文版综述 `paper/integrin_adhesion_review_en.md`（与中文 `integrin_adhesion_review.md` 内容对齐）。
- 英文项目说明 `README.en.md`，与中文 `README.md` 互相链接。
- Added English review `paper/integrin_adhesion_review_en.md` and English README `README.en.md`, kept in sync with the Chinese versions.

### Changed

- 中文 `README.md` 顶部增加英文版链接。
- Chinese `README.md` now links to the English version.

## [0.1.0] - 2026-11-24

### Added

- 综述论文 `paper/integrin_adhesion_review.md`：整合素家族结构、
  白细胞多步黏附级联（Springer 1994 范式）、LAD-I 人类遗传学验证、
  那他珠单抗与阿昔单抗临床转化、2027 年诺贝尔生理学或医学奖候选
  潜质评估。
- Lean 4 形式化工程 `IntegrinAdhesion/`（工具链 `leanprover/lean4:v4.36.0`，核心库）：
  - 家族计数 `numAlphaSubunits = 18`、`numBetaSubunits = 8`、
    `maxPairings = 144`、`numKnownHeterodimers = 24`；
  - 亚基与异二聚体归纳类型 `AlphaSubunit` / `BetaSubunit` / `Integrin`；
  - 代表整合素 `lfa1 = αLβ2`、`mac1 = αMβ2`、`vla4 = α4β1`、
    `gpiiibiiia = αIIbβ3`；
  - 五步级联 `ExtravasationStep` 与 `allSteps.length = 5`；
  - 牢固黏附步由整合素介导的命题；
  - LAD-I 缺失 4 种 β2 整合素；
  - 那他珠单抗靶向 α4。
- GitHub Actions Lean CI（`leanprover/lean-action`）。
- 仓库说明 `README.md` 与本变更日志。

### Verification

- `lake build`：`Build completed successfully`，`errors=0`，`warnings=0`。
- `sorry` / `admit` / `axiom`：0 处。
