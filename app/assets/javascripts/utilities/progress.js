document.addEventListener('turbolinks:load', function() {

    var progress = document.querySelector('.progress');

    if (progress) {

        var amount =  progress.dataset.amount;
        var completed =  progress.dataset.completed;

        var width = Math.round(completed/(amount/100)) + '%';

        var progressBar = document.querySelector('.progress-bar');
        progressBar.style.width = width;
        progressBar.textContent = width;
    }
})