/-
  IntegrinAdhesion.Proofs
  ~~~~~~~~~~~~~~~~~~~~~~~

  Formalization of textbook facts about integrins and leukocyte
  extravasation, as studied by Timothy Springer and colleagues
  (1980s onward).  All numeric claims are expressed over `Nat`
  so that they can be closed by `decide`/`simp`/`omega` without
  Mathlib.
-/

namespace IntegrinAdhesion

-- ============================================================================
-- 1. The integrin family
-- ============================================================================

/-- Human integrin heavy-chain (alpha) subunits, textbook count: 18. -/
def numAlphaSubunits : Nat := 18

/-- Human integrin light-chain (beta) subunits, textbook count: 8. -/
def numBetaSubunits : Nat := 8

/-- Number of known, expressed alpha-beta heterodimers in humans: 24. -/
def numKnownHeterodimers : Nat := 24

/-- Upper bound on possible pairings: 18 * 8 = 144. -/
def maxPairings : Nat := numAlphaSubunits * numBetaSubunits

theorem maxPairings_value : maxPairings = 144 := by
  simp [maxPairings, numAlphaSubunits, numBetaSubunits]

theorem knownSubsetOfPossible : numKnownHeterodimers ≤ maxPairings := by
  simp [numKnownHeterodimers, maxPairings, numAlphaSubunits, numBetaSubunits]

-- ============================================================================
-- 2. Alpha-subunit landmark names used by Springer
-- ============================================================================

/-- Named alpha subunits relevant to Springer's work. -/
inductive AlphaSubunit : Type
  | alphaL  -- CD11a, pairs with beta2 -> LFA-1
  | alphaM  -- CD11b, pairs with beta2 -> Mac-1 / CR3
  | alphaX  -- CD11c, pairs with beta2 -> CR4
  | alpha4  -- pairs with beta1 -> VLA-4, with beta7 -> LPAM-1
  | alphaIIb -- CD41, pairs with beta3 -> GPIIb/IIIa on platelets
  | other

/-- Named beta subunits. -/
inductive BetaSubunit : Type
  | beta1   -- VLA family
  | beta2   -- leukocyte adhesion family (LFA-1, Mac-1, ...)
  | beta3   -- platelet / vitronectin family
  | beta7   -- gut-homing
  | other

/-- A named integrin heterodimer. -/
inductive Integrin : Type
  | mk : AlphaSubunit -> BetaSubunit -> Integrin

/-- LFA-1 = alphaL beta2, the molecule Springer cloned in 1986-1987. -/
def lfa1 : Integrin := .mk .alphaL .beta2

/-- Mac-1 (CR3) = alphaM beta2. -/
def mac1 : Integrin := .mk .alphaM .beta2

/-- VLA-4 = alpha4 beta1, the target of natalizumab (Tysabri). -/
def vla4 : Integrin := .mk .alpha4 .beta1

/-- GPIIb/IIIa = alphaIIb beta3, the platelet fibrinogen receptor. -/
def gpiiibiiia : Integrin := .mk .alphaIIb .beta3

theorem lfa1_is_alphaL_beta2 : lfa1 = .mk .alphaL .beta2 := rfl

theorem vla4_is_alpha4_beta1 : vla4 = .mk .alpha4 .beta1 := rfl

theorem mac1_is_alphaM_beta2 : mac1 = .mk .alphaM .beta2 := rfl

-- ============================================================================
-- 3. The five-step leukocyte extravasation cascade
-- ============================================================================

/-- The canonical multistep adhesion cascade (Springer, 1994 review). -/
inductive ExtravasationStep : Type
  | tethering     -- 1. initial capture onto endothelium
  | rolling       -- 2. selectin-mediated rolling
  | activation    -- 3. chemokine-triggered inside-out signaling
  | firmAdhesion  -- 4. integrin-mediated arrest
  | transmigration -- 5. diapedesis through the endothelium

/-- Count of steps in the cascade. -/
def numSteps : Nat := 5

theorem numSteps_eq_five : numSteps = 5 := by
  simp [numSteps]

/-- Enumeration of all five steps. -/
def allSteps : List ExtravasationStep :=
  [.tethering, .rolling, .activation, .firmAdhesion, .transmigration]

theorem allSteps_length : allSteps.length = 5 := by
  simp [allSteps, List.length]

/-- Rolling is mediated by selectins (not integrins); firm adhesion by integrins. -/
def stepReceptor : ExtravasationStep -> String
  | .tethering     => "selectin / PSGL-1"
  | .rolling       => "selectin"
  | .activation    => "chemokine receptor (GPCR)"
  | .firmAdhesion  => "integrin (LFA-1 / VLA-4)"
  | .transmigration => "PECAM-1 / CD99"

theorem firmAdhesion_uses_integrin :
    stepReceptor .firmAdhesion = "integrin (LFA-1 / VLA-4)" := by
  simp [stepReceptor]

-- ============================================================================
-- 4. Leukocyte adhesion deficiency (LAD) and beta2 genetics
-- ============================================================================

/-- LAD type I is caused by loss of beta2 (CD18), which disables all
    beta2-containing integrins: LFA-1, Mac-1, CR4, alphaD beta2. -/
def numBeta2Integrins : Nat := 4

theorem lad_disables_four : numBeta2Integrins = 4 := by
  simp [numBeta2Integrins]

-- ============================================================================
-- 5. Clinical translation: natalizumab blocks VLA-4
-- ============================================================================

/-- Natalizumab (Tysabri) is a humanized IgG4 monoclonal antibody against
    the alpha4 subunit, used for relapsing-remitting multiple sclerosis and
    Crohn's disease.  It blocks VLA-4 (alpha4 beta1) and alpha4 beta7. -/
def natalizumabTargetAlpha : AlphaSubunit := .alpha4

theorem natalizumab_targets_alpha4 : natalizumabTargetAlpha = .alpha4 := rfl

end IntegrinAdhesion
