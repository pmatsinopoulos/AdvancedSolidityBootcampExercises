// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.27;

contract Level_2ArraySorting {
    function solution(
        uint256[10] calldata unsortedArray
    ) external pure returns (uint256[10] memory sortedArray) {
        // Algorithm scans unsortedArray once for each element
        // and tries to find the correct position in "result"
        // to put the value in. After having found the correct position
        // it moves all the other elements one position ahead.

        // CALLDATA
        //
        // The calldata is of size 320 bytes (10 x 32) and each word
        // corresponds to the uint256 of the unsortedArray input
        //
        // MEMORY
        //
        // Note that Memory is initially occupied by the +sortedArray+,
        // i.e. the 10 first words in Memory from 0x80 are used for the
        // sortedArray

        assembly {
            // sortedArray[0] = unsortedArray[0]
            // note that 0x04 bytes are for the
            // function selector. So skip them.
            calldatacopy(0x80, 0x04, 0x20)
        }

        for (uint256 i = 1; i < 10; i++) {
            uint256 j = 0;
            while (j < i && sortedArray[j] <= unsortedArray[i]) {
                j++;
            }
            // j points at an element in result which is > the
            // element at unsortedArray. Hence, I have to shift
            // all elements in result one position to the right
            // OR
            // j points after the end of the result
            // which means that all elements in result are less than
            // the unsortedArray[i]. In that case we don't do anything
            // console.log(
            //     "j %d position of an element which is greater than %d",
            //     j,
            //     unsortedArray[i]
            // );

            if (j < 10) {
                // for (uint256 k = i; k >= j + 1; k--) {
                //     sortedArray[k] = sortedArray[k - 1];
                // }
                assembly {
                    mcopy(
                        add(0x80, mul(0x20, add(j, 1))),
                        add(0x80, mul(0x20, j)),
                        mul(0x20, sub(i, j))
                    )

                    calldatacopy(
                        add(0x80, mul(0x20, j)),
                        add(0x04, mul(0x20, i)),
                        0x20
                    ) //sortedArray[j] = unsortedArray[i];
                }
            }
        }
    }
}
