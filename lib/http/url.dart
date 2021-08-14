//Base url
const urlBase = 'http://10.0.2.2:3000/api/';
//user url
const currentUserUrl = urlBase + 'auth/currentUser';
const urlLogin = urlBase + 'auth/login';
const urlLogout = urlBase + 'auth/logout';
const urlRegister = urlBase + 'auth/register';
//divorce url
const urlDivorce = urlBase + 'divorce';
const urlShowDivorce = urlBase + 'divorce/{id}';
const urlSetStatusDivorceApproved = urlBase + 'divorce/set/{id}/APPROVED';
const urlSetStatusDivorceWaiting = urlBase + 'divorce/set/{id}/WAITING';
const urlSetStatusDivorceRejected = urlBase + 'divorce/set/{id}/REJECTED';
//marital url
const urlMarital = urlBase + 'marital';
const urlShowMarital = urlBase + 'marital/{id}';
const urlSetStatusMaritalApproved = urlBase + 'marital/set/{id}/APPROVED';
const urlSetStatusMaritalWaiting = urlBase + 'marital/set/{id}/WAITING';
const urlSetStatusMarital = urlBase + 'marital/set/';
//location url
const urlGetNeighbourhood = urlBase + 'location?type=neighbourhood&villageId={id}';
const urlGetVillage = urlBase + 'location?type=village&districtId={id}';
const urlGetDistrict = urlBase + 'location?type=district&cityId={id}';
const urlGetCity = urlBase + 'location?type=city&provinceId={id}';
const urlGetProvince = urlBase + 'location?type=province';
//statistic url
const urlAllData = urlBase + 'statistic?type=All';