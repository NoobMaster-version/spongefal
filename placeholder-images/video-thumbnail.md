# Video Thumbnails

The portfolio website references video thumbnails for your video files. Since I cannot create actual image files, here's what you need to do:

## Creating Video Thumbnails

1. For each video in your project folders, create a thumbnail image by:
   - Taking a screenshot of a representative frame from the video
   - Saving it as "video-thumbnail.jpg" in the same folder as the video

2. These thumbnails are referenced in the HTML as:
   - Assets/Kurma/video-thumbnail.jpg
   - Assets/Self Balancing Bot/video-thumbnail.jpg
   - Assets/Gesture_Controlled_Car/video-thumbnail.jpg
   - Assets/SAC/video-thumbnail.jpg

3. Alternatively, you can modify the HTML to remove the "poster" attribute from the video tags if you don't want thumbnails.

## Quick Fix Option

If you want to quickly view your portfolio without creating thumbnails, you can edit the index.html file and remove the poster attributes from the video tags, like this:

```html
<video controls>
    <source src="Assets/Kurma/IMG_4242.MP4" type="video/mp4">
    Your browser does not support the video tag.
</video>
```

This will make the videos display properly without thumbnails. 