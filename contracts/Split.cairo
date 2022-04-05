%lang starknet

@view
func split(amount : felt) -> (part1 : felt, part2 : felt):
    let part1 = amount / 2
    let part2 = amount / 2
    return (part1, part2)
end
