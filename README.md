# MAC x MAPS Introduction to Functional Programming Workshop

Run `stack test` to test parts 1 to 3.

- `stack test --test-arguments 1`: only test part 1
- `stack test --test-arguments 2`: only test part 2
- `stack test --test-arguments 3`: only test part 3

For part 3, run `stack run` to try out the calculator.

If you want more things to do, there are extra bonus tasks in `Bonus.hs`.
Run `stack test --test-arguments bonus` to run the tests for these.

Solutions will be available on the [solutions branch](https://github.com/cherryblossom000/mac-x-maps-haskell-workshop/tree/solutions) by the end of this week.

## Windows Issues

If you get an error like this

```none
Error: [S-7282]
       Stack failed to execute the build plan.

       While executing the build plan, Stack encountered the following errors:

       <stderr>: commitAndReleaseBuffer: invalid argument (invalid character)
```

<sup>(windows moment)</sup>

Go to Settings → Time and Language → Language and Region → Administrative
language Settings → Change System Locale… → and check Use Unicode UTF-8. You
might need to restart your computer.
