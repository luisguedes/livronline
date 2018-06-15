window.onload = function () {
    console.log("LISTING")
    document.querySelectorAll('.edit-button').forEach(function (el) {
        el.onclick = function (e) {
            e.preventDefault();
            var url = el.dataset.href + el.parentElement.parentElement.querySelector('td').textContent;
            window.location = url;
        }
    });

    document.querySelectorAll('.delete-button').forEach(function (el) {
        el.onclick = function (e) {
            e.preventDefault();
            var id = el.parentElement.parentElement.querySelector('td').textContent;
            if (window.confirm("Deseja realmente deletar " + window.pageQquestion)) {
                __doPostBack(window.pageRemoveId, id);
            }
        }
    });
}