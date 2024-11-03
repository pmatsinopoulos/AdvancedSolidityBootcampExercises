// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;

import {Test} from "forge-std/Test.sol";

import {Level_2ArraySorting} from "../src/Level_2ArraySorting.sol";

contract Level_2ArraySortingTest is Test {
    Level_2ArraySorting level2;

    function setUp() public {
        level2 = new Level_2ArraySorting();
    }

    function test_case_1() public view {
        // [9,5,1,4,7,6,10,15,3,2]
        uint256[10] memory unsortedArray = [
            uint256(9),
            5,
            1,
            4,
            7,
            6,
            10,
            15,
            3,
            2
        ];

        uint256[10] memory sortedArray = level2.solution(unsortedArray);

        assertEq(sortedArray[0], 1);
        assertEq(sortedArray[1], 2);
        assertEq(sortedArray[2], 3);
        assertEq(sortedArray[3], 4);
        assertEq(sortedArray[4], 5);
        assertEq(sortedArray[5], 6);
        assertEq(sortedArray[6], 7);
        assertEq(sortedArray[7], 9);
        assertEq(sortedArray[8], 10);
        assertEq(sortedArray[9], 15);
    }

    function test_case_2() public view {
        uint256[10] memory unsortedArray = [
            uint256(1),
            2,
            3,
            4,
            5,
            6,
            7,
            9,
            10,
            15
        ];

        uint256[10] memory sortedArray = level2.solution(unsortedArray);

        assertEq(sortedArray[0], 1);
        assertEq(sortedArray[1], 2);
        assertEq(sortedArray[2], 3);
        assertEq(sortedArray[3], 4);
        assertEq(sortedArray[4], 5);
        assertEq(sortedArray[5], 6);
        assertEq(sortedArray[6], 7);
        assertEq(sortedArray[7], 9);
        assertEq(sortedArray[8], 10);
        assertEq(sortedArray[9], 15);
    }

    function test_case_3() public view {
        uint256[10] memory unsortedArray = [
            uint256(15),
            10,
            9,
            7,
            6,
            5,
            4,
            3,
            2,
            1
        ];

        uint256[10] memory sortedArray = level2.solution(unsortedArray);

        assertEq(sortedArray[0], 1);
        assertEq(sortedArray[1], 2);
        assertEq(sortedArray[2], 3);
        assertEq(sortedArray[3], 4);
        assertEq(sortedArray[4], 5);
        assertEq(sortedArray[5], 6);
        assertEq(sortedArray[6], 7);
        assertEq(sortedArray[7], 9);
        assertEq(sortedArray[8], 10);
        assertEq(sortedArray[9], 15);
    }

    function test_case_4() public view {
        uint256[10] memory unsortedArray = [
            uint256(15),
            2,
            3,
            4,
            5,
            6,
            7,
            9,
            10,
            1
        ];

        uint256[10] memory sortedArray = level2.solution(unsortedArray);

        assertEq(sortedArray[0], 1);
        assertEq(sortedArray[1], 2);
        assertEq(sortedArray[2], 3);
        assertEq(sortedArray[3], 4);
        assertEq(sortedArray[4], 5);
        assertEq(sortedArray[5], 6);
        assertEq(sortedArray[6], 7);
        assertEq(sortedArray[7], 9);
        assertEq(sortedArray[8], 10);
        assertEq(sortedArray[9], 15);
    }

    function test_case_5() public view {
        uint256[10] memory unsortedArray = [
            uint256(0),
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0,
            0
        ];

        uint256[10] memory sortedArray = level2.solution(unsortedArray);

        assertEq(sortedArray[0], 0);
        assertEq(sortedArray[1], 0);
        assertEq(sortedArray[2], 0);
        assertEq(sortedArray[3], 0);
        assertEq(sortedArray[4], 0);
        assertEq(sortedArray[5], 0);
        assertEq(sortedArray[6], 0);
        assertEq(sortedArray[7], 0);
        assertEq(sortedArray[8], 0);
        assertEq(sortedArray[9], 0);
    }
}
// TDD .... Test-Driven Development
