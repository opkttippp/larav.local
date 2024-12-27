<template>
    <div class="container">
        <div class="content" v-if="showEmail"
             style="height: auto;"
        >
            <div v-if="this.errors.length" class="alert alert-danger">
                <ul>
                    <li v-for="error of this.errors">{{ error }}</li>
                </ul>
            </div>

            <div v-if="status">
                <div class="alert alert-success" role="alert">
                    {{ status }}
                </div>
            </div>

            <header>Reset password</header>
            <form @submit.prevent="Reset">

                <div class="field space">
                    <span class="fa fa-lock"></span>
                    <input type="password" name="password" v-model="form.password" required Placeholder="Password">
                </div>

                <div class="field space">
                    <span class="fa fa-lock"></span>
                    <input type="password" name="password_confirmation" v-model="form.password_confirmation"
                           Placeholder="Confirm password" required>
                </div>

                <div class="field">
                    <input type="submit" value="Save">
                </div>
            </form>
        </div>
    </div>
</template>

<script>

export default {
    data() {
        return {
            status: '',
            errors: [],
            showEmail: true,
            form: {
                token: '',
                email: '',
                password: '',
                password_confirmation: ''
            }
        }
    },
    created() {
        this.form.email = this.$route.query.email
        this.form.token = this.$route.params.token
    },
    methods: {
        async Reset() {
            if (!this.loginValidator()){
                await axios.post('http://larav.local/api/password/reset', {
                    token: this.form.token,
                    email: this.form.email,
                    password: this.form.password,
                    password_confirmation: this.form.password_confirmation,
                }).then((res) => {
                    this.status = res.status;
                    setTimeout(() => {
                        this.status = '';
                        this.$router.push('/login');
                    }, 3000)
                }).catch((error) => {
                    let errors = error.response.data.errors.password;
                    errors.forEach((error) => {
                        this.errors.push(error);
                    });
                });
            }
        },
        loginValidator() {
            this.errors = [];
            if (!this.form.password || this.form.password.length < 5) {
                this.errors.push('The password field less than 5 characters...');
            }
            if (this.form.password !== this.form.password_confirmation) {
                this.errors.push('Passwords mismatch...');
            }
            return this.errors.length;
        },
    }
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

.pass-key:valid ~ .show {
    display: block;
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

</style>
