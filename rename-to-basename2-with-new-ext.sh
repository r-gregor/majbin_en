#! /usr/bin/env bash
# fname: rename-to-basename2-with-new-ext.sh
# descpt: rename subscripts *.srt file to base-name of movie *.mp4 file
# 20261001 v1
# last: 20261001
# ---

unset old_srt_fname
unset old_movie_fname

if [ $# -ne 2 ]; then
	printf "[E] must supply existing *.srt	and <movie> filename\n\n"
	exit 1
else
	old_srt_fname="$1"
	old_movie_fname="$2"
fi

if [ ! -f "${fname}" ]; then
	printf "[E] must supply existing *.srt  and <movie> filename\n\n"
	exit 1
fi


fbase="${old_movie_fname%.*}"
newext="srt"

newfname="${fbase}.${newext}"

printf "[i] copying $old_srt_fname to $newfname ...\n"
cp -v $old_srt_fname $newfname

printf "[i] done\n\n"

