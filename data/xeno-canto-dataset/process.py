import glob
import shutil
import os 
import numpy as np
import json

species_list = set()
species_map = {}

### Loop over files and get a list of unique species
for file in glob.glob('all/wav/*.wav'):
	filename = os.path.basename(file).replace('.wav','')
	species_name = ''
	song_number = ''
	for c in filename: 
		if c.isalpha():
			species_name += c
		else:
			song_number += c
	species_list.add(species_name)
	species_map[species_name] = np.abs(hash(species_name))
	new_filename = str(np.abs(hash(species_name)))+'_'+song_number+'.wav'
	# shutil.copy(file, os.path.join('all/wav_new/',new_filename))
 
species_map = {k: int(v) for k,v in species_map.items()}

with open('bird_map.json', 'w') as f:
	json.dump(species_map, f)