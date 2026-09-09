(() => {
  if (!document.querySelector('script[src="i18n.js"]')) {
    const i18n = document.createElement("script");
    i18n.src = "i18n.js";
    i18n.async = false;
    document.head.append(i18n);
  }

  const mastNav = document.querySelector(".mast nav");
  if (mastNav && !mastNav.querySelector('a[href="cockpit.html"]')) {
    const link = document.createElement("a");
    link.href = "cockpit.html";
    link.textContent = "Current";
    mastNav.prepend(link);
  }
  if (mastNav && !mastNav.querySelector('a[href="recomposition.html"]')) {
    const link = document.createElement("a");
    link.href = "recomposition.html";
    link.textContent = "Recomposition";
    mastNav.append(link);
  }
  if (mastNav && !mastNav.querySelector('a[href="oh-dango-news.html"]')) {
    const link = document.createElement("a");
    link.href = "oh-dango-news.html";
    link.textContent = "Oh Dango News";
    mastNav.append(link);
  }

  const deeper = document.querySelector("#deeper .deeper");
  if (deeper && !deeper.querySelector('a[href="cockpit.html"]')) {
    const li = document.createElement("li");
    const link = document.createElement("a");
    link.href = "cockpit.html";
    link.textContent = "今どこ？ — Current State";
    li.append(link);
    deeper.prepend(li);
  }
  if (deeper && !deeper.querySelector('a[href="recomposition.html"]')) {
    const li = document.createElement("li");
    const link = document.createElement("a");
    link.href = "recomposition.html";
    link.textContent = "KIBI → MOMO recomposition";
    li.append(link);
    deeper.prepend(li);
  }
  if (deeper && !deeper.querySelector('a[href="oh-dango-news.html"]')) {
    const li = document.createElement("li");
    const link = document.createElement("a");
    link.href = "oh-dango-news.html";
    link.textContent = "Oh Dango News — model routing updates";
    li.append(link);
    deeper.prepend(li);
  }

  const hero = document.querySelector(".hero");
  if (hero && !document.querySelector("#current-overview")) {
    const style = document.createElement("style");
    style.textContent = `
      .current-overview{max-width:1100px;margin:-.5rem auto 2.2rem;padding:0 1.25rem}.current-overview-inner{display:grid;grid-template-columns:1fr auto;gap:1rem;align-items:center;border:1px solid rgba(113,87,67,.2);border-radius:20px;padding:1rem 1.15rem;background:rgba(255,255,255,.56);box-shadow:0 10px 32px rgba(68,45,32,.05)}.current-overview .current-label{display:flex;gap:.5rem;align-items:center;flex-wrap:wrap;font-size:.78rem;font-weight:750;letter-spacing:.03em}.current-overview .current-badge{border:1px solid rgba(113,87,67,.2);border-radius:999px;padding:.24rem .5rem;background:rgba(221,239,220,.75)}.current-overview h2{font-size:clamp(1.08rem,2.5vw,1.38rem);margin:.35rem 0}.current-overview p{margin:.25rem 0}.current-overview .current-meta{color:#6d625b;font-size:.82rem}.current-overview a.current-open{white-space:nowrap;font-weight:750}@media(max-width:700px){.current-overview-inner{grid-template-columns:1fr}.current-overview a.current-open{margin-top:.2rem}}
    `;
    document.head.append(style);

    const section = document.createElement("section");
    section.id = "current-overview";
    section.className = "current-overview";
    section.setAttribute("aria-label", "桃多郎の現在地");
    const inner = document.createElement("div");
    inner.className = "current-overview-inner";
    const body = document.createElement("div");
    const label = document.createElement("div");
    label.className = "current-label";
    const badge = document.createElement("span");
    badge.className = "current-badge";
    badge.textContent = "CURRENT";
    const meta = document.createElement("span");
    meta.className = "current-meta";
    meta.textContent = "確認時刻を読み込み中…";
    label.append(badge, meta);
    const title = document.createElement("h2");
    title.textContent = "今、どこにいる？";
    const summary = document.createElement("p");
    summary.textContent = "桃多郎の現在地を読み込んでいます。";
    body.append(label, title, summary);
    const open = document.createElement("a");
    open.className = "current-open";
    open.href = "cockpit.html";
    open.textContent = "現在地を見る →";
    inner.append(body, open);
    section.append(inner);
    hero.insertAdjacentElement("afterend", section);

    fetch("data/current-state.json", { cache: "no-store" })
      .then((res) => (res.ok ? res.json() : null))
      .then((data) => {
        if (!data) return;
        badge.textContent = data.system?.status || "UNKNOWN";
        title.textContent = data.system?.headline || "今、どこにいる？";
        summary.textContent = data.system?.summary || "桃多郎の現在地";
        if (data.observed_at) {
          const when = new Date(data.observed_at);
          meta.textContent = `${when.toLocaleString("ja-JP", { timeZone: "Asia/Tokyo" })} JST 時点 · ウォッチ ${data.system?.active_watch_count ?? "—"} · 判断待ち ${data.system?.human_decision_count ?? "—"}`;
        }
      })
      .catch(() => {
        badge.textContent = "UNKNOWN";
        meta.textContent = "確認時刻不明";
        summary.textContent = "古い情報を『今の状態』として推測表示しません。";
      });
  }

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
