<%-- 
    Document   : SignUp
    Created on : Jan 7, 2024, 12:35:28 PM
    Author     : fauzanzairimi 
--%>

<head>
    <title>Sign Up </title>
    <style>

        div {
            text-align: center;
        }
        body{

            background-color:white;
        }

        .form-register{
            max-width: 1000px;
            width: 100%;
            margin: 0 auto;
            font: bold 14px sans-serif;
            text-align: center;
        }

        .form-register-with-email{
            position: relative;
            display: inline-block;
            vertical-align: top;
            margin-right: 30px;
            text-align: center;
        }

        .form-register-with-email .form-white-background{
            width: 570px;
            box-sizing: border-box;
            background-color: lightgray;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1);
            padding: 60px 45px;
            margin-bottom: 35px;
        }

        .form-register-with-email .form-row{
            text-align: left;
            margin-bottom: 23px;
        }

        .form-register-with-email .form-title-row{
            text-align: center;
            margin-bottom: 50px;
        }

        .form-register-with-email h1{
            display: inline-block;
            box-sizing: border-box;
            color:  #4c565e;
            font-size: 24px;
            padding: 0 20px 15px;
            border-bottom: 2px solid #e74c3c;
            margin: 0;
        }

        .form-register-with-email .form-row > label span{
            display: inline-block;
            box-sizing: border-box;
            color:  #5f5f5f;
            width: 125px;
            text-align: right;
            padding-right: 25px;
        }

        .form-register-with-email input{
            color:  #5f5f5f;
            box-sizing: border-box;
            width: 230px;
            box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);
            padding: 12px 18px;
            border: 1px solid #dbdbdb;
        }

        .form-register-with-email .form-checkbox input{
            margin-left: 128px;
            margin-right: 10px;
            width: auto;
            vertical-align: top;
        }

        .form-register-with-email .form-row .form-checkbox span{
            font-size: 12px;
            font-weight: normal;
            display: inline-block;
            text-align: left;
            width: 220px;
            margin: 0;
        }

        .form-register-with-email .form-checkbox span a{
            text-decoration: none;
            color:  #6caee0;
        }

        .form-register-with-email button{
            display: block;
            border-radius: 2px;
            background-color:  #6caee0;
            color: #ffffff;
            font-weight: bold;
            box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);
            padding: 15px 35px;
            border: 0;
            margin: 55px auto 0;
            cursor: pointer;
        }

        .form-register-with-email .form-log-in-with-existing{
            text-decoration: none;
            padding: 15px 45px;
            font-weight: normal;
            color: #7b9d62;
            background-color: #d6f0c3;
        }


        .form-sign-in-with-social{
            display: inline-block;
            max-width: 180px;
            box-sizing: border-box;
            vertical-align: top;
            text-align: center;
            margin-top: 100px;
        }

        .form-sign-in-with-social .form-title-row{
            margin-bottom: 50px;
        }

        .form-sign-in-with-social .form-title{
            box-sizing: border-box;
            color:  #4c565e;
            font-size: 24px;
            padding: 15px 20px;
            border-bottom: 2px solid #6caee0;
        }

        .form-sign-in-with-social .form-google-button{
            color:  #ffffff;
            display: block;
            width: 145px;
            height: 40px;
            font-size: 12px;
            line-height: 40px;
            background-color:  rgba(222, 110, 60, 0.9);
            box-shadow: 1px 2px 2px 0 rgba(0, 0, 0, 0.08);
            border-radius: 2px;
            margin: 8px auto;
            text-decoration: none;
        }

        .form-sign-in-with-social .form-facebook-button{
            color:  #ffffff;
            display: block;
            width: 145px;
            height: 40px;
            font-size: 12px;
            line-height: 40px;
            background-color:  rgba(75, 136, 194, 0.9);
            box-shadow: 1px 2px 2px 0 rgba(0, 0, 0, 0.08);
            border-radius: 2px;
            margin: 8px auto;
            text-decoration: none;
        }

        .form-sign-in-with-social .form-twitter-button{
            color:  #ffffff;
            display: block;
            width: 145px;
            height: 40px;
            font-size: 12px;
            line-height: 40px;
            background-color:  rgba(123, 195, 226, 0.9);
            box-shadow: 1px 2px 2px 0 rgba(0, 0, 0, 0.08);
            border-radius: 2px;
            margin: 8px auto;
            text-decoration: none;
        }

        /*  Making the form responsive. Remove these media queries
            if you don't need the form to work on mobile devices. */

        @media (max-width: 900px) {

            .form-register{
                margin: 20px auto;
            }

            .form-register-with-email{
                position: relative;
                display: block;
                margin: 0;
            }

            .form-register-with-email .form-white-background{
                margin: 0 auto 32px;
            }

            .form-register-with-email:after{
                bottom: -80px;
                left: 50%;
                margin-left: -25px;
            }

            .form-sign-in-with-social {
                margin-top: 105px;
            }

        }

        @media (max-width: 600px) {

            .form-register-with-email .form-white-background{
                width: 300px;
                padding-left: 35px;
                padding-right: 35px;
            }

            .form-register-with-email .form-row > label span{
                display: block;
                text-align: left;
                padding: 0 0 10px;
            }

            .form-register-with-email input{
                display: block;
                margin: 0 auto;
            }

            .form-register-with-email .form-checkbox input{
                display: inline-block;
                margin-left: 0;
            }

            .form-register-with-email .form-checkbox span{
                width: 200px !important;
            }

            .form-register-with-email:after{
                bottom: -80px;
                left: 50%;
                margin-left: -25px;
            }

        }

    </style>

    <script>
        function validatePassword() {
            var password = document.form.password.value;

            if (password.length < 8) {
                alert("Password must be at least 8 characters long.");
                return false;
            }
        }
    </script>

</head>




<body>


    <div class="main-content">

        <form name="form" class="mt-8 space-y-6" action="<%=request.getContextPath()%>/UserController" method="POST" onsubmit="return validatePassword()">
           
            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Sign Up User</h1>
                    </div>

                    <p style="color:lightblue">                     

                    </p>

                    </br>

                    <div class="form-row">
                        <label>
                            <span>Full Name</span>
                            <input type="text" name="username" id="username" placeholder=" Full Name">
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="email" name="useremail" id="useremail" placeholder=" Email">
                        </label>
                    </div>
                    <div class="form-row">
                        <label>
                            <span>Phone Number</span>
                           <input type="text" name="userpn" id="userpn" placeholder="0173118299">
                        </label>
                    </div>
                   
                    <div class="form-row">
                        <label>
                            <span>Password</span>
                            <input type="password" name="password" id="password" placeholder=" Password" oninput="validatePassword()">
                        </label>

                    </div>
                    <div class="form-row" style="text-align: center;">
                        <span id="passwordError" style="color: red;"></span>
                    </div>

                    <script>
                        function validatePassword() {
                            var passwordInput = document.getElementById("password");
                            var passwordError = document.getElementById("passwordError");

                            var password = passwordInput.value;

                            var hasCapitalLetter = /[A-Z]/.test(password);
                            var hasSymbol = /[!@#$%^&*()]/.test(password);

                            if (password.length < 8) {
                                passwordError.textContent = "Password must be at least 8 characters long.";
                            } else if (!hasCapitalLetter) {
                                passwordError.textContent = "Password must contain at least one capital letter.";
                            } else if (!hasSymbol) {
                                passwordError.textContent = "Password must contain at least one symbol.";
                            } else {
                                passwordError.textContent = "";
                            }
                        }
                    </script>


                    <input type="submit" name="action" value="Register">

                </div>

                <a href="ParentLogin.jsp" class="form-log-in-with-existing">Already have an account? <b> Login here </b></a>

            </div>

        </form>

    </div>

</body>
<br><!-- comment -->
</html>