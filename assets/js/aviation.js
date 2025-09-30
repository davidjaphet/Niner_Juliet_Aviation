// Mobile Menu Toggle - Use event delegation for Phoenix compatibility
document.addEventListener('DOMContentLoaded', function() {
  initializeMobileMenu();
});

// Re-initialize on Phoenix page loads
window.addEventListener('phx:page-loading-stop', function() {
  initializeMobileMenu();
});

function initializeMobileMenu() {
  const mobileMenuButton = document.getElementById('mobileMenuButton');
  const mobileMenu = document.getElementById('mobileMenu');
  
  if (mobileMenuButton && mobileMenu) {
    // Remove existing listeners
    mobileMenuButton.replaceWith(mobileMenuButton.cloneNode(true));
    const newButton = document.getElementById('mobileMenuButton');
    
    newButton.addEventListener('click', function(e) {
      e.preventDefault();
      mobileMenu.classList.toggle('hidden');
    });
  }
}

// Smooth scrolling for navigation links
function initializeSmoothScrolling() {
  document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
      e.preventDefault();
      
      const targetId = this.getAttribute('href');
      if (targetId === '#') return;
      
      const targetElement = document.querySelector(targetId);
      if (targetElement) {
        const mobileMenu = document.getElementById('mobileMenu');
        if (mobileMenu && !mobileMenu.classList.contains('hidden')) {
          mobileMenu.classList.add('hidden');
        }
        
        window.scrollTo({
          top: targetElement.offsetTop - 80,
          behavior: 'smooth'
        });
      }
    });
  });
}

// Initialize smooth scrolling
document.addEventListener('DOMContentLoaded', initializeSmoothScrolling);
window.addEventListener('phx:page-loading-stop', initializeSmoothScrolling);

// Contact form submission
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