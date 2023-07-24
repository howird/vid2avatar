# Download Frames from YouTube Video

- download the youtube video specifying which seconds of it you want to download 
```
yt-dlp --external-downloader ffmpeg --external-downloader-args "ffmpeg_i:-ss 0 -to 7" "link to video"
```

- rename the downloaded video
```
mv <name of video> dance.webm
```

- create specific file structure
```
mkdir -p preprocessing/raw_data/dance/frames
```

- export frames to the previous directory, here, we choose 4 frames/1sec
```
ffmpeg -i dance.webm -vf fps=4/1 preprocessing/raw_data/dance/frames/%04d.png
```
