// app/javascript/parallax.js (or app/assets/javascripts/parallax.js)
document.addEventListener('DOMContentLoaded', () => {
    const parallaxLayers = document.querySelectorAll('.parallax-layer');
  
    window.addEventListener('scroll', () => {
      const scrollTop = window.pageYOffset;
  
      parallaxLayers.forEach(layer => {
        const speed = layer.getAttribute('data-speed');
        const yPos = -(scrollTop * speed);
        layer.style.transform = `translateY(${yPos}px)`;
      });
    });
  });
  