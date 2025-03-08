#!/usr/bin/sed -rnf

s/\"ThumbKey ([^\"]*)\"/\"ThumbKey Two-Hands \1\"/

/<row>/{	# If we find a line containing row, then
	p		# Print <row>
	n		# Take next line
	N		# Add second line
	N		# Add third line
	h		# Add three lines to hold space
	p		# Print pattern space
	R middle.xml
	N		# Read a line from file and print it
}

x;z;x	# Clear hold space

/<\/keyboard>/{
	x	# Save to hold space
	e cat bottom.xml
	x	# Bring back from hold space
}

p
