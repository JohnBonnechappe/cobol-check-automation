//
// This script uses Octokit to see the details of a GitHib user
// based on their Github token.
//
var a;
var keys;

var Octokit = require ('@octokit/rest');

a="Hi. This Node.js code returns user details from GitHub";
console.log(a);
//
//hard code your github token here replacing ?????? (set up in github first!!)
//
const octokit = new Octokit.Octokit({auth:'????????????????????????????????????'});
//
//some looking around
//
//display the contents of Octokit.
//
keys = Object.keys(octokit);
console.log(keys);
//
//display getAuthenticated
//
console.log("OK");
keys = Object.keys(octokit.rest.users.getAuthenticated);
console.log(keys);
console.log("OK2");

showLogin();
//
//------------------------------------------------------------
//awaiting Octocat requires this function to be async
//
async function showLogin(){
//
//see only the login name of the user
console.log("--------------------------------");
const { data:{ login }} = await octokit.rest.users.getAuthenticated();			
console.log(login);
//
//see full details of the user
console.log("--------------------------------");
loginFull = await octokit.rest.users.getAuthenticated();
console.log(loginFull);
console.log("--------------------------------");
//
};

