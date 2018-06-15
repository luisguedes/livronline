window.onload = function () {
    document.querySelectorAll(".input.select").forEach(function (el) {
        var holder = el.querySelector(".value-holder");
        var input = el.querySelector("input");

        function toggleClass() {
            el.classList.toggle("active");
        }

        el.querySelector("label").onclick = toggleClass;
        el.querySelector(".value-holder").onclick = toggleClass;


        el.querySelectorAll("ul > li").forEach(function (opt) {
            if (input.value != "" && opt.dataset.val == input.value) {
                holder.textContent = opt.textContent;
            }

            opt.onclick = function (e) {
                console.log(opt.dataset.val);
                input.value = opt.dataset.val;
                holder.textContent = opt.textContent;
                el.classList.remove("active");
            }
        });
    });
}