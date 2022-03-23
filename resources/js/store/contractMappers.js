import contractRegeleV2 from "../assets/contracts/NftoonRegeleV4.json"

let dict = {
    '0xF47a09adF4cB94Dc35a829ba7D9a33E360cf6A13':contractRegeleV2.abi
};
// var addPair = function (myKey, myValue) {
//     dict[myKey] = myValue;
// };
let getContractAbiById = function (myKey) {
    return dict[myKey];
};

export { getContractAbiById as default};