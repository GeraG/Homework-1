pragma solidity ^0.4.16;


contract Greeter {
<<<<<<< HEAD
    /* Add one variable to hold our greeting */
    string greeting;
    uint greetCounter;

    event Send(string _greeting);

    function Greeter(string _greeting) public {
        /* Write one line of code for the contract to set our greeting */
        greeting = _greeting;
        greetCounter = 0;
    }

    function greet() constant returns (string)  {
        /* Write one line of code to allow the contract to return our greeting */
        greetCounter += 1;
        Send(greeting);
        return greeting;
    }

    function () {}
=======
	/* Add one variable to hold our greeting */
	string greeting;

	function Greeter(string _greeting) public {
		/* Write one line of code for the contract to set our greeting */
	}

	function greet() constant returns (string)  {
		/* Write one line of code to allow the contract to return our greeting */
	}

	/* Add a fallback function to prevent contract payability and non-existent function calls */
	
>>>>>>> 00969dd846907c177e17b2d9766a5c1b7411c4d0
}
