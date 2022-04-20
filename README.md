# Minter

This is a minting contract where each minter gets only half of the remaining tokens. Early bird catches the worm!

For simplicity this only includes the core functionality. The actual asset minting functionality is left out.

# Test

Compiles, deploys and tests the minter with two mints. Prints the two performed mints.

Remember to activate your Python venv first.

1. Run node: `nile node`
1. Run: `rm -f 127.0.0.1.deployments.txt && nile compile && nile deploy Minter --alias m && nile invoke m mintNext && nile call m getPreviousMint && nile invoke m mintNext && nile call m getPreviousMint`
