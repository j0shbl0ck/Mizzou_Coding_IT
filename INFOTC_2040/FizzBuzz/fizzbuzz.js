
var i;
for (i = 0; i < 101; i++){
	if (i % 15 == 0){
		document.write("FizzBuzz");
	else if (i % 3 == 0)
		document.write("Fizz");
	else if (i % 5 == 0)
		document.write("Buzz");
	else document.write(i);
	}
