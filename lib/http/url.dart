//Base url
const urlBase = 'http://10.0.2.2:8000/api/';
//user url
const currentUserUrl = urlBase + 'user/userProfile';
const urlLogin = urlBase + 'auth/login';
const urlLogout = urlBase + 'auth/logout';
const urlRegister = urlBase + 'auth/register';
//divorce url
const urlAddDivorce = urlBase + 'divorce/store';
const urlShowDivorce = urlBase + 'divorce/show/{id}';
const urlIndexDivorce = urlBase + 'divorce/getAll';
const urlValidateDivorce = urlBase + 'divorce/index';
const urlEditDivorce = urlBase + 'divorce/update/{id}';
const urlDeleteDivorce = urlBase + 'divorce/delete/{id}';
const urlUpdateStatusDivorce = urlBase + 'divorce/statusUpdate/{id}';
//marital url
const urlAddMarital = urlBase + 'marital/store';
const urlShowMarital = urlBase + 'marital/show/{id}';
const urlIndexMarital = urlBase + 'marital/getAll';
const urlValidateMarital = urlBase + 'marital/index';
const urlEditMarital = urlBase + 'marital/update/';
const urlDeleteMarital = urlBase + 'marital/delete/{id}';
const urlUpdateStatusMarital = urlBase + 'marital/statusUpdate/{id}';
//location url
const urlGetNeighbourhood = urlBase + 'location?type=neighbourhood&villageId={id}';
const urlGetVillage = urlBase + 'location?type=village&districtId={id}';
const urlGetDistrict = urlBase + 'location?type=district&cityId={id}';
const urlGetCity = urlBase + 'location?type=city&provinceId={id}';
const urlGetProvince = urlBase + 'location?type=province';