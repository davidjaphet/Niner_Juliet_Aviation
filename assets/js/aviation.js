document.addEventListener('DOMContentLoaded', initAll);
window.addEventListener('phx:page-loading-stop', initAll);

function initAll() {
  initializeMobileMenu();
  initializeSmoothScrolling();
  initScrollReveal();
  initCounters();
  initTimeline();
}

function initializeMobileMenu() {
  const btn = document.getElementById('mobileMenuButton');
  const menu = document.getElementById('mobileMenu');
  if (!btn || !menu) return;
  const newBtn = btn.cloneNode(true);
  btn.replaceWith(newBtn);
  newBtn.addEventListener('click', (e) => {
    e.preventDefault();
    menu.classList.toggle('hidden');
  });
  menu.querySelectorAll('a').forEach(link => {
    link.addEventListener('click', () => menu.classList.add('hidden'));
  });
}

function initializeSmoothScrolling() {
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
      const targetId = this.getAttribute('href');
      if (targetId === '#') return;
      const target = document.querySelector(targetId);
      if (!target) return;
      e.preventDefault();
      document.getElementById('mobileMenu')?.classList.add('hidden');
      window.scrollTo({ top: target.offsetTop - 80, behavior: 'smooth' });
    });
  });
}

function initScrollReveal() {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add('revealed');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.1 });
  document.querySelectorAll('.reveal-section').forEach(s => observer.observe(s));
}

function initTimeline() {
  const items = document.querySelectorAll('.timeline-item');
  if (!items.length) return;
  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry, i) => {
      if (entry.isIntersecting) {
        setTimeout(() => entry.target.classList.add('revealed'), i * 150);
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.2 });
  items.forEach(item => observer.observe(item));
}

function initCounters() {
  const counters = document.querySelectorAll('.counter');
  if (!counters.length) return;
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
      if (!entry.isIntersecting) return;
      const el = entry.target;
      const target = +el.dataset.target;
      const step = target / (1500 / 16);
      let current = 0;
      const timer = setInterval(() => {
        current += step;
        if (current >= target) {
          el.textContent = target;
          clearInterval(timer);
        } else {
          el.textContent = Math.floor(current);
        }
      }, 16);
      observer.unobserve(el);
    });
  }, { threshold: 0.5 });
  counters.forEach(c => observer.observe(c));
}

// Contact form
const contactForm = document.getElementById('contactForm');
if (contactForm) {
  contactForm.addEventListener('submit', function(e) {
    e.preventDefault();
    const name = document.getElementById('name').value;
    const email = document.getElementById('email').value;
    alert(`Thank you, ${name}! Your message has been received. We'll contact you at ${email} soon.`);
    contactForm.reset();
  });
}
