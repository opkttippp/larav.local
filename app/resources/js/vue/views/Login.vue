<template>
    <div class="container">

<!-------------------------------------- Login Register Error ------------------------------------>

        <div v-if="this.errors.length" class="alert alert-danger">
            <ul>
                <li v-for="error of this.errors">{{ error }}</li>
            </ul>
        </div>

<!--------------------------------------- Send Verify Email -------------------------------------->

        <div class="content"
             v-if="showMessage"
             style="height: auto; margin: 0;"
             v-click-outside="() => {this.$emit('close', false)}"
        >
            <template v-if="status">
                <div class="alert alert-success" role="alert">
                    {{ status }} {{(amount)}}
                </div>
            </template>

            <div class="card row justify-content-center">
                <div class="card-header">Verify Your Email Address</div>
                <div class="card-body">
                    'Before proceeding, please check your email for a verification link.
                    'If you did not receive the email'
                    <button type="submit" class="btn btn-link p-0 m-0 align-baseline"
                            @click="mailResend"
                    >
                        click here to request another
                    </button>
                </div>
            </div>
        </div>

<!--------------------------------------- Send Request Password ----------------------------------->

        <div class="content" v-if="showEmail"
             style="height: auto;"
        >
            <template v-if="status">
                <div class="alert alert-success" role="alert">
                    {{ status }}
                </div>
            </template>

            <header>Change password</header>
            <form @submit.prevent="sendPassword">
                <div class="field">
                    <span class="fa fa-user"></span>
                    <input type="text" v-model="sendEmail" required placeholder="Email">
                </div>

                <div class="field">
                    <input type="submit" value="Send">
                </div>
            </form>
        </div>

<!--------------------------------------- Register Login ----------------------------------------->

        <transition name="card" mode="out-in"
                    v-if="showForm"
        >
            <div class="content" v-if="front === true" key="front"
                 v-click-outside="() => {this.$emit('close', false)}"
            >
                <header>Login Form</header>
                <form method="POST" @submit.prevent="loginUser">
                    <div class="field">
                        <span class="fa fa-user"></span>
                        <input type="text" v-model="user.login" required placeholder="Email or Login">
                    </div>
                    <div class="field space">
                        <span class="fa fa-lock"
                              @click="Unclosed"></span>
                        <input type="password" v-model="user.password" class="pass-key" required placeholder="Password">
<!--                        <span class="show">SHOW</span>-->
                    </div>
                    <div class="pass">
                        <a class="btn btn-link" @click.stop="showEmailRequest">Forgot Password?</a>
                    </div>
                    <div class="field">
                        <input type="submit" value="LOGIN">
                    </div>
                </form>
                <div class="login">
                    Or login with
                </div>
                <div class="links">
                    <div class="auth-social"
                         @click="authenticate('google')"
                         style="background-color: rgb(252, 0, 47);"
                    >
                        <i class="fab fa-google"></i>
                    </div>

                    <div class="auth-social"
                         @click="authenticate('facebook')"
                         style="background-color: rgb(68, 64, 151);"
                    >
                        <i class="fab fa-facebook-f"></i>
                    </div>

                    <div class="auth-social"
                         @click="authenticate('twitter')"
                         style="background-color: rgb(17, 140, 241);"
                    >
                        <i class="fab fa-twitter"></i>
                    </div>

                    <div class="auth-social"
                         @click="authenticate('github')"
                         style="background-color: rgb(17, 140, 241);"
                    >
                        <i class="fab fa-github"></i>
                    </div>

                    <div class="auth-social"
                         @click="authenticate('gitlab')"
                         style="background-color: rgb(17, 140, 241);"
                    >
                        <i class="fab fa-gitlab"></i>
                    </div>

                </div>
                <div class="signup">
                    Don't have account?
                    <a href="#" @click="front = false">Signup Now</a>
                </div>
            </div>

            <div class="content" v-else key="back">
                <header>Register Form</header>
                <form method="POST" @submit.prevent="registerUser">
                    <div class="field">
                        <span class="fa fa-user"></span>
                        <input id="name" type="text" v-model="userReg.name" required placeholder="Login">
                    </div>
                    <div class="field">
                        <span class="fa fa-user"></span>
                        <input id="email" type="email" v-model="userReg.email" required placeholder="Email">
                    </div>
                    <div class="field space">
                        <span class="fa fa-lock"
                        @click="Unclosed"></span>
                        <input class="pass-key" id="pass" type="password" v-model="userReg.password" required placeholder="Password">
                    </div>
                    <div class="field space">
                        <span class="fa fa-lock"
                        @click="Unclosed"></span>
                        <input class="pass-key" id="password-confirm" type="password" v-model="userReg.password_confirmation" required placeholder="Confirm password">
                    </div>
                    <div class="field">
                        <input type="submit" value="REGISTER">
                    </div>
                </form>

                <div class="signup">
                    You have account?
                    <a href="#" @click="front = true">Login</a>
                </div>
            </div>
        </transition>
    </div>


</template>

<script>

export default {
    name: "Login",
    data() {
        return {
            status: '',
            amount: 1,
            sendEmail: '',
            showForm: true,
            showMessage: false,
            showEmail: false,
            user: {
                login: '',
                password: '',
            },
            errors: [],
            front: true,
            userReg: {
                name: '',
                email: '',
                password: '',
                password_confirmation: ''
            }
        };
    },
    watch: {
    },
    computed: {
    },
    mounted() {
        window.addEventListener('message', this.onMessage, false);
    },
    beforeDestroy() {
        window.removeEventListener('message', this.onMessage);
    },
    methods: {
        async mailResend() {
            const {data} = await axios.post('http://larav.local/api/email/resend', {
                email: this.userReg.email
            })
            this.status = await data.status;
            this.amount++;
        },
        showEmailRequest(){
            this.showForm = false;
            this.showEmail = true;
        },
        async sendPassword(){
            const { data } = await axios.post('http://larav.local/api/password/email',{
                email: this.sendEmail
            });
            this.status = data.status;
            setTimeout(() => {
                this.status = '';
            }, 3000)
        },
        loginValidator() {
            this.errors = [];
            if (!this.userReg.name || this.userReg.name.length < 5) {
                this.errors.push('The login field less than 5 characters...');
            }
            if (!this.userReg.password || this.userReg.password.length < 5) {
                this.errors.push('The password field less than 5 characters...');
            }
            if (this.userReg.password !== this.userReg.password_confirmation) {
                this.errors.push('Passwords mismatch...');
            }
            if (!this.errors.length)
                return true;
        },
        Unclosed(e) {
            const item = e.target;
                    let pass_field = item.closest('.space').querySelector('.pass-key')
                    if (pass_field.type === "password") {
                        pass_field.type = "text";
                        item.style.color = "green";
                        item.classList.remove('fa-lock');
                        item.classList.add('fa-lock-open');
                    } else {
                        pass_field.type = "password";
                        item.classList.remove('fa-lock-open');
                        item.classList.add('fa-lock');
                        item.style.color = "black";
                    }
        },
        loginUser() {
            this.errors = [];
            this.$store.dispatch("auth/login", this.user)
                .then(() => {
                    if (this.$store.state.auth.errors)
                        this.errors.push(this.$store.state.auth.errors);
                    this.$store.dispatch('auth/zeroError');
                }).then(() => {
                    if (this.$store.state.auth.status.loggedIn) {
                        this.$router.push('/');
                        this.$emit('close', false);
                    }
                }
            ).catch((error) => {
                console.log(error);
            });
        },
        registerUser() {
            if (this.loginValidator()) {
                this.$store.dispatch("auth/register", this.userReg).then(
                    () => {
                        this.showForm = false;
                        this.status = 'verification.sent';
                        this.showMessage = true;
                    })
                    .catch((error) => {
                        console.log(error);
                    });
            }
            return 'error sign up';
        },

        //-----------------------vue-authenticate--------------------------------

        async authenticate(provider) {
            const newWindow = openWindow('', '_blank');

            const {data} = await axios.post(`/api/oauth/${provider}`)
            newWindow.location.href = data.url
        },
        onMessage(e) {
            console.log(e.data);
            if (e.origin !== window.origin || !e.data.access_token) {
                return
            }
            this.$store.dispatch('auth/loginOauth', {
                token: e.data.access_token,
                user: e.data.user,
            });
            this.$emit('close', false);
            this.$router.push({name: 'Home'});
            this.$emit('showMesSendEmail', true);
        }
    }
}

function openWindow(url, title, options = {}) {
    if (typeof url === 'object') {
        options = url
        url = ''
    }

    options = {url, title, width: 600, height: 720, ...options}

    const dualScreenLeft = window.screenLeft !== undefined ? window.screenLeft : window.screen.left
    const dualScreenTop = window.screenTop !== undefined ? window.screenTop : window.screen.top
    const width = window.innerWidth || document.documentElement.clientWidth || window.screen.width
    const height = window.innerHeight || document.documentElement.clientHeight || window.screen.height

    options.left = ((width / 2) - (options.width / 2)) + dualScreenLeft
    options.top = ((height / 2) - (options.height / 2)) + dualScreenTop

    const optionsStr = Object.keys(options).reduce((acc, key) => {
        acc.push(`${key}=${options[key]}`)
        return acc
    }, []).join(',')

    const newWindow = window.open(url, title, optionsStr)

    if (window.focus) {
        newWindow.focus()
    }
    return newWindow
}
</script>
<style scoped>

.content {
    position: fixed;
    top: 17%;
    left: 34%;
    z-index: 999;
    text-align: center;
    padding: 1em;
    width: 25em;
    height: 31em;
    /*transform: translate(-50%, -50%);*/
    /*background: rgba(0, 0, 0, 0.7);*/
    background: rgba(51, 51, 51, 0.7);
    box-shadow: -1px 4px 28px 0 rgba(0, 0, 0, 0.75);
}

.content header {
    color: white;
    font-size: 2em;
    margin: 0 0 1em 0;
    font-family: 'Montserrat', sans-serif;
}

.field {
    position: relative;
    height: 3em;
    margin: 1em 0;
    width: 100%;
    display: flex;
    background: rgba(255, 255, 255, 0.94);
}

.field span {
    color: #222;
    width: 40px;
    line-height: 45px;
}

.field input {
    height: 100%;
    width: 100%;
    background: transparent;
    border: none;
    outline: none;
    color: #222;
    font-size: 16px;
    font-family: 'Poppins', sans-serif;
}

/*.space {*/
/*    margin-top: 16px;*/
/*}*/

.show {
    position: absolute;
    right: 13px;
    font-size: 13px;
    font-weight: 700;
    color: #222;
    /*display: none;*/
    cursor: pointer;
    font-family: 'Montserrat', sans-serif;
}

.pass-key:valid ~ .show {
    display: block;
}

.pass {
    text-align: left;
    margin: 1em 0;
}

.pass a {
    color: white;
    text-decoration: none;
    font-family: 'Poppins', sans-serif;
}

.pass:hover a {
    text-decoration: underline;
}

.field input[type="submit"] {
    background: #3498db;
    border: 1px solid #2691d9;
    color: white;
    font-size: 18px;
    letter-spacing: 1px;
    font-weight: 600;
    cursor: pointer;
    font-family: 'Montserrat', sans-serif;
}

.field input[type="submit"]:hover {
    background: #2691d9;
}

.login {
    color: white;
    margin: 0.5em 0;
    font-family: 'Poppins', sans-serif;
}

.links {
    display: flex;
    justify-content: space-between;
    cursor: pointer;
    color: white;
    margin: 0;
}

.auth-social {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 3em;
    height: 3em;
    border-radius: 50%;
    margin: 5px;
    opacity: 70%;
}

.auth-social:hover {
    opacity: 100%;
    box-shadow: 0 0 18px rgba(255, 255, 255, 0.75);
    /*-webkit-box-shadow: 0px 0px 18px rgba(255,255,255,0.75);*/
    /*-moz-box-shadow: 0px 0px 18px rgba(255,255,255,0.75);*/
}

.facebook {
    margin-left: 0;
    background: #4267B2;
    border: 1px solid #3e61a8;
}

.instagram {
    background: #E1306C;
    border: 1px solid #df2060;
}

.facebook:hover {
    background: #3e61a8;
}

.instagram:hover {
    background: #df2060;
}

.links i {
    font-size: 17px;
}

i span {
    margin-left: 8px;
    font-weight: 500;
    letter-spacing: 1px;
    font-size: 16px;
    font-family: 'Poppins', sans-serif;
}

.signup {
    font-size: 15px;
    color: white;
    font-family: 'Poppins', sans-serif;
}

.signup a {
    color: #3498db;
    text-decoration: none;
}

.signup a:hover {
    text-decoration: underline;
}

.card-enter-from, .card-leave-to {
    /*opacity: 0;*/
    transform: rotateY(90deg);
}

.card-enter-active, .card-leave-active {
    transition: all 0.6s;
}

</style>
