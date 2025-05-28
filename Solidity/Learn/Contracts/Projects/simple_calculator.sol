// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Calculator{

    uint private answer;

    function add(uint256 _a, uint256 _b) public returns (uint256) { return answer = _a + _b;}
    function substract(uint256 _a, uint256 _b) public returns (uint256) { return answer =  _a - _b;}
    function multiply(uint256 _a, uint256 _b) public returns (uint256) { return answer =  _a * _b;}
    function divide(uint256 _a, uint256 _b) public returns (uint256) { return answer =  _a / _b;}

    function get() public view returns (uint256) { return answer;}
}