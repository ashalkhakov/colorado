# Colorado

This is a library for doing colored printing in a terminal.

## Use

````ats
println!(fg(reset(),RED), "this text is red!", reset());
println!(fg(bg(reset(),RED),YELLOW), "this text is yellow on red", reset())
````

