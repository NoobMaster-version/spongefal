# Kartikey Pathak - Portfolio Website

A clean, responsive portfolio website built with HTML and CSS to showcase Electrical Engineering and Robotics projects.

## Overview

This portfolio website is designed to highlight your skills, projects, and achievements in the field of Electrical Engineering and Robotics. The design is clean, modern, and fully responsive, ensuring it looks great on all devices.

## Features

- Responsive design that works on mobile, tablet, and desktop
- Clean blue and white color scheme
- Sections for About, Skills, Projects, Achievements, and Contact
- Project cards with images and technology tags
- Achievement highlights with icons
- Social media and contact links
- Downloadable CV/Resume

## Getting Started

1. Clone or download this repository
2. Update the content in `index.html` with your personal information
3. Replace placeholder images with your actual project images
4. Update the links in the contact section with your actual social media profiles and email
5. Host it on your preferred web hosting platform (GitHub Pages, Netlify, etc.)

## Customization

### Adding New Projects

To add a new project, copy and paste the following HTML inside the `.projects-grid` div and update the content:

```html
<div class="project-card">
    <img src="path/to/your/image.jpg" alt="Project Name">
    <h3>Project Name</h3>
    <p>Project description goes here. Explain what the project does and your role in it.</p>
    <div class="tech-used">
        <span>Technology 1</span>
        <span>Technology 2</span>
        <span>Technology 3</span>
    </div>
</div>
```

### Changing Colors

The color scheme can be easily modified by changing the CSS variables in the `:root` section of the `styles.css` file:

```css
:root {
    --primary-color: #1a73e8;
    --primary-dark: #0d47a1;
    --primary-light: #e8f0fe;
    /* other colors... */
}
```

## Project Structure

- `index.html` - Main HTML file
- `styles.css` - CSS styling
- `Assets/` - Directory containing all project images and CV
- `placeholder-images/` - Directory containing placeholder images for projects

## Browser Compatibility

This website is designed to work on modern browsers including:
- Chrome
- Firefox
- Safari
- Edge

## License

Feel free to use this template for your personal portfolio.

## Credits

- Font Awesome for icons
- Google Fonts for typography 