let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall

in

let lib =
  prelude.staticLib //
  { name = "colorado"
  , src = [ "src/mylibies_link.hats" ]
  }

in prelude.default //
  { test = 
    [ prelude.bin //
      { src = "test/colorado.dats"
      , target = "target/test"
      }
    ]
  }
