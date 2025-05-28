// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LessonArrays {
    uint[] numbers;

    // Push method to add an element at the end of our array
    function arr(uint value) public {
        numbers.push(value); // array in solidity is a dynamic data structure
    }

    // Function to retrieve an array element by index
    function getArrayByIndex(uint x) public view returns (uint) {
        return numbers[x];
    }

    // Function to retrieve the array
    // This is a special function which does not require any external call
    function getArray() public view returns (uint[] memory) {
        return numbers;
    }

}