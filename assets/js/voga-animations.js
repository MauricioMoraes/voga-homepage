// Voga Animations with Anime.js
document.addEventListener('DOMContentLoaded', function() {
    
    // Hero Section Animations
    const heroSection = document.getElementById('voga-hero');
    if (heroSection) {
        
        // Badge animation
        anime({
            targets: '.voga-badge',
            translateY: [-30, 0],
            opacity: [0, 1],
            duration: 800,
            easing: 'easeOutCubic',
            delay: 200
        });
        
        // Title animation with letter reveal
        anime({
            targets: '.voga-title',
            translateY: [50, 0],
            opacity: [0, 1],
            duration: 1000,
            easing: 'easeOutCubic',
            delay: 400
        });
        
        // Description animation
        anime({
            targets: '.voga-description',
            translateY: [30, 0],
            opacity: [0, 1],
            duration: 800,
            easing: 'easeOutCubic',
            delay: 600
        });
        
        // CTA Buttons stagger animation
        anime({
            targets: '.voga-cta-primary, .voga-cta-secondary, .voga-cta-tertiary',
            translateY: [30, 0],
            opacity: [0, 1],
            duration: 600,
            easing: 'easeOutCubic',
            delay: anime.stagger(150, {start: 800})
        });
        
        // Stats counter animation
        anime({
            targets: '.voga-stat-1',
            innerHTML: [0, 25],
            round: 1,
            duration: 2000,
            easing: 'easeOutCubic',
            delay: 1200
        });
        
        anime({
            targets: '.voga-stat-2',
            innerHTML: [0, 100],
            round: 1,
            duration: 2000,
            easing: 'easeOutCubic',
            delay: 1400
        });
        
        anime({
            targets: '.voga-stat-3',
            innerHTML: [0, 5000],
            round: 1,
            duration: 2500,
            easing: 'easeOutCubic',
            delay: 1600
        });
        
        // Floating animation for statistics icons
        anime({
            targets: '.stat-icon',
            translateY: [-5, 5],
            duration: 2000,
            direction: 'alternate',
            loop: true,
            easing: 'easeInOutSine',
            delay: anime.stagger(200, {start: 2000})
        });
        
        // Pulse animation for arrow indicators
        anime({
            targets: '.arrow-indicator',
            scale: [1, 1.1, 1],
            duration: 1500,
            loop: true,
            easing: 'easeInOutQuad',
            delay: anime.stagger(300, {start: 2500})
        });
    }
    
    // Logo animation in navigation
    anime({
        targets: '.navbar-logo',
        rotate: [0, 360],
        duration: 1000,
        easing: 'easeOutCubic',
        delay: 100
    });
    
    // Gradient text animation
    const gradientText = document.querySelector('.text-gradient');
    if (gradientText) {
        anime({
            targets: gradientText,
            background: [
                'linear-gradient(90deg, #4361EE, #6366F1)',
                'linear-gradient(90deg, #6366F1, #8B5CF6)',
                'linear-gradient(90deg, #8B5CF6, #4361EE)'
            ],
            duration: 3000,
            loop: true,
            direction: 'alternate',
            easing: 'easeInOutQuad'
        });
    }
    
    // Hover animations for CTA buttons
    document.querySelectorAll('.voga-cta-primary, .voga-cta-secondary, .voga-cta-tertiary').forEach(button => {
        button.addEventListener('mouseenter', function() {
            anime({
                targets: this,
                scale: 1.05,
                duration: 200,
                easing: 'easeOutCubic'
            });
        });
        
        button.addEventListener('mouseleave', function() {
            anime({
                targets: this,
                scale: 1,
                duration: 200,
                easing: 'easeOutCubic'
            });
        });
    });
    
    // Scroll-triggered animations for other sections
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                // Animate elements when they come into view
                anime({
                    targets: entry.target.querySelectorAll('.animate-on-scroll'),
                    translateY: [30, 0],
                    opacity: [0, 1],
                    duration: 800,
                    easing: 'easeOutCubic',
                    delay: anime.stagger(100)
                });
            }
        });
    }, observerOptions);
    
    // Observe sections for scroll animations
    document.querySelectorAll('section:not(#voga-hero)').forEach(section => {
        observer.observe(section);
    });
});