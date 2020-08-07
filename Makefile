pixelate:
	ffmpeg -i raw.mp4 -filter_complex \
	"[0:v] scale='iw/5:-1', scale='1920x1080:flags=neighbor'" 5px.mp4

	ffmpeg -i raw.mp4 -filter_complex \
	"[0:v] scale='iw/10:-1', scale='1920x1080:flags=neighbor'" 10px.mp4

	ffmpeg -i raw.mp4 -filter_complex \
	"[0:v] scale='iw/15:-1', scale='1920x1080:flags=neighbor'" 15px.mp4

	ffmpeg -i raw.mp4 -filter_complex \
	"[0:v] scale='iw/25:-1', scale='1920x1080:flags=neighbor'" 25px.mp4

	ffmpeg -i raw.mp4 -filter_complex \
	"[0:v] scale='iw/50:-1', scale='1920x1080:flags=neighbor'" 50px.mp4

play:
	ffmpeg -i 5px.mp4 -i 15px.mp4 -i 25px.mp4 -filter_complex "[0:v][1:v][2:v]hstack=inputs=3[v]" -map "[v]" merged.mp4
gif:
	ffmpeg -t 3 -i video/raw.mp4 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 raw.gif
	ffmpeg -t 3 -i video/5px.mp4 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 5px.gif
	ffmpeg -t 3 -i video/10px.mp4 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 10px.gif
	ffmpeg -t 3 -i video/15px.mp4 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 15px.gif
	ffmpeg -t 3 -i video/25px.mp4 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 25px.gif
	ffmpeg -t 3 -i video/50px.mp4 -vf "fps=10,scale=320:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" -loop 0 50px.gif