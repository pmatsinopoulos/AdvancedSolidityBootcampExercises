// SPDX-License-Identifier
pragma solidity 0.8.27;

import {Test} from "forge-std/Test.sol";
import {Level_1MatrixAddition} from "../src/Level_1MatrixAddition.sol";

contract Level_1MatrixAdditionTest is Test {
    Level_1MatrixAddition matrixAddition;

    function setUp() public {
        matrixAddition = new Level_1MatrixAddition();
    }

    function test_matrix_addition_case_1() public view {
        uint256[2][3] memory x = [
            [uint256(1), 2],
            [uint256(3), 4],
            [uint256(5), 6]
        ];
        uint256[2][3] memory y = [
            [uint256(1), 2],
            [uint256(3), 4],
            [uint256(5), 6]
        ];

        uint256[2][3] memory result = matrixAddition.solution(x, y);

        // assertEq(result.length, 3);
        assertEq(result[0][0], 2);
        assertEq(result[0][1], 4);

        assertEq(result[1][0], 6);
        assertEq(result[1][1], 8);

        assertEq(result[2][0], 10);
        assertEq(result[2][1], 12);
    }
}
