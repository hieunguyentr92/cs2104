-- Haskell program to simulate digital circuits
--
--  a signal is an infinite list of Bool; each element 
--     represents the value of the signal for a specific
--     clock cycle
--
--  logic gates are higher order functions that take
--     signals as arguments and output a signal ;
--     each gate also has a certain delay
--
--  complex circuits, like the /SR NAND latch given below
--     are obtained by connecting inputs and outputs of gates
--     through signals, which are transmitted by wires ;
--     thus, there will be a signal for every wire in the circuit

module Sim where

-- the signal that is always on "High"
high::[Bool]
high = True:high

-- the signal that is always on "Low"
low::[Bool]
low = False:low

-- create a limited list, of length "n", filled with logical value "fill"
-- useful to create signals by appending finite sequences
set :: Integer -> Bool -> [Bool]
set 0 _ = []
set n fill | n>0 = fill:(set (n-1) fill)

-- delay a signal by "n" clock cycles
--   prepends "n" instances of "fill" to the signal
delay :: Integer -> Bool -> [Bool] -> [Bool]
delay n fill s = (set n fill) ++ s

-- the inverter gate inverts every level for the entire signal,
-- and also delays the signal by one clock cycle
not_gate :: [Bool] -> [Bool]
not_gate s = delay 1 True (map not s)

-- a clock can be obtained by connecting an inverter's output to its input
--         |\       Clock
--      +--| >o----+--
--      |  |/      |
--      |          |
--      +----------+
clock :: [Bool]
clock = not_gate clock

-- and gate delays its output by 2 clock cycles
and_gate :: [Bool] -> [Bool] -> [Bool]
and_gate i1 i2 = delay 2 True (zipWith (&&) i1 i2)
                               -- "zipWith" is similar to map
							   -- but it takes a binary operator
							   -- and two lists, and produces
							   -- a list of results of the binary
							   -- operator being applied to corresponding
							   -- elements in the argument list
							   -- (&&) is the conjunction operator

--  A /SR latch (http://en.wikipedia.org/wiki/Latch_%28electronics%29)
--     is a device made up of 4 gates and 4 wires. Notice how the 
--     signals on the wires are defined in terms of outputs of the
--     corresponding gates.
--             ____
--     /S ----|    \   w1 |\       Q
--            |     |-----| >o----+--
--         +--|____/      |/      |
--         |                      |
--         +--------------------+ |
--                              | |
--         +-------------------- -+
--         |   ____             |
--         +--|    \   w2 |\    |  /Q
--            |     |-----| >o--+----
--     /R ----|____/      |/
--

srneg_latch :: [Bool]->[Bool]->[Bool]
srneg_latch s r = 
  let (q,qbar,w1,w2) = (not_gate w1,not_gate w2,and_gate s qbar,and_gate r q) in q

  
-- Consider now the following signals: (each dash represents 1 clock cycle)
--
--                +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--  /S      6     |
--     -+-+-+-+-+-+  
--
--     -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+           +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
--  /R            15                |     6     |
--                                  +-+-+-+-+-+-+
--
--  The following expression, when evaluated at the top level (you will have to cut and paste), 
--  will return the the Q signal of the latch for the first 40 clock cycles
--
--  take 40 (srneg_latch ((set 6 False)++high) (set 15 True)++(set 6 False)++high)

--JK Flip Flop take in 3 inputs: J, C and K
--The J and K ends always take in High from the high stream
--The C end is fed by the Clock stream
--Outputs via the Q end
--We are not interested in the Qbar end
--Let's assume Q is all init to 0

--  Various Modes for JK Flip Flop
--    J  |  K  | Q
--  ---------------------------
--    0  |  0  | No Change to Q
--    0  |  1  | Set Q=0
--    1  |  0  | Set Q=1
--    1  |  1  | Toggle Q

--jkflipper j c k q
jkflipper :: Bool -> Bool -> Bool -> Bool -> Bool
jkflipper False True False q = q
jkflipper False False False q = q
jkflipper False True True q = False
jkflipper False False True q = q
jkflipper True True False q = True
jkflipper True False False q = q
jkflipper True True True q = not q
jkflipper True False True q = q

--Takes in J C K, outputs Q
--Has Q initialized with one False
--Returns a list that looks like this: [False, ...] because Q for each gate is initialized to False
jk_gate :: [Bool] -> [Bool] -> [Bool] -> Bool -> [Bool]
jk_gate (j:js) (c:cs) (k:ks) q = q:(jk_gate js cs ks (jkflipper j c k q))

jk_zipper :: (a -> b -> c -> d -> e) -> [a] -> [b] -> [c] -> [d] -> [e]
jk_zipper z (a:as) (b:bs) (c:cs) (d:ds) = z a b c d : jk_zipper z as bs cs ds

jkflipflop :: [Bool] -> [Bool] -> [Bool] -> [(Bool,Bool,Bool,Bool)]
jkflipflop j c k = let (q1,q2,q3,q4) = (jk_gate j c k False, jk_gate q1 c q1 False, jk_gate (and_gate q1 q2) c (and_gate q1 q2) False, jk_gate (and_gate (and_gate q1 q2) q3) c (and_gate (and_gate q1 q2) q3) False) in jk_zipper (\p q r s -> (s,r,q,p)) q1 q2 q3 q4