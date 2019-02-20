document.addEventListener('turbolinks:load', function() {
    var password = document.querySelector('#user_password');
    var passwordConfirmation = document.querySelector('#user_password_confirmation');

    if (password && passwordConfirmation) {
        password.addEventListener('keyup', checkPassword);
        passwordConfirmation.addEventListener('keyup', checkPassword);
    }
});

function checkPassword() {
    var password = document.getElementById('user_password').value;
    var passwordConfirmation = document.getElementById('user_password_confirmation').value;

    if (password == '' || passwordConfirmation == '') {
        return '';
    } else if (password == passwordConfirmation) {
        document.getElementById('message').style.color = 'green';
        document.getElementById('message').innerHTML = 'Пароли совпадают!';
    } else {
        document.getElementById('message').style.color = 'red';
        document.getElementById('message').innerHTML = 'Пароли не совпадают';
    }
}