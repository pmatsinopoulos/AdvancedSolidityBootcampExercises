// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.18;

// import "forge-std/console.sol";

contract Level_2ArraySorting {
    function solution(
        uint256[10] calldata unsortedArray
    ) external pure returns (uint256[10] memory sortedArray) {
        //        9, 5, 1, 4, 7, 6, 10, 15, 3, 2
        //result: 0, 0, 0, 0, 0, 0, 0,   0, 0, 0

        // Algorithm scans unsortedArray once for each element
        // and tries to find the correct position in "result"
        // to put the value in. After having found the correct position
        // it moves all the other elements one position ahead.

        uint256[10] memory result;
        result[0] = unsortedArray[0];

        for (uint256 i = 1; i < 10; i++) {
            // console.log("********************** %d", i);
            uint256 j = 0;
            while (j < i && result[j] <= unsortedArray[i]) {
                j++;
                // console.log("------ %d", j);
            }
            // j points at an element in result which is > the
            // element at unsortedArray. Hence, I have to shift
            // all elements in result one position to the right.abi
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
                for (uint256 k = i; k >= j + 1; k--) {
                    // console.log(
                    //     "setting result k + 1 %d to have the value of k %d",
                    //     k + 1,
                    //     k
                    // );
                    result[k] = result[k - 1];
                }
                result[j] = unsortedArray[i];
            }
        }

        // for (uint i = 0; i < 10; i++) {
        //     console.log(result[i]);
        // }

        return result;
    }
}
