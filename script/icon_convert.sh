#!/bin/sh -e
# name: icon_convert.sh
# author: Nomura Suzume <suzume315@g00.g1e.org>
# description: convert svg sets into Vue2 template
# usage: ./script/icon_convert.sh node_modules/bootstrap-icons/icons/*

outdir=./icons
icon_dir="${0%/*}/../node_modules/bootstrap-icons/icons"

generate_template(){
	: ${1:?template name must be specified!}
	file=$1
	icon=$(basename ${file%.svg} )
	new_template=$({
		echo Fi
		echo $icon | cut -c1 | tr a-z A-Z
		echo $icon | cut -c 2-
	} | tr -d \\\n )
	output=$outdir/${new_template}.vue

	: ${file:? no file}
	: ${icon:? no icon name}
	: ${new_template:?no template name}
	: ${output:? no target output}

	echo '<template><null></null></template><script> export default { name: "FNull" } </script>' \
		| sed -r \
			-e "s@<null></null>@$(cat $file| tr -d \\\n)@g" \
			-e "s@name: \"FNull\"@name: \"$new_template\"@g" \
		> $output \
		&& echo generated $output \
		|| { echo failed to generate $output; exit 1; }
}


[ ! -d ${outdir:?no outdir} ] && mkdir -vp $outdir

if [ $# -eq 0 ] && [ -d "$icon_dir" ] ;then
	for i in $icon_dir/*
	do
		generate_template $i
	done
else
       	for i in $@
	do
		generate_template $i
	done
fi
