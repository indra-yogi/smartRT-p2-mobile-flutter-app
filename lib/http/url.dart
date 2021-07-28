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
const urlEditDivorce = urlBase + 'divorce/update/{id}';
const urlDeleteDivorce = urlBase + 'divorce/delete/{id}';
//marital url
const urlAddMarital = urlBase + 'marital/store';
const urlShowMarital = urlBase + 'marital/show/{id}';
const urlIndexMarital = urlBase + 'marital/getAll';
const urlEditMarital = urlBase + 'marital/update/{id}';
const urlDeleteMarital = urlBase + 'marital/delete/{id}';