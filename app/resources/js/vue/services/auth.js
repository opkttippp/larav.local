import axios from 'axios';

class Auth {
    access_token;

    constructor() {
        this.token = window.localStorage.getItem('token');
        let userData = window.localStorage.getItem('user');
        this.user = userData ? JSON.parse(userData) : null;
        if (this.token) {
            axios.defaults.headers.common['Authorization'] = `Bearer ${this.token}`;
        }
    }

    loginOauth(data) {
            window.localStorage.setItem('token', data.token);
            window.localStorage.setItem('user', JSON.stringify(data.user));
            axios.defaults.headers.common['Authorization'] = `Bearer ${data.token}`;
            return data.user;
    }

    updateUser() {
        return axios.get('http://larav.local/api/auth')
            .then((res) => {
                window.localStorage.setItem('user', JSON.stringify(res.data));
                return res.data;
            })
            .catch(error => {
                return error.response.data;
            });

    }

    register(data) {
        return axios.post('http://larav.local/api/register', data).then((res) => {
            window.localStorage.setItem('token', res.data.access_token);
            window.localStorage.setItem('user', JSON.stringify(res.data.user));
            axios.defaults.headers.common['Authorization'] = `Bearer ${res.data.access_token}`;
            return res.data.user;
        }).catch((error) => {
            console.log(error);
        });
    }

    login(data) {
        return axios.post('http://larav.local/api/login', data)
            .then((res) => {
                window.localStorage.setItem('token', res.data.access_token);
                window.localStorage.setItem('user', JSON.stringify(res.data.user));
                axios.defaults.headers.common['Authorization'] = `Bearer ${res.data.access_token}`;
                return res.data.user;
            })
            .catch(error => {
                return error.response.data;
            });

    }

    check() {
        return !!this.token;
    }

    logout() {
        axios.post('http://Larav.local/api/logout')
            .then(() => {
                window.localStorage.removeItem('user');
                window.localStorage.removeItem('token');
            })
            .catch((error) => {
                console.log(error);
            });
    }
}

export default new Auth();
