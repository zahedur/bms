<template>
    <div id="auth">
        <div class="row h-100">
            <div class="col-lg-5 col-md-6 col-sm-12">
                <div id="auth-left">
                    <div id="auth-box">
                        <div class="auth-logo">
                            <h1>BMS</h1>
                            <h5>Bakery Management System</h5>
                        </div>
                        <h3 class="auth-title">Log in</h3>
                        <form @submit.prevent="login">
                            <div class="form-group position-relative has-icon-left mb-4">
                                <input type="text" class="form-control form-control-xl" placeholder="Username" v-model="form.email">
                                <div class="form-control-icon">
                                    <i class="bi bi-person"></i>
                                </div>
                            </div>
                            <div class="form-group position-relative has-icon-left mb-4">
                                <input type="password" class="form-control form-control-xl" placeholder="Password" v-model="form.password">
                                <div class="form-control-icon">
                                    <i class="bi bi-shield-lock"></i>
                                </div>
                            </div>
                            <div class="form-check form-check-lg d-flex align-items-end">
                                <input class="form-check-input me-2" type="checkbox" value="" id="flexCheckDefault">
                                <label class="form-check-label text-gray-600" for="flexCheckDefault">
                                    Keep me logged in
                                </label>
                            </div>
                            <button class="btn btn-primary btn-block btn-lg shadow-lg mt-5">Log in</button>
                        </form>
                        <div class="text-center mt-5 text-lg fs-5">
                            <p class="text-gray-600">Don't have an account? <a href="auth-register.html" class="font-bold">Sign
                                up</a>.</p>
                            <p><a class="font-bold" href="auth-forgot-password.html">Forgot password?</a>.</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-7 col-md-6 col-sm-12 d-none d-md-block">
                <div id="auth-right">

                </div>
            </div>
        </div>

    </div>
</template>

<script>
export default {
    name: "login",
    //middleware: 'auth',
    data() {
        return {
            form: new Form({
                email: 'zahedurr47@gmail.com',
                password: '123456789'
            })
        }
    },

    methods: {
        login() {
            this.startLoading();
            this.form.post('auth/login')
                .then(res => {
                    localStorage.setItem('auth', JSON.stringify(res.data));
                    this.$store.commit('auth/setAuthData');
                    this.$store.dispatch('auth/isAuthenticated');
                    this.$router.push({ name: 'dashboard' });
                    this.endLoading();
                })
                .catch(err => {

                })
        }
    }
}
</script>

<style scoped>
    body {
        background-color:#fff
    }

    #auth{
        height:100vh;overflow-x:hidden
    }

    #auth #auth-right {
        height:100%;
        background: url('../../assets/images/bg/4853433.jpg'),linear-gradient(90deg,#2d499d,#3f5491)
    }

    #auth #auth-left {
        padding: 50px;
        display: flex;
        width: 100%;
        justify-content: center;
        align-items: center;
    }

    #auth-box {
        width: 100%;
        max-width: 450px;
    }

    #auth #auth-left .auth-title {
        font-size: 36px;
        margin-bottom:1rem
    }
    #auth #auth-left .auth-subtitle {
        font-size: 1.7rem;
        line-height: 2.5rem;
        color:#a8aebb
    }

    #auth #auth-left .auth-logo {
        margin-bottom:7rem
    }

    #auth #auth-left .auth-logo img {
        height:2rem
    }

    @media screen and (max-width:767px){
        #auth #auth-left {
            padding: 20px;
        }
    }
</style>
