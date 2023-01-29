search_dir='/media/sf_Common/KOGOsample/HCP100/'

for entry in `ls $search_dir`; do
    filename=$search_dir$entry
    unzip $filename -d $search_dir
done