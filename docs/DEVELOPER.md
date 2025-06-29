# Developer Documentation

This guide explains how to add and modify projects in the portfolio website. Follow these templates and instructions to maintain consistency across the site.

## Table of Contents
- [Adding a New Project](#adding-a-new-project)
  - [Project Card Template](#project-card-template)
  - [Project Page Template](#project-page-template)
- [Media Guidelines](#media-guidelines)
- [File Structure](#file-structure)
- [Styling Reference](#styling-reference)

## Adding a New Project

### Project Card Template
Add new project cards in the `#projects` section of `new_index.html`. Copy this template:

```html
<div class="project-card">
    <div class="slider-container">
        <!-- For single image -->
        <img src="path/to/image.jpg" alt="Project Name" />
        
        <!-- OR for multiple images/videos -->
        <div class="slider-wrapper">
            <div class="slide active">
                <img src="path/to/image1.jpg" alt="Project Name - Image 1" />
            </div>
            <div class="slide">
                <img src="path/to/image2.jpg" alt="Project Name - Image 2" />
            </div>
            <!-- Add more slides as needed -->
        </div>
        <button class="slider-arrow prev" onclick="prevSlide(this.parentElement)">
            <i class="fas fa-chevron-left"></i>
        </button>
        <button class="slider-arrow next" onclick="nextSlide(this.parentElement)">
            <i class="fas fa-chevron-right"></i>
        </button>
    </div>
    <h3>Project Name</h3>
    <p>Brief description of the project (2-3 sentences recommended)</p>
    <div class="tech-used">
        <span>technology1</span>
        <span>technology2</span>
        <span>technology3</span>
    </div>
    <a href="projects/project-name.html" class="btn">More Info</a>
</div>
```

### Project Page Template
Create a new HTML file in the `projects` folder using this template:

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Project Name - Kartikey Pathak</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto+Mono:wght@400;500;600&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <link rel="stylesheet" href="../styles.css" />
</head>
<body>
    <div class="container">
        <div class="breadcrumb">
            <a href="../index.html">Home</a>
            <span> / </span>
            <span>Project Name</span>
        </div>

        <h1>Project Name</h1>
        
        <!-- Media Section -->
        <div class="media-container">
            <!-- Add images/videos similar to project card template -->
        </div>

        <!-- Project Details -->
        <section class="section">
            <h2>Overview</h2>
            <p>Detailed project description</p>

            <h2>Technologies Used</h2>
            <div class="tech-used">
                <span>technology1</span>
                <span>technology2</span>
                <span>technology3</span>
            </div>

            <h2>Key Features</h2>
            <ul>
                <li>Feature 1</li>
                <li>Feature 2</li>
                <li>Feature 3</li>
            </ul>

            <!-- Optional Sections -->
            <h2>Challenges & Solutions</h2>
            <p>Describe challenges faced and how they were solved</p>

            <h2>Future Improvements</h2>
            <ul>
                <li>Improvement 1</li>
                <li>Improvement 2</li>
            </ul>
        </section>
    </div>

    <script src="../script.js"></script>
</body>
</html>
```

## Media Guidelines

### Images
- Format: JPG or PNG
- Resolution: 1200px × 800px recommended
- Location: Store in `Assets/projects/[project-name]/`
- Naming: Use descriptive names (e.g., `robot-arm-demo.jpg`)

### Videos
- Format: MP4
- Quality: 720p recommended
- Duration: Keep under 30 seconds
- Size: Optimize for web (under 5MB if possible)

## File Structure
```
spongefal/
├── Assets/
│   └── projects/
│       └── [project-name]/
│           ├── image1.jpg
│           ├── image2.jpg
│           └── video1.mp4
├── projects/
│   └── project-name.html
├── new_index.html
└── styles.css
```

## Styling Reference

### Colors
```css
--primary: #2563eb;
--primary-light: #3b82f6;
--secondary: #10b981;
--dark: #1e293b;
--light: #f8fafc;
```

### Common Classes
- `.btn` - Button style
- `.tech-used` - Technology tags container
- `.section` - Section wrapper
- `.slider-container` - Image/video slider
- `.project-card` - Project card on main page

### Tips
1. Always test responsive design (mobile, tablet, desktop)
2. Optimize images before uploading
3. Keep descriptions concise on project cards
4. Use consistent heading hierarchy (h1, h2, h3)
5. Maintain proper spacing between sections

## Need Help?
Refer to existing projects in the codebase as examples. Each project follows these patterns and can serve as a reference for implementation details.