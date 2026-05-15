// Theme Toggle Logic
document.addEventListener('DOMContentLoaded', () => {
    const themeToggleBtn = document.getElementById('theme-toggle');
    const htmlElement = document.documentElement;
    
    // Check local storage for theme preference, default to dark
    const currentTheme = localStorage.getItem('theme') || 'dark';
    
    if (currentTheme === 'dark') {
        htmlElement.classList.add('dark');
    } else {
        htmlElement.classList.remove('dark');
    }

    if (themeToggleBtn) {
        themeToggleBtn.addEventListener('click', () => {
            if (htmlElement.classList.contains('dark')) {
                htmlElement.classList.remove('dark');
                localStorage.setItem('theme', 'light');
            } else {
                htmlElement.classList.add('dark');
                localStorage.setItem('theme', 'dark');
            }
            updateThemeIcon();
        });
        updateThemeIcon();
    }

    function updateThemeIcon() {
        if (!themeToggleBtn) return;
        const isDark = htmlElement.classList.contains('dark');
        themeToggleBtn.innerHTML = isDark 
            ? '<i class="lucide-sun w-5 h-5"></i>' 
            : '<i class="lucide-moon w-5 h-5"></i>';
        
        // If lucide icons are being rendered
        if (window.lucide) {
            window.lucide.createIcons();
        }
    }
});
