document.addEventListener('turbolinks:load', function() {
    var form = document.querySelector('.registration');

    if (form) { passwordConfirmation() }
});

function passwordConfirmation() {

    var password = document.getElementById('user_password');
    var passwordConfirmation = document.getElementById('user_password_confirmation');
    passConfWrong = document.querySelector('.password-alert');
    passConfSuccess = document.querySelector('.password-success');

    password.addEventListener('keyup', checkDifference);
    passwordConfirmation.addEventListener('keyup', checkDifference);

    function checkDifference() {
        passCon = passwordConfirmation.value;
        pass = password.value;

        if (pass == passCon) {
            showSuccess();
            hideAlert();
            return;
        } else if (passCon == '') {
            hideAlert();
            return;
        } else {
            passConfWrong.classList.remove('hide');
        }
    }

    function hideAlert() {
        passConfWrong.classList.add('hide');
    }

    function showAlert() {
        passConfWrong.classList.remove('hide');
    }
}
function showSuccess() {
    passConfSuccess.classList.remove('hide');
}
