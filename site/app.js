(() => {
  const hero = document.querySelector(".hero");
  if (!hero || document.querySelector("#momo-three")) return;

  const section = document.createElement("section");
  section.id = "momo-three";
  section.setAttribute("aria-labelledby", "momo-three-title");
  section.innerHTML = `
    <h2 id="momo-three-title">Three ways MOMO serves</h2>
    <p class="section-lead">One Human intent, recomposed for three different readers.</p>
    <ul class="role-grid">
      <li class="card card-momo">
        <h3>Show</h3>
        <p>Make 桃多郎 understandable and memorable to guests through GitHub itself.</p>
      </li>
      <li class="card card-kibi">
        <h3>Observe</h3>
        <p>Let Human see where the whole system stands, then refresh the observation when needed.</p>
      </li>
      <li class="card card-kiji">
        <h3>Transmit</h3>
        <p>Carry Human purpose, principles, and boundaries to KIBI and every present or future companion.</p>
      </li>
    </ul>
  `;

  hero.insertAdjacentElement("afterend", section);
})();

(() => {
  if (document.querySelector("#why-companions")) return;

  const style = document.createElement("style");
  style.textContent = `
    .story-quote {
      margin: 1.2rem 0 1.5rem;
      padding: 1.35rem 1.45rem;
      border-left: 4px solid var(--peach);
      background: linear-gradient(135deg, rgba(244, 199, 176, 0.55), rgba(255, 248, 241, 0.45));
      border-radius: 0 1.15rem 1.15rem 0;
      font-family: var(--serif);
      font-size: clamp(1.2rem, 3vw, 1.65rem);
      line-height: 1.45;
    }

    .story-quote p { margin: 0; }
    .story-quote small {
      display: block;
      margin-top: 0.65rem;
      color: var(--muted);
      font-family: var(--sans);
      font-size: 0.82rem;
    }

    .companion-strengths {
      display: grid;
      grid-template-columns: repeat(3, minmax(0, 1fr));
      gap: 0.75rem;
      margin-top: 1rem;
    }

    .strength {
      padding: 1rem;
      border-radius: 1.05rem;
      text-align: center;
    }

    .strength img { display: block; margin: 0 auto 0.45rem; }
    .strength strong {
      display: block;
      font-family: var(--serif);
      font-size: 1.08rem;
    }
    .strength span { color: var(--muted); font-size: 0.88rem; }
    .strength-kiji { background: var(--leaf); }
    .strength-innu { background: var(--tan); }
    .strength-saru { background: var(--sky); }

    .kibi-journey {
      display: grid;
      grid-template-columns: 1fr auto 1fr auto 1fr;
      gap: 0.75rem;
      align-items: stretch;
    }

    .kibi-stage {
      padding: 1.05rem;
      border: 1px solid rgba(201, 164, 140, 0.48);
      border-radius: 1.05rem;
      background: rgba(255,255,255,0.28);
    }

    .kibi-stage-center {
      background: var(--sand);
      border-color: var(--line);
    }

    .kibi-stage h3 { margin-bottom: 0.25rem; }
    .kibi-stage p { margin: 0; color: var(--muted); }

    .kibi-arrow {
      display: grid;
      place-items: center;
      color: var(--muted);
      font-size: 1.35rem;
    }

    .kibi-line {
      margin-top: 1.2rem;
      padding: 0.9rem 1rem;
      border-radius: 999px;
      background: var(--ink-soft);
      color: var(--paper);
      text-align: center;
      font-family: var(--serif);
    }

    .future-grid {
      display: grid;
      grid-template-columns: repeat(4, minmax(0, 1fr));
      gap: 0.7rem;
      margin-top: 1rem;
    }

    .future-role {
      min-height: 8.6rem;
      padding: 1rem 0.8rem;
      border-radius: 1.05rem;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      text-align: center;
    }

    .future-role img { margin-bottom: 0.45rem; }
    .future-role strong { font-family: var(--serif); }
    .future-role span { color: var(--muted); font-size: 0.82rem; }
    .future-new {
      border: 2px dashed var(--line);
      background: rgba(255,255,255,0.2);
    }
    .future-plus {
      font-family: var(--serif);
      font-size: 2rem;
      line-height: 1;
      margin-bottom: 0.35rem;
      color: var(--peach);
    }

    .future-rule {
      margin-top: 1.1rem;
      font-family: var(--serif);
      font-size: 1.12rem;
      text-align: center;
    }

    @media (max-width: 720px) {
      .companion-strengths { grid-template-columns: 1fr; }
      .kibi-journey { grid-template-columns: 1fr; }
      .kibi-arrow { transform: rotate(90deg); }
      .future-grid { grid-template-columns: repeat(2, minmax(0, 1fr)); }
    }
  `;
  document.head.appendChild(style);

  const mapSection = document.querySelector("#map");
  const rolesSection = document.querySelector("#roles");
  const observeSection = document.querySelector("#observe");
  if (!mapSection || !rolesSection || !observeSection) return;

  const why = document.createElement("section");
  why.id = "why-companions";
  why.setAttribute("aria-labelledby", "why-companions-title");
  why.innerHTML = `
    <h2 id="why-companions-title">Why companions?</h2>
    <p class="section-lead">Strength is not concentrated in one hero. It is composed from different strengths that remain different.</p>

    <div class="story-quote">
      <p>Momotaro does not bring three companions because he is strong. He becomes strong because each companion brings a different strength.</p>
      <small>One purpose. Different abilities. No requirement to become one thing.</small>
    </div>

    <div class="companion-strengths" aria-label="Three companion strengths">
      <article class="strength strength-kiji">
        <img src="assets/mark-kiji.svg" width="48" height="48" alt="">
        <strong>KIJI sees.</strong>
        <span>Find what matters in the world.</span>
      </article>
      <article class="strength strength-innu">
        <img src="assets/mark-innu.svg" width="48" height="48" alt="">
        <strong>INNU builds.</strong>
        <span>Turn need into something real.</span>
      </article>
      <article class="strength strength-saru">
        <img src="assets/mark-saru.svg" width="48" height="48" alt="">
        <strong>SARU acts.</strong>
        <span>Meet people and the world.</span>
      </article>
    </div>
  `;
  mapSection.insertAdjacentElement("beforebegin", why);

  const kibi = document.createElement("section");
  kibi.id = "kibidango";
  kibi.setAttribute("aria-labelledby", "kibidango-title");
  kibi.innerHTML = `
    <h2 id="kibidango-title">KIBI — the kibidango</h2>
    <p class="section-lead">Connection should not erase identity.</p>

    <div class="kibi-journey">
      <article class="kibi-stage">
        <h3>Different strengths</h3>
        <p>Each application keeps its own role, evidence, internals, and way of working.</p>
      </article>
      <div class="kibi-arrow" aria-hidden="true">→</div>
      <article class="kibi-stage kibi-stage-center">
        <h3>KIBI connects</h3>
        <p>Shared meaning, boundaries, handoff, and compatibility make a journey possible.</p>
      </article>
      <div class="kibi-arrow" aria-hidden="true">→</div>
      <article class="kibi-stage">
        <h3>Still themselves</h3>
        <p>The companions coordinate without collapsing into one giant application.</p>
      </article>
    </div>

    <p class="kibi-line">KIBI does not make the companions one. It lets them journey together while remaining themselves.</p>
  `;
  rolesSection.insertAdjacentElement("afterend", kibi);

  const future = document.createElement("section");
  future.id = "future-companions";
  future.setAttribute("aria-labelledby", "future-companions-title");
  future.innerHTML = `
    <h2 id="future-companions-title">The story is not limited to three</h2>
    <p class="section-lead">桃多郎 is designed for companions that may join, leave, evolve, or be replaced as the journey changes.</p>

    <div class="future-grid" aria-label="Present and future companion roles">
      <article class="future-role strength-kiji">
        <img src="assets/mark-kiji.svg" width="44" height="44" alt="">
        <strong>KIJI</strong><span>See</span>
      </article>
      <article class="future-role strength-innu">
        <img src="assets/mark-innu.svg" width="44" height="44" alt="">
        <strong>INNU</strong><span>Build</span>
      </article>
      <article class="future-role strength-saru">
        <img src="assets/mark-saru.svg" width="44" height="44" alt="">
        <strong>SARU</strong><span>Act</span>
      </article>
      <article class="future-role future-new">
        <div class="future-plus" aria-hidden="true">+</div>
        <strong>Next companion</strong><span>A role the journey may need later</span>
      </article>
    </div>

    <p class="future-rule">Companions may change. Human purpose remains the reason for the journey.</p>
  `;
  kibi.insertAdjacentElement("afterend", future);

  const nav = document.querySelector(".mast nav");
  if (nav && !nav.querySelector('a[href="#why-companions"]')) {
    const journeyLink = document.createElement("a");
    journeyLink.href = "#why-companions";
    journeyLink.textContent = "Journey";

    const kibiLink = document.createElement("a");
    kibiLink.href = "#kibidango";
    kibiLink.textContent = "KIBI";

    const futureLink = document.createElement("a");
    futureLink.href = "#future-companions";
    futureLink.textContent = "Future";

    nav.prepend(futureLink);
    nav.prepend(kibiLink);
    nav.prepend(journeyLink);
  }
})();

(() => {
  const cost = document.querySelector(".cost");
  if (!cost) return;

  const reduce = window.matchMedia("(prefers-reduced-motion: reduce)").matches;
  if (reduce || !("IntersectionObserver" in window)) {
    cost.classList.add("is-seen");
    return;
  }

  const observer = new IntersectionObserver(
    ([entry]) => {
      if (entry.isIntersecting) {
        cost.classList.add("is-seen");
        observer.disconnect();
      }
    },
    { threshold: 0.35 }
  );

  observer.observe(cost);
})();
