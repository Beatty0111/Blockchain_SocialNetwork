
function web3_load(){
	
	var web3 = new Web3(new Web3.providers.HttpProvider("https://rinkeby.infura.io/v3/21f8b7326a844fa38e7a56776aeb2151"));
	var abi = [
	{
		"constant": false,
		"inputs": [
			{
				"name": "followAddress",
				"type": "address"
			}
		],
		"name": "addFollow",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "tweet",
				"type": "string"
			}
		],
		"name": "createTweet",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "_lastTweet",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [],
		"name": "_name",
		"outputs": [
			{
				"name": "",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": true,
		"inputs": [
			{
				"name": "",
				"type": "uint256"
			}
		],
		"name": "_following",
		"outputs": [
			{
				"name": "",
				"type": "address"
			}
		],
		"payable": false,
		"stateMutability": "view",
		"type": "function"
	},
	{
		"constant": false,
		"inputs": [
			{
				"name": "followAddress",
				"type": "address"
			}
		],
		"name": "removeFollow",
		"outputs": [],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"name": "name",
				"type": "string"
			}
		],
		"payable": false,
		"stateMutability": "nonpayable",
		"type": "constructor"
	}
];
	var address = "0x3Abe5a1ED365496D09D302a807854D06B4A3EFb9";
	var contract = web3.eth.contract(abi);
	var contractInst = contract.at(address);
	var ans = "";
	contractInst._name(function(error, result){
		ans = result;
		document.getElementById("answer").innerHTML = ans;
	});
	
	
}

window.onload = function(){web3_load();};
