document.querySelectorAll(".input.select").forEach(function (el) {
    function toggleClass() {
        el.classList.toggle("active");
    }

    el.querySelector("label").onclick = toggleClass;
    el.querySelector(".value-holder").onclick = toggleClass;

    el.querySelectorAll("ul > li").forEach(function (opt) {
        opt.onclick = function (e) {
            el.querySelector("input").value = opt.dataset.val;
            el.querySelector(".value-holder").textContent = opt.dataset.val;
            el.classList.remove("active");
        }
    });
});