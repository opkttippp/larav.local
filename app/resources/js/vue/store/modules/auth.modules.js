import AuthService from '../../services/auth';

const user = JSON.parse(localStorage.getItem('user'));
const initialState = user
    ? {status: {loggedIn: true}, user}
    : {status: {loggedIn: false}, user: null};

export const auth = {
    namespaced: true,
    state: initialState,
    errors: [],
    actions: {
        login({commit}, user) {
            return AuthService.login(user).then((response) => {
                    if (response.errors) {
                        commit('loginFailure', response.message);
                    } else {
                        commit('loginSuccess', response);
                        return response;
                    }
                }
            ).catch((error) => {
                return commit('loginFailure', error);
            });
        },
        loginOauth({commit}, data) {
            // commit('loginSuccess', AuthService.loginOauth(data));
            // return AuthService.loginOauth(data);
            const response = AuthService.loginOauth(data);
            if (response.errors) {
                commit('loginFailure', response.message);
            } else {
                commit('loginSuccess', response);
                return response;
            }
        },
        updateUser({commit}) {
            return AuthService.updateUser().then((response) => {
                if (response.errors) {
                    commit('loginFailure', response.message);
                } else {
                    commit('loginSuccess', response);
                    return response;
                }
            });
        },
        logout({commit}) {
            AuthService.logout();
            commit('logout');
        },
        register({commit}, user) {
            return AuthService.register(user).then(
                (response) => {
                    commit('registerSuccess', response);
                }
            ).catch((error) => {
                return commit('registerFailure', error);
            });
        },
        zeroError({commit}) {
            commit('zeroError');
        },
    },
    mutations: {
        registerSuccess(state) {
            state.status.loggedIn = true;
            state.user = user;
        },
        registerFailure(state) {
            state.status.loggedIn = false;
        },
        loginSuccess(state, user) {
            state.status.loggedIn = true;
            state.user = user;
        },
        loginFailure(state, error) {
            state.status.loggedIn = false;
            state.user = null;
            state.errors = error
        },
        logout(state) {
            state.status.loggedIn = false;
            state.user = null;
            state.errors = null;
        },
        zeroError(state) {
            state.errors = null;
        },
    }
};
