document.addEventListener('turbolinks:load', function () {
    var progress_bar = document.querySelector('.progress-bar');
    
    if (progress_bar) {
        var progress_percent = progress_bar.dataset.percent;
        progress_bar.style.width=progress_percent + '%';
    }
})