<template>
    <modal-show>
        <template v-slot:header>
            <h6> Изменить пароль </h6>
            <button
                type="button"
                class="btn-close"
                @click="this.$emit('close')"
                aria-label="Close modal"
            >
            </button>
        </template>
        <template v-slot:body>
            <div v-if="status">
                <div class="alert alert-success" role="alert">
                    {{ status }}
                </div>
            </div>
            <div v-else-if="errors.length" class="alert alert-danger">
                <ul>
                    <li v-for="error of errors">{{ error }}</li>
                </ul>
            </div>
            <form @submit.prevent="Reset">
                <div class="personal-data__item">
                    <label for="passwordOld" class="personal-data__label"> Текущий пароль</label>
                    <div class="input_password">
                        <input v-model="form.password_old" class="form-control" name="passwordOld">
                        <span class="fa fa-lock"></span>
                    </div>
                </div>

                <div class="personal-data__item">
                    <label for="password" class="personal-data__label"> Новый пароль</label>
                    <div class="input_password">
                        <input type="password" class="form-control" name="password" v-model="form.password" required>
                        <span class="fa fa-lock"></span>
                    </div>
                </div>

                <div class="personal-data__item">
                    <label for="passwordd" class="personal-data__label"> Новый пароль еще раз
                    </label>
                    <div class="input_password">
                        <input type="password" class="form-control" name="passwordd"
                               v-model="form.password_confirmation" required>
                        <span class="fa fa-lock"></span>
                    </div>
                </div>
                <div class="personal-data__footer">
                    <button type="button" class="btn button--link"
                            @click="this.$emit('close')"
                    > Отмена
                    </button>
                    <button class="btn btn-success personal-data__edit"
                    >Сохранить
                    </button>
                </div>
            </form>
        </template>
    </modal-show>
</template>
<script>

export default {
    name: "password-modal",
    components: {},
    data() {
        return {
            status: '',
            errors: [],
            form: {
                password_old: '',
                password: '',
                password_confirmation: '',
            }
        }
    },
    mounted() {

    },
    computed: {
        user() {
            return this.$store.state.auth.user;
        },
    },
    methods: {
        loginValidator() {
            this.errors = [];
            if (!this.form.password || this.form.password.length < 8 || this.form.password_confirmation < 8) {
                this.errors.push('The password field less than 8 characters...');
            }
            if (this.form.password !== this.form.password_confirmation) {
                this.errors.push('Passwords mismatch...');
            }
            if (!this.errors.length)
                return true;
        },
        async Reset() {
            this.loginValidator();
            const {data} = await axios.post('http://larav.local/api/password/account', {
                email: this.user.email,
                password_old: this.form.password_old,
                password: this.form.password,
                password_confirmation: this.form.password_confirmation,
            });
            this.form = {};
            this.status = await data.status;
            this.errors.push(await data.error);
            setTimeout(() => {
                this.status = '';
                this.errors = '';
                this.$emit('close');
            }, 3000)
        },
    }
}

</script>

<style scoped>

.personal-data__footer {
    display: flex;
    flex-direction: row;
    align-items: center;
    margin: 1em 2em;
    padding: 0;
    vertical-align: baseline;
}

.form-control:active, :focus {
    outline: 0;
    border: none;
}

.button--link {
    display: flex;
    color: #3e77aa;
    margin: 0 1em;
    border: none;
    font: inherit;
    background-color: transparent;
}

.button--link:hover {
    color: #ff7876;
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

.personal-data__item {
    margin-top: 1em;
}

.form-control:hover {
    border-width: medium;
}

.fa {
    cursor: pointer;
    padding-right: 1em;
    padding-left: 1em;
}

.fa:hover {
    color: rgb(255, 120, 118);
}

.personal-data__label {
    font-size: 12px;
    font-weight: normal;
    color: rgb(121, 120, 120);
}

.input_password {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

</style>

