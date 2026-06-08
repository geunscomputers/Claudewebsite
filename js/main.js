/* ============================================
   Claude Uitleg — Gedeelde JavaScript
   ============================================ */

// Mobile menu toggle
function toggleMenu() {
  const menu = document.getElementById('mobileMenu');
  if (menu) menu.classList.toggle('open');
}

// Sluit mobiel menu bij klik buiten
document.addEventListener('click', function (e) {
  const menu = document.getElementById('mobileMenu');
  const hamburger = document.querySelector('.nav-hamburger');
  if (!menu || !hamburger) return;
  if (menu.classList.contains('open') &&
      !menu.contains(e.target) &&
      !hamburger.contains(e.target)) {
    menu.classList.remove('open');
  }
});

// Fade-up animatie bij scrollen
const observer = new IntersectionObserver(function (entries) {
  entries.forEach(function (entry) {
    if (entry.isIntersecting) {
      entry.target.classList.add('visible');
      observer.unobserve(entry.target);
    }
  });
}, { threshold: 0.12 });

document.querySelectorAll('.fade-up').forEach(function (el) {
  observer.observe(el);
});

// Maak toggleMenu globaal beschikbaar voor de inline onclick handlers
window.toggleMenu = toggleMenu;
