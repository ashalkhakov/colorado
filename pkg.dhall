let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall

in λ(x : List Integer) → 
  prelude.makePkgDescr
  { x = x
  , name = "colorado"
  , githubUsername = "ashalkhakov"
  , description = "Colored text output"
  }
