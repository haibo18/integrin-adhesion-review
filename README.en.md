# integrin-adhesion-review

Integrin & leukocyte adhesion cascade review + Lean 4 formalization skeleton.

**中文版：[README.md](./README.md)**

This repository collects the research output, conclusions, and machine-checkable
formalization of "Timothy Springer and the integrin immune adhesion receptors",
maintained under Semantic Versioning with bilingual Chinese/English documents.

## Layout

```
integrin-adhesion-review/
├── paper/
│   ├── integrin_adhesion_review.md    # 中文综述
│   └── integrin_adhesion_review_en.md  # English review
├── IntegrinAdhesion.lean              # Lean library root
├── IntegrinAdhesion/
│   ├── Basic.lean
│   └── Proofs.lean                     # family counts / 5-step cascade / representative heterodimers
├── lakefile.toml
├── lean-toolchain
├── lake-manifest.json
├── .github/workflows/                  # Lean CI
├── CHANGELOG.md
└── README.md / README.en.md
```

## Highlights

- **Principle**: under blood-flow shear, leukocytes follow a five-step cascade — selectin rolling → chemokine activation → high-affinity integrin binding ICAM/VCAM → firm adhesion → transmigration — to enter inflamed tissue.
- **Milestones**: 1982 LFA-1 identified; 1984 LAD-I patients lack β2 (CD18); 1986–87 LFA-1 cloned, integrin family defined; 1994 Springer multistep adhesion cascade paradigm.
- **Family**: 18 α + 8 β subunits encode 144 theoretical pairings; 24 heterodimers actually expressed.
- **Representative integrins**: LFA-1 (αLβ2), Mac-1 (αMβ2), VLA-4 (α4β1), GPIIb/IIIa (αIIbβ3).
- **Translation**: natalizumab (Tysabri, anti-α4) for MS and Crohn's disease; abciximab (ReoPro, anti-GPIIb/IIIa) anti-platelet.
- **Human genetics**: LAD-I (ITGB2 mutation) abolishes all four β2 integrins, causing recurrent bacterial infection.
- **Prize case**: candidate for the 2027 Nobel Prize in Physiology or Medicine; central figure Timothy A. Springer.

## Lean formalization

Toolchain: `leanprover/lean4:v4.36.0`, core library only, **no Mathlib**.

Build:

```bash
lake build
```

The formalization only covers **numerically decidable** claims:

1. Family count: 18 × 8 = 144 theoretical pairings; 24 actual heterodimers are a subset;
2. Five-step cascade `ExtravasationStep` with `allSteps.length = 5`;
3. Representative integrins: LFA-1 = αLβ2, Mac-1 = αMβ2, VLA-4 = α4β1;
4. Firm adhesion step is integrin-mediated;
5. LAD-I abolishes all four β2 integrins;
6. Natalizumab targets α4.

> Immunology and clinical conclusions are sourced from peer-reviewed
> literature; this project does not treat biological mechanisms as arithmetically
> provable. There are **zero** `sorry` / `admit` / `axiom`.

## Bilingual version management

- Papers: `paper/integrin_adhesion_review.md` (Chinese) and `paper/integrin_adhesion_review_en.md` (English) are kept in sync;
- Docs: `README.md` (Chinese) and `README.en.md` (English) cross-link each other;
- Changelog: `CHANGELOG.md` keeps both Chinese and English paragraphs;
- When revising the paper, update both language versions in the same commit, tagged `docs(zh)` / `docs(en)`.

## Versioning

- Semantic Versioning (`MAJOR.MINOR.PATCH`).
- All notable changes are recorded in [`CHANGELOG.md`](CHANGELOG.md).
- `main` is the trunk; commits use Conventional Commits.
- Each release baseline is tagged `vX.Y.Z`.

## References

See the "References" section at the end of the review papers.
