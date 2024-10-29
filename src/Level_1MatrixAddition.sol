// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

contract Level_1MatrixAddition {
    function solution(
        uint256[2][3] calldata x,
        uint256[2][3] calldata y
    ) external pure returns (uint256[2][3] memory) {
        assembly {
            let result := mload(0x40) // this is where the return value will start from.

            for {
                let i := 0
            } lt(i, 6) {
                i := add(i, 1)
            } {
                let itemxPos := add(0x04, mul(i, 0x20))

                let itemx := calldataload(itemxPos) // x[0][0] (i, j)

                let itemyPos := add(itemxPos, 192) // 192 size of X or Y table

                let itemy := calldataload(itemyPos) // y[0][0]

                // add and store result
                let pointer := mload(0x40)
                mstore(pointer, add(itemx, itemy))
                // prepare free memory pointer for next
                mstore(0x40, add(pointer, 0x20))
            }

            return(result, mul(6, 0x20))
        }
    }
}
