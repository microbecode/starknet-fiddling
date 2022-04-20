%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.math import assert_le

@storage_var
func mintsLeft() -> (mints : felt):
end

@storage_var
func previousMint() -> (mint : felt):
end

@constructor
func constructor{
        syscall_ptr : felt*, 
        pedersen_ptr : HashBuiltin*,
        range_check_ptr
    }():
    mintsLeft.write(1000)
    return ()
end

@external
func mintNext{
        syscall_ptr : felt*, 
        pedersen_ptr : HashBuiltin*,
        range_check_ptr
    }() -> ():
    let left : felt = mintsLeft.read()
    let mintAmount = left / 2

    with_attr error_message("Nothing left to mint"):
        assert_le(0, mintAmount) # Make sure we get something
    end

    let remains = left - mintAmount
    mintsLeft.write(remains)
    previousMint.write(mintAmount)

    # TODO: add minting functionality here

    return ()
end

@view 
func getPreviousMint{
        syscall_ptr : felt*, 
        pedersen_ptr : HashBuiltin*,
        range_check_ptr
    }() -> (amount : felt):
    let am : felt = previousMint.read()
    return (am)
end
