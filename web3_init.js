function web3_load(){
	
	var web3 = new Web3(new Web3.providers.HttpProvider("https://rinkeby.infura.io/v3/21f8b7326a844fa38e7a56776aeb2151"));
	
	var address = "0x3Abe5a1ED365496D09D302a807854D06B4A3EFb9";
	var contract = web3.eth.contract(abi["account"]);
	var contractInst = contract.at(address);
	var ans = "";
	contractInst._name(function(error, result){
		ans = result;
		document.getElementById("answer").innerHTML = ans;
	});
	
	
}

window.onload = function(){web3_load();};