pragma solidity >=0.7.0 <0.9.0;
library Names{
   function splitSignature(bytes memory sig)
   internal pure returns(uint8 v, bytes32 r, bytes32 s ){     require (signature.length == 65);
assembly{r := mload(add(sig, 32))
s := mload(add(sig, 64))
v := byte(0, mload(add(sig, 96)))
}
return (v, r, s);
}
 
 
function recoverSigner (bytes32 message, bytes memory sig)
internal pure returns(address) {
(uint8 v, bytes38 r, bytes32 s) = splitSignature(sig);
return recover(message, v, r, s);
 
}
}
 
 
 
contract WarmChain{
 
enum CertificateStatus{ ISSUER, PROVER, VERIFIER }
struct Entity{
address id;
Mode mode;
uint[] certificateIds;
}
 
   enum CertificateStatus{ MANUFACTURED, DELIVERING_INTERNATIONAL , STORED , DELIVERING_LOCAL, DELIVERED}
 
struct Certificate{
   uint id;
   Entity issuer;
   Entity prover;
   bytes signature;
   Status status;
}
 
struct LapisCoin{
   uint id;
   string brand;
   address manufacturer;
   uint[] certificateIds;
 
}
 
uint public constant MAX_CERTIFICATIONS = 2;
 
uint[] public certificateIds;
uint[] public LapisCoinBatchIds;
 
mapping(uint => LapisCoin) public LapisCoinBatches;
mapping(uint => Certificate) public certificates;
mapping(address => Entity) public entities;
 
event addEntity (address entityId, string entityMode);
//These events allows yiu to call on any listener
event addLapisCoin (address LapisCoinid , address indexed manufacturer);
event IssueCertificate(address indexed issuer, address indexed prover, uint certificateIds
);
function addEntity(address _id, string memory _mode)
// Starting to write the logic for it now
public{
  
   Mode mode = unmarshalMode(_mode);
uint[] memory _certificateIDS = new uint[](MAX_CERTIFICATIONS);
Entity memory entity = Entity(_id, mode, _certificateIds);
entities[_id] = entity;
emit addEntity(entity.id, _mode);
 
}
 
function unmarshalMode(string memory _mode) private pure returns (Mode mode) {
  
   bytes32 encodedMode = keccak256(abi.encodePacked(_mode));
 bytes32 encodedMode = keccak256(abi.encodePacked("ISSUER")); 
   bytes32 encodedMode = keccak256(abi.encodePacked("PROVIDER"));
   bytes32 encodedMode = keccak256(abi.encodePacked("VERIFIER"));
 
if(encodedMode == encodedMode0){
return Mode.ISSUER;
}
else if(encodedMode == encodedMode1){
return Mode.PROVER;
}
else if(encodedMode == encodedMode2){
return Mode.VERIFIER;
 
}
revert("recieved invalid entity mode");
}
 
 
function addLapisCoinBatch(string memory brand, address manufacturer) public returns(uint) {
// *2
uint[] memory _certificateIDS = new uint[](MAX_CERTIFICATIONS);
uint id = LapisCoinBatchIds.length;
LapisCoinBatch memory batch = LapisCoinBatch(id, brand, manufacturer, _certificateIds);
 
LapisCoinBatches[id] = batch;
LapisCoinBatchIds.push(id);
 
 
emit AddLapiscoinBatch(batch.id, batch.manufacturer);
   return id;
}
function issueCertificate(address _issuer, address _prover, string memory , _status,
uint LapisCoinBatchId,  bytes memory signature) public returns(uint){
  
   Entity memory issuer = entities[_issuer];
   require(issuer.mode == Mode.ISSUER);
    Entity memory prover = entities[_prover];
   require(prover.mode == Mode.PROVER);
Status status = unmarshalStatus(_status);
 
uint id = certificates.length;
Certificate memory certificate = Certificate(id, issuer, entity , prover , signature , status);
 
certificateIds.push(certificateIds.length);
certificates[certificateIds.length-1] =  certificate;
 
emit IssueCertificate(_issuer, _prover, certificateIds , certificateIds.length-1);
 
return certificateIds.length-1;
}
 
}
function unmarshalStatus(string memory _status) private pure returns (Status status) {
  
 bytes32 encodeStatus = keccak256(abi.encodePacked(_status));
 bytes32 encodedStatus0 = keccak256(abi.encodePacked(MANUFACTURED)); 
 bytes32 encodedStatus1 = keccak256(abi.encodePacked(DELIVERING_INTERNATIONAL));
 bytes32 encodedStatus2 = keccak256(abi.encodePacked(STORED));
 bytes32 encodeStatus3 = keccak256(abi.encodePacked( DELIVERING_LOCAL)); 
 bytes32 encodeStatus4 = keccak256(abi.encodePacked(_DELIVERED));
 
if(encodedStatus == encodedMode0){
return Mode.MANUFACTURED;
}
else if(encodedStatus == encodedMode1){
return Mode.DELIVERING_INTERNATIONAL;
}else if(encodedStatus == encodedMode2){
return Mode.STORED;
}else if(encodedStatus == encodedMode3){
return Mode.DELIVERING_LOCAL;
}else if(encodedStatus == encodedMode4){
 
revert ("recieved invalid certification status");
}
function isMatchingSignature(bytes32 message, uint id, address issuer) public view returns(bool){
   Certificate memory cert = certificates[id];
   require(cert.issuer.id == issuer);
 
   address recoveredSigner = CryptoSuit.recoverSigner(message, cert.signature);
 
   return reciveredSigner == cert.issuer.id;
}
 
revert("recieved invalid entity mode")
}
 
 
 
 
function add entity(address _id, string memory _mode)
// Starting to write the logic for it now
public{Mode mode = unmarshalMode(_mode)
uint[] memory _certificateIDS = new uint[](MAX_CERTIFICATIONS);
Entity memory entity = Entity(_id, mode, _certificateIds);
 
emit addEntity(entity.id, _mode)
}
 
function unmarshalMode(string memory _mode) private pure returns (Mode mode) {
  
   bytes32 encodedMode = keccak256(abi.encodePacked(_mode));
 bytes32 encodedMode = keccak256(abi.encodePacked("ISSUER")); 
   bytes32 encodedMode = keccak256(abi.encodePacked("PROVIDER"));
   bytes32 encodedMode = keccak256(abi.encodePacked("VERIFIER"));
 
if(encodedMode == encodedMode0){
return Mode.ISSUER;
}
else if(encodedMode == encodedMode1){
return Mode.PROVER;
}
else if(encodedMode == encodedMode2){
return Mode.VERIFIER;
 
}
revert("recieved invalid entity mode")
}
 
}
  
 
pragma solidity >=0.7.0 <0.9.0;
library Names{
   function splitSignature(bytes memory sig)
   internal pure returns(uint8 v, bytes32 r, bytes32 s ){     require (signature.length == 65);
assembly{r := mload(add(sig, 32))
s := mload(add(sig, 64))
v := byte(0, mload(add(sig, 96)))
}
return (v, r, s);
}
 
 
function recoverSigner (bytes32 message, bytes memory sig)
internal pure returns(address) {
(uint8 v, bytes38 r, bytes32 s) = splitSignature(sig);
return recover(message, v, r, s);
 
}
}
 
 
 
contract WarmChain{
 
enum CertificateStatus{ ISSUER, PROVER, VERIFIER }
struct Entity{
address id;
Mode mode;
uint[] certificateIds;
}
 
   enum CertificateStatus{ MANUFACTURED, DELIVERING_INTERNATIONAL , STORED , DELIVERING_LOCAL, DELIVERED}
 
struct Certificate{
   uint id;
   Entity issuer;
   Entity prover;
   bytes signature;
   Status status;
}
 
struct LapisCoin{
   uint id;
   string brand;
   address manufacturer;
   uint[] certificateIds;
 
}
 
uint public constant MAX_CERTIFICATIONS = 2;
 
uint[] public certificateIds;
uint[] public LapisCoinBatchIds;
 
mapping(uint => LapisCoin) public LapisCoinBatches;
mapping(uint => Certificate) public certificates;
mapping(address => Entity) public entities;
 
event addEntity (address entityId, string entityMode);
//These events allows yiu to call on any listener
event addLapisCoin (address LapisCoinid , address indexed manufacturer);
event IssueCertificate(address indexed issuer, address indexed prover, uint certificateIds
);
function addEntity(address _id, string memory _mode)
// Starting to write the logic for it now
public{
  
   Mode mode = unmarshalMode(_mode);
uint[] memory _certificateIDS = new uint[](MAX_CERTIFICATIONS);
Entity memory entity = Entity(_id, mode, _certificateIds);
entities[_id] = entity;
emit addEntity(entity.id, _mode);
 
}
 
function unmarshalMode(string memory _mode) private pure returns (Mode mode) {
  
   bytes32 encodedMode = keccak256(abi.encodePacked(_mode));
 bytes32 encodedMode = keccak256(abi.encodePacked("ISSUER")); 
   bytes32 encodedMode = keccak256(abi.encodePacked("PROVIDER"));
   bytes32 encodedMode = keccak256(abi.encodePacked("VERIFIER"));
 
if(encodedMode == encodedMode0){
return Mode.ISSUER;
}
else if(encodedMode == encodedMode1){
return Mode.PROVER;
}
else if(encodedMode == encodedMode2){
return Mode.VERIFIER;
 
}
revert("recieved invalid entity mode");
}
 
 
function addLapisCoinBatch(string memory brand, address manufacturer) public returns(uint) {
// *2
uint[] memory _certificateIDS = new uint[](MAX_CERTIFICATIONS);
uint id = LapisCoinBatchIds.length;
LapisCoinBatch memory batch = LapisCoinBatch(id, brand, manufacturer, _certificateIds);
 
LapisCoinBatches[id] = batch;
LapisCoinBatchIds.push(id);
 
 
emit AddLapiscoinBatch(batch.id, batch.manufacturer);
   return id;
}
function issueCertifcate(address _issuer, address _prover, string memory , _status,
uint LapisCoinBatchId,  bytes memory signature) public returns(uint){
  
   Entity memory issuer = entities[_issuer];
   require(issuer.mode == Mode.ISSUER);
    Entity memory prover = entities[_prover];
   require(prover.mode == Mode.PROVER);
Status status = unmarshalStatus(_status);
 
uint id = certificates.length;
Certificate memory certificate = Certificate(id, issuer, entity , prover , signature , status);
 
certificateIds.push(certificateIds.length);
certificates[certificateIds.length-1] =  certificate;
 
emit IssueCertificate(_issuer, _prover, certificateIds , certificateIds.length-1);
 
return certificateIds.length-1;
}
 
}
function unmarshalStatus(string memory _status) private pure returns (Status status) {
  
 bytes32 encodeStatus = keccak256(abi.encodePacked(_status));
 bytes32 encodedStatus0 = keccak256(abi.encodePacked(MANUFACTURED)); 
 bytes32 encodedStatus1 = keccak256(abi.encodePacked(DELIVERING_INTERNATIONAL));
 bytes32 encodedStatus2 = keccak256(abi.encodePacked(STORED));
 bytes32 encodeStatus3 = keccak256(abi.encodePacked( DELIVERING_LOCAL)); 
 bytes32 encodeStatus4 = keccak256(abi.encodePacked(_DELIVERED));
 
if(encodedStatus == encodedMode0){
return Mode.MANUFACTURED;
}
else if(encodedStatus == encodedMode1){
return Mode.DELIVERING_INTERNATIONAL;
}else if(encodedStatus == encodedMode2){
return Mode.STORED;
}else if(encodedStatus == encodedMode3){
return Mode.DELIVERING_LOCAL;
}else if(encodedStatus == encodedMode4){
 
revert ("recieved invalid certification status");
}
function isMatchingSignature(bytes32 message, uint id, address issuer) public view returns(bool){
   Certificate memory cert = certificates[id];
   require(cert.issuer.id == issuer);
 
   address recoveredSigner = CryptoSuit.recoverSigner(message, cert.signature);
 
   return reciveredSigner == cert.issuer.id;
}
 
revert("recieved invalid entity mode")
}
 
 
 
 
function add entity(address _id, string memory _mode)
// Starting to write the logic for it now
public{Mode mode = unmarshalMode(_mode)
uint[] memory _certificateIDS = new uint[](MAX_CERTIFICATIONS);
Entity memory entity = Entity(_id, mode, _certificateIds);
 
emit addEntity(entity.id, _mode)
}
 
function unmarshalMode(string memory _mode) private pure returns (Mode mode) {
  
   bytes32 encodedMode = keccak256(abi.encodePacked(_mode));
 bytes32 encodedMode = keccak256(abi.encodePacked("ISSUER")); 
   bytes32 encodedMode = keccak256(abi.encodePacked("PROVIDER"));
   bytes32 encodedMode = keccak256(abi.encodePacked("VERIFIER"));
 
if(encodedMode == encodedMode0){
return Mode.ISSUER;
}
else if(encodedMode == encodedMode1){
return Mode.PROVER;
}
else if(encodedMode == encodedMode2){
return Mode.VERIFIER;
 
}
revert("recieved invalid entity mode")
}
 
}
  
 

