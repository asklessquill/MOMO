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
