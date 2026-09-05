(() => {
  const reduce = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

  const seen = (el) => {
    if (!el) return;
    if (reduce || !("IntersectionObserver" in window)) {
      el.classList.add("is-seen");
      return;
    }
    const observer = new IntersectionObserver(
      ([entry]) => {
        if (entry.isIntersecting) {
          el.classList.add("is-seen");
          observer.disconnect();
        }
      },
      { threshold: 0.35 }
    );
    observer.observe(el);
  };

  seen(document.querySelector(".cost"));
  seen(document.querySelector(".kibi-split"));

  const rail = document.querySelector(".journey-rail");
  const stages = [...document.querySelectorAll("[data-stage]")];
  if (rail && stages.length && "IntersectionObserver" in window) {
    const links = [...rail.querySelectorAll("a[data-stage]")];
    const mark = (name) => {
      links.forEach((link) => {
        if (link.dataset.stage === name) link.setAttribute("aria-current", "true");
        else link.removeAttribute("aria-current");
      });
    };
    const watcher = new IntersectionObserver(
      (entries) => {
        const visible = entries
          .filter((entry) => entry.isIntersecting)
          .sort((a, b) => b.intersectionRatio - a.intersectionRatio)[0];
        if (visible) mark(visible.target.dataset.stage);
      },
      { rootMargin: "-20% 0px -55% 0px", threshold: [0.15, 0.4, 0.7] }
    );
    stages.forEach((section) => watcher.observe(section));
  }

  const list = document.querySelector("#living-git");
  if (!list) return;

  fetch("data/evolution.json")
    .then((res) => (res.ok ? res.json() : null))
    .then((data) => {
      if (!data || !Array.isArray(data.milestones)) return;
      list.replaceChildren(
        ...data.milestones.map((item) => {
          const li = document.createElement("li");
          const title = document.createElement("h3");
          title.textContent = item.title;
          const meaning = document.createElement("p");
          meaning.textContent = item.meaning;
          const meta = document.createElement("p");
          meta.className = "commit";
          if (item.sha && item.short) {
            const link = document.createElement("a");
            link.href = `https://github.com/asklessquill/MOMO/commit/${item.sha}`;
            link.textContent = item.short;
            meta.append(link);
          } else if (item.source) {
            const link = document.createElement("a");
            link.href = `https://github.com/asklessquill/MOMO/blob/main/${item.source}`;
            link.textContent = item.source;
            meta.append(link, " — recorded after the vessel opened");
          }
          li.append(title, meaning, meta);
          return li;
        })
      );
    })
    .catch(() => {});
})();
