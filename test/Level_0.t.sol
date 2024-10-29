// SPDX-License-Indentifier: MIT
pragma solidity 0.8.27;

import {Test} from "forge-std/Test.sol";
import {Level_0} from "../src/Level_0.sol";

contract Level_0Test is Test {
    Level_0 level0;

    function setUp() public {
        level0 = new Level_0();
    }

    function test_solution_returns_42() public view {
        assertEq(level0.solution(), 42);
    }
}
