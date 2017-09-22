pragma solidity ^0.4.16;


contract Fibonacci {
    mapping (uint => uint) public fibResults;
    uint lastPositionCalculated;
    
    function Fibonacci() public {
        fibResults[0] = 0;
        fibResults[1] = 1;
        lastPositionCalculated = 1;
    }
    
    event publishFib(uint result);
    
    function calculate(uint position) returns (uint result) {
        /* Carry out calculations to find the nth Fibonacci number */
        // result = calcMathematically(position); // optimal O(1), thus potentially uses much less gas for large positions
        result = calcSequentially(position);
        publishFib(result);
    }

    function calcSequentially(uint position) private returns (uint result) {
        if (position == 0)
            result = 0;
        else if (position == 1)
            result = 1;
        else if (position <= lastPositionCalculated)
            result = fibResults[position];
        else {
            while (lastPositionCalculated < position) {
                lastPositionCalculated += 1;
                fibResults[lastPositionCalculated] = fibResults[lastPositionCalculated - 1] + fibResults[lastPositionCalculated - 2];
            }
            result = fibResults[position];
        }
    }
    
    function calcMathematically(uint position) private returns (uint result) {
        if (position == 0) {
            result = 0;
            return;
        } else if (fibResults[position] > 0) {
            result = fibResults[position];
            return;
        }
        
        fixed goldenRatio = (1 + sqrt(5)) / 2;
        result = uint((pow(goldenRatio, int(position)) - (1 / pow(-goldenRatio, int(position)))) / sqrt(5));
    }
    
    function sqrt(int n) private returns (fixed)
    {
      // Babylonian square root
      // Use n as initial approximation
      fixed x = fixed(n);
      fixed y = 1;
      fixed e = 0.0000001; /* e decides the accuracy level*/
      while(x - y > e)
      {
        x = (x + y) / 2;
        y = fixed(n) / x;
      }
      return x;
    }
    
    function pow(fixed base, int exp) private returns (fixed)
    {
        fixed result = 1;
        while (exp > 0) {
            if (exp & 1 == 1) {
                result *= base;
            }
            base *= base;
            exp /= 2;
        }

        return result;
    }

    /* Add a fallback function to prevent contract payability and non-existent function calls */
    
    function () {}
}
