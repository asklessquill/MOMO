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
